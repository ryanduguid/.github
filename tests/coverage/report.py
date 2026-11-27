"""Join kcov's shell lines and coverage.py's checker lines for the hook.

Usage: report.py <hook> <coverage dir>

The hook's Python checker is a quoted here-document, so its lines belong to
coverage.py (measured from the identical file the python3 stand-in wrote) and
every other line to kcov. Writes <coverage dir>/commit-msg.lcov with the
hook's own line numbers and exits 1 unless every measured line ran.
"""

import json
import os
import sys


def main(hook, out):
    with open(hook, encoding="utf-8") as handle:
        lines = handle.read().split("\n")
    opener = next(i for i, line in enumerate(lines) if line.endswith("<<'PY'"))
    end = lines.index("PY", opener + 1)
    # Hook line numbers (1-based) of the first and last checker line.
    first, last = opener + 2, end

    with open(os.path.join(out, "commit-msg.py"), encoding="utf-8") as handle:
        checker = handle.read()
    if checker != "\n".join(lines[opener + 1:end]) + "\n":
        sys.exit("report: the measured checker differs from the hook's here-document")

    hits = {}
    # kcov counts here-document lines and the closing delimiter as shell code.
    with open(os.path.join(out, "kcov", "commit-msg", "codecov.json"), encoding="utf-8") as handle:
        (shell,) = json.load(handle)["coverage"].values()
    for number, count in shell.items():
        number = int(number)
        if not first <= number <= last + 1:
            hits[number] = int(count)

    with open(os.path.join(out, "python.json"), encoding="utf-8") as handle:
        files = json.load(handle)["files"]
    (measured,) = files.values()
    for number in measured["executed_lines"]:
        hits[number + first - 1] = 1
    for number in measured["missing_lines"]:
        hits.setdefault(number + first - 1, 0)

    missed = sorted(number for number, count in hits.items() if count == 0)
    with open(os.path.join(out, "commit-msg.lcov"), "w", encoding="utf-8") as handle:
        handle.write("SF:.githooks/commit-msg\n")
        for number in sorted(hits):
            handle.write("DA:%d,%d\n" % (number, hits[number]))
        handle.write("LF:%d\nLH:%d\nend_of_record\n" % (len(hits), len(hits) - len(missed)))

    print("commit-msg: %d of %d lines ran (%.2f%%)"
          % (len(hits) - len(missed), len(hits), 100 * (len(hits) - len(missed)) / len(hits)))
    if missed:
        print("commit-msg: lines never run: " + ", ".join(map(str, missed)))
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:]))
