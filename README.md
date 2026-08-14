# Default community health files

This repository holds the account-level defaults that GitHub applies to every
public repository owned by [@ryanduguid](https://github.com/ryanduguid) that
does not ship its own copy of a given file.

| File | Applies to |
| --- | --- |
| `CODE_OF_CONDUCT.md` | all repositories |
| `CONTRIBUTING.md` | repositories without their own contribution guide |
| `SECURITY.md` | repositories without their own security policy |
| `.github/ISSUE_TEMPLATE/` | all repositories with issues enabled |
| `.github/PULL_REQUEST_TEMPLATE.md` | all repositories |

A repository that needs different wording overrides a default simply by
committing its own file at the same path. Repository-specific security policies
therefore continue to describe their own trust boundaries, while this default
covers this repository and future repositories that do not yet have one.

## Why the templates ask about data

These repositories deal with Australian accounting, payroll and tax workflows.
Bug reports in that space tend to arrive with a real trial balance, payroll
export or client name attached. Both issue forms make the redaction step an
explicit, blocking checkbox, and blank issues are disabled so that boundary
cannot be bypassed through GitHub's free-form issue editor.

Never paste client, taxpayer, employee or payroll data into an issue or pull
request. Reproduce with fabricated data, or describe the shape of the data
instead of the data itself.
