# Default community health files

This repository holds the account-level defaults that GitHub applies to every
public repository owned by [@ryanduguid](https://github.com/ryanduguid) that
does not ship its own copy of a given file.

| File | Applies to |
| --- | --- |
| `CODE_OF_CONDUCT.md` | all repositories |
| `.github/ISSUE_TEMPLATE/` | all repositories with issues enabled |
| `.github/PULL_REQUEST_TEMPLATE.md` | all repositories |

A repository that needs different wording overrides a default simply by
committing its own file at the same path. `CONTRIBUTING.md` and `SECURITY.md`
are deliberately not defaulted here: every repository ships its own, because the
data boundary and the verification commands differ per project.

## Why the templates ask about data

These repositories deal with Australian accounting, payroll and tax workflows.
Bug reports in that space tend to arrive with a real trial balance, payroll
export or client name attached. Both templates make the redaction step an
explicit, blocking checkbox rather than a line of prose that gets skimmed.

Never paste client, taxpayer, employee or payroll data into an issue or pull
request. Reproduce with fabricated data, or describe the shape of the data
instead of the data itself.
