#!/usr/bin/env bash
# Cases for .githooks/commit-msg kept in this repository alone. The hook and
# tests/test_commit_msg_hook.sh are byte-for-byte copies of release-policy's
# (the hook workflow's parity job compares them), so cases added here, not
# there, give each rule an accepted and a refused message and run every line
# of the hook; tests/coverage/measure.sh holds that at 100%.
set -u

HOOK=${1:-$(cd "$(dirname "$0")/.." && pwd)/.githooks/commit-msg}
WORK=$(mktemp -d)
trap 'cd /; rm -rf "$WORK"' EXIT
cd "$WORK" || exit 1
git init -q .

pass=0
fail=0

# check <allow|block> <label> <message> [author-name]
# Runs the hook as `$SH "$HOOK"` with the PATH in $path, so a case can narrow
# what the hook finds; an empty $path keeps the caller's.
check() {
	want=$1
	label=$2
	printf '%s\n' "$3" >msg.txt
	if GIT_AUTHOR_NAME="${4-Ryan Duguid}" GIT_AUTHOR_EMAIL=ryan@duguid.com.au \
		GIT_COMMITTER_NAME="Ryan Duguid" GIT_COMMITTER_EMAIL=ryan@duguid.com.au \
		PATH="${path:-$PATH}" "$SH" "$HOOK" msg.txt >/dev/null 2>err.txt; then
		verdict=allow
	else
		verdict=block
	fi
	if [[ "$verdict" = "$want" ]]; then
		pass=$((pass + 1))
		printf 'ok   %-6s %s\n' "$want" "$label"
	else
		fail=$((fail + 1))
		printf 'FAIL want=%-6s got=%-6s %s\n' "$want" "$verdict" "$label"
		sed 's/^/         /' err.txt | head -3
	fi
}

SH=$(command -v sh)
path=

echo "--- footers without a vendor ---"
check allow "a robot emoji line naming no tool" "$(printf 'Fix\n\n\xf0\x9f\xa4\x96 Generated with care')"
check allow "a generated-with line naming no tool" 'Fix

Generated with a template'

echo "--- product work that names a tool ---"
# Each allowed subject names a tool next to a credit verb, but as the thing
# worked on, so it is a product reference rather than a credit. None starts
# with the verb, which the generated-with footer rule would refuse.
check allow "an implementation using a tool's API" 'Add the importer, implemented with Claude Code API'
check block "an implementation credited to a tool" 'Add the importer, implemented with Claude Code'
check allow "a fix that handles a tool's errors" 'Timeouts fixed by handling Claude errors'
check block "a fix credited to a tool" 'Timeouts fixed by Claude'
check allow "a policy that rejects tool-generated commits" 'Reject Claude generated commits'
check block "a commit a tool generated" 'Claude generated this commit'

echo "--- identities git cannot form ---"
# git var fails on an empty name, so the hook receives no identity at all.
check block "an author identity git refuses" 'Publish' ''
check allow "a human identity" 'Publish' 'Ryan Duguid'

echo "--- interpreter lookup ---"
# Where only `python` is installed, the hook falls back to it.
mkdir -p onlypython
ln -s "$(command -v git)" onlypython/git
ln -s "$(command -v python3)" onlypython/python
path=$WORK/onlypython
check allow "python stands in for a missing python3" 'Fix a thing'
check block "python still refuses a credit" 'Fix

Co-Authored-By: Claude <noreply@anthropic.com>'
path=

echo
echo "commit-msg hook (extra cases): $pass passed, $fail failed"
[[ "$fail" -eq 0 ]]
