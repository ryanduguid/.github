# Accessibility

## Goals

These repositories aim to work with a keyboard and a screen reader: images carry
alt text, headings keep their order, links name where they go and tools take
keyboard input. These are aims, not a conformance claim: this file claims no
conformance with WCAG or another accessibility standard.

## Known barriers

- Mermaid diagrams in READMEs rely on the surrounding prose unless they carry
  their own title and description.
- Excel workbooks and Power BI reports may depend on layout and colour.
- Most tools have no recorded test with Narrator or another screen reader.

A repository's own `ACCESSIBILITY.md` overrides this file and can say more.

## Report a barrier

Use the affected repository's **Issues** tab and the bug report form. Say what
you were doing and which browser, screen reader or other tool you used, and use
fabricated data in any example. If you cannot use the form, email
[ryan@duguid.com.au](mailto:ryan@duguid.com.au) with `ACCESSIBILITY` in the
subject line.

Do not paste client, taxpayer, employee or payroll data, taxpayer identifiers
such as tax file numbers, or credentials, and do not attach confidential files.

Some repositories here are contribution forks of upstream projects. A barrier in
the upstream code belongs to that project, so report it there; use this process
only for something introduced by this account's changes.

There is no guaranteed response time, as [SUPPORT.md](SUPPORT.md) explains.
