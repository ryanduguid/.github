# Contributing

This is the account-level default. Most repositories here ship their own
`CONTRIBUTING.md` with the setup steps, the test commands and the data boundary
that apply to that project; where one exists, it overrides this file and it is
the one to follow.

## Before you open anything

Strip the data. Do not put a real trial balance, payroll export, employee
record, client name, ABN, TFN, tenant ID, access token or `.env` content into an
issue, a pull request, a commit message or a discussion. Reproduce with
fabricated values, or describe the shape of the data instead of the data.

## Issues

Use the issue forms. The bug form asks for the reproduction command and the
smallest fabricated input that still shows the problem; a report without one
usually cannot be actioned.

For anything that touches a rate, a threshold, a deadline or a calculation,
cite the primary source: the section of the Act, the legislative instrument,
the ruling, or the ATO page. "The number looks wrong" is a starting point, not
a finding.

Security vulnerabilities do not go in issues. Use the repository's Security tab
and "Report a vulnerability", which opens a private advisory, and see that
repository's `SECURITY.md`.

## Pull requests

- Keep it single-purpose. A bug fix plus a reformat is two pull requests.
- Add a test that fails on the base commit and passes with your change, and say
  which test that is. A green suite proves nothing when the defect was never
  covered.
- Show the commands you ran and what they printed, rather than asserting that
  the tests pass.
- When you change a rule, update everything that documents or enforces it in
  the same pull request. A changed threshold with a stale docstring or an
  unchanged validation check is a half fix.
- Cite the primary source for any changed number, in the pull request body.

## What these projects will not do

They produce evidence for a human reviewer. They do not post journals, move
money, lodge with the ATO, or replace professional judgement. A contribution
that moves the final accounting or tax decision away from a person will be
declined regardless of how well it is written.

Nothing here is tax, accounting, legal or financial advice, and no thread in
these repositories creates a professional engagement.

## Expectations

One maintainer, working on this outside business hours from Newcastle, NSW.
Small, well-scoped, well-evidenced changes get looked at quickly. Large
unannounced rewrites may sit for a while, so open an issue first if the change
is substantial.

Behaviour in these spaces is covered by the [code of conduct](CODE_OF_CONDUCT.md).
