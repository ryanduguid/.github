<p align="center">
  <picture>
    <source media="(max-width: 600px) and (prefers-color-scheme: light)" srcset=".github/assets/banner-phone-light.svg">
    <source media="(max-width: 600px)" srcset=".github/assets/banner-phone.svg">
    <source media="(prefers-color-scheme: light)" srcset=".github/assets/banner-light.svg">
    <img src=".github/assets/banner.svg" width="100%" alt=".github. Default community files for every repository. Pixel art of a signpost with two arrow boards beside the .github wordmark in slab-serif block letters.">
  </picture>
</p>

<div align="center">

[![forms](https://github.com/ryanduguid/.github/actions/workflows/forms.yml/badge.svg?branch=main)](https://github.com/ryanduguid/.github/actions/workflows/forms.yml)
[![CodeQL](https://github.com/ryanduguid/.github/actions/workflows/codeql.yml/badge.svg?branch=main)](https://github.com/ryanduguid/.github/actions/workflows/codeql.yml)
[![SonarCloud](https://sonarcloud.io/api/project_badges/measure?project=ryanduguid_.github&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=ryanduguid_.github)
[![Codacy code quality](https://app.codacy.com/project/badge/Grade/e1ac7f96416b4b379e8d02ae0c792754)](https://app.codacy.com/gh/ryanduguid/.github/dashboard)<br>
[![OpenSSF Scorecard](https://raw.githubusercontent.com/ryanduguid/.github/badges/ryanduguid/.github.svg)](https://scorecard.dev/viewer/?uri=github.com/ryanduguid/.github)<br>
[![licence: CC BY 4.0](.github/assets/badges/licence.svg)](LICENSE)

</div>

GitHub applies these account-level defaults to public repositories owned by
[@ryanduguid](https://github.com/ryanduguid) when a repository does not provide
its own version.

The issue and pull request templates require fabricated examples and keep
client, taxpayer, employee, payroll, credential and other sensitive data out of
public project discussions.

## What a repository inherits

| File | What it does |
| --- | --- |
| `CODE_OF_CONDUCT.md` | Sets the behaviour standard for issues, pull requests and discussions, including the rule against posting someone else's real data. |
| `CONTRIBUTING.md` | Explains how to strip data before opening anything and which issue form to use. It requires a primary-source citation for any changed rate, threshold or deadline. |
| `SECURITY.md` | Points a suspected vulnerability at the affected repository's private reporting feature instead of a public issue, and states the acknowledgement window. |
| `SUPPORT.md` | Routes bug reports, security reports and tax or accounting questions to the right channel, and says what these repositories are not. |
| `.github/ISSUE_TEMPLATE/bug_report.yml` | The bug form: a data-boundary checkbox, the actual result, the reproduction command and the smallest fabricated input. |
| `.github/ISSUE_TEMPLATE/feature_request.yml` | The feature or change form: a data-boundary checkbox, the workflow problem it solves and the proposal. |
| `.github/ISSUE_TEMPLATE/config.yml` | Turns off blank issues and offers the contact links for a security report and for tax or accounting advice. |
| `.github/PULL_REQUEST_TEMPLATE.md` | The pull request body: what changes, why with a primary source, verification commands and results, a final review tied to the head commit, and the merge checklist. |

A repository's own copy of any of these files overrides the default, and GitHub
then ignores the version here for that repository.

The [shared review process](docs/pr-review-process.md) explains the final record
and the evidence needed to assess reviewer usefulness and cost. Repositories
with their own templates need to adopt the same fields explicitly.

## What this repository keeps to itself

`.github/dependabot.yml`, `.github/CODEOWNERS`, `LICENSE`, `AGENTS.md` and the
workflows under `.github/workflows/` apply to this repository only. GitHub does
not inherit them, so each repository needs its own.

---

<p align="center"><sub>Better call <code>.github</code>.<br>Made in Newcastle, Australia by <a href="https://duguid.com.au/">Ryan Duguid</a>.</sub></p>
