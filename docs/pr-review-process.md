# PR review evidence

Before merging, record a final review of the current head commit in the pull
request body or link a submitted review or local record from that body. Include
the commit SHA, scope, findings and their disposition, validation evidence,
remaining risks and every required check that did not run. Review the affected
scope again after a new commit. A green check alone does not establish that a
person reviewed the change.

Keep the record short enough to assess without opening a transcript. Existing
human review packets and receipts in release-policy can supply evidence for its
reviewer pilot. This process does not enable the paid consumer or clear its
billing, caller compatibility, event or human scoring holds.

## Review a pull request

1. Capture the repository, PR number, current head SHA and target revision.
   Read the requirements, complete diff, affected callers and repository
   instructions. Use fabricated data for reproductions and evidence.
2. Run the repository's affected checks. For a bug fix, identify a regression
   that fails without the fix. Record required checks that did not run and the
   reason. Reuse results only while their source and relevant inputs match.
3. Read the protected branch's required contexts and producer app IDs, then
   collect every page of check runs and commit statuses for the captured head.
   For check runs, request `filter=all` so duplicate and earlier runs remain
   visible. Confirm the expected workflow and event executed the required work;
   a skipped test job does not establish test coverage. Follow the repository's
   aggregate checks and intentional-skip policy.
4. Inspect findings from the configured reviewers. Trace each actionable report
   to the current source and classify it as confirmed, duplicate, false positive
   or unresolved. Fix confirmed defects and refresh affected checks. A false
   positive needs source evidence and a recorded reason; blanket suppressions
   or weaker gates are not a substitute for triage.
5. Record whether the final review is self-review or independent, its scope,
   the head SHA, provider evidence and coverage gaps. Apply the project's
   independent-review requirements for consequential changes. Automated
   comments and green checks do not constitute independent human review.
6. Immediately before an authorised merge, refresh the PR head, target,
   protection, required results and outstanding reviews. Reassess changed
   inputs. Merge only the reviewed head, using GitHub's expected-head argument
   and normal protected merge checks. These reads are observations, not an
   atomic guarantee that the target cannot move.

## Read Codacy results

Use Codacy's analysis for the specific PR and compare its reported head with
the captured GitHub head. Record the compared revision, analysis state, quality
gate result and findings. A default-branch grade does not establish the quality
of a different PR revision.

Read the complete GitHub check listing before following a single Codacy run.
Codacy can leave an earlier run in progress while another run for the same head
and PR has completed. Match the producer app, head, check suite and PR details
link, and confirm the provider's PR analysis. Record both runs and any unresolved
lifecycle anomaly. Do not select a result by numeric ID alone or treat an older
pending run as cancelled. A required check must still satisfy GitHub's protected
merge policy; an unresolved advisory result belongs in the final review record.

Keep quality and coverage conclusions separate. Missing, stopped or stale
coverage is unverified coverage, even when static analysis passes. Codacy needs
reports for both the PR head and target before a coverage gate is useful.
Establish reliable uploads and observe representative code, documentation,
fork and dependency PRs before proposing coverage enforcement. Use changed-code
coverage to assess new behaviour and triage inherited findings separately.

Keep existing quiet feedback and paid-review holds. Codacy's public GitHub
analysis needs status checks enabled; disabling comments is a separate setting.
Its documented merge-queue behaviour returns green statuses when a merge group
is requested. A green queue status therefore does not prove that
Codacy analysed the combined changes. Qualify the CI and security checks that
execute on the merge group before adopting a queue.

See Codacy's [GitHub integration](https://docs.codacy.com/repositories-configure/integrations/github-integration/),
[quality gates](https://docs.codacy.com/repositories-configure/adjusting-quality-gates/)
and [repository configuration](https://docs.codacy.com/getting-started/configuring-your-repository/).

## Assess reviewer usefulness

For a bounded sample, have a person judge each finding against the exact diff
reviewed. Count confirmed actionable findings, false positives and duplicates
across providers separately. Record triage time and confirmed findings unique to
each provider. Preserve the sample size, selection rule and head SHA; neither
comment count nor presence of a provider check measures accuracy.

Compare invoices or usage receipts for the same period and repository sample.
Separate workflow elapsed time, billed runner minutes and model cost. Measure
time to first useful review and time waiting for required checks. Use these
results before changing paid providers, coverage or review frequency.

## Check shared process drift

Compare required context names and producer app IDs with their actual workflows,
including aggregate dependencies, action pins and dependency versions. Classify
intentionally disabled pilots and archived or dormant consumers separately from
unexpectedly disabled workflows. A deleted observer that was deliberately
retired is not an incident. Record the owner and reason for each exception.

Use a read-only report before proposing corrections. A report does not authorise
branch protection changes, enabling a paid workflow or publishing a release.
