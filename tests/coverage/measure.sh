#!/usr/bin/env bash
# Measure the line coverage of .githooks/commit-msg under its tests and write
# coverage/commit-msg.lcov for Codecov. kcov reads the shell lines and
# coverage.py the Python checker the hook pipes to its interpreter; report.py
# joins them on the hook's own line numbers and fails below 100%.
#
#     KCOV=/path/to/kcov PYTHON=/path/to/python bash tests/coverage/measure.sh
#
# PYTHON must be able to import coverage. kcov runs the hook under bash.
set -euo pipefail

repo=$(cd "$(dirname "$0")/../.." && pwd)
out=$repo/coverage
rm -rf "$out"
mkdir -p "$out"

export HOOK_COVERAGE_REPO=$repo HOOK_COVERAGE_DIR=$out
HOOK_COVERAGE_KCOV=$(command -v "${KCOV:-kcov}")
HOOK_COVERAGE_PYTHON=$(command -v "${PYTHON:-python3}")
export HOOK_COVERAGE_KCOV HOOK_COVERAGE_PYTHON
"$HOOK_COVERAGE_PYTHON" -I -c 'import coverage'

status=0
for test in "$repo"/tests/test_commit_msg_hook*.sh; do
	PATH="$repo/tests/coverage/bin:$PATH" bash "$test" "$repo/tests/coverage/hook" || status=1
done

"$HOOK_COVERAGE_PYTHON" -I -m coverage combine --quiet --data-file="$out/python.coverage" "$out"
"$HOOK_COVERAGE_PYTHON" -I -m coverage json --quiet --data-file="$out/python.coverage" -o "$out/python.json"
"$HOOK_COVERAGE_PYTHON" -I "$repo/tests/coverage/report.py" "$repo/.githooks/commit-msg" "$out" || status=1
exit "$status"
