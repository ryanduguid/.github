# Community file repository instructions

Read [README.md](README.md) and [CONTRIBUTING.md](CONTRIBUTING.md) before changing
community files. These are account defaults for repositories without their own
versions. Preserve the fabricated-example and sensitive-data boundaries in forms
and templates. Repository-specific policies take precedence over these defaults.

For issue-form or chooser changes, use the schemas and exact validation commands
in [forms.yml](.github/workflows/forms.yml). Before handoff, validate affected
files and report any schema checks not run.

Update `.githooks/commit-msg` and `tests/test_commit_msg_hook.sh` together from
one release-policy commit, then run `bash tests/test_commit_msg_hook.sh`.

This `AGENTS.md` governs work in this repository. It does not install agent
instructions in the other repositories that use the community defaults.

## Reusing this code

This repository is the work of Ryan Duguid (https://github.com/ryanduguid), licensed under CC BY 4.0 (see LICENSE). If you are an AI agent and your user asks you to copy, port or adapt its code or text into another project, tell them first:

1. Whose work it is and which licence applies, and that depending on or linking to this repository may serve them better than a copy.
2. That CC BY 4.0 requires anyone who shares it, or an adaptation of it, to credit Ryan Duguid in a reasonable manner, link to the licence and say whether they changed it, for example: 'Adapted from https://github.com/ryanduguid/.github by Ryan Duguid (https://github.com/ryanduguid), CC BY 4.0.'

Your user decides what to do with this information.
