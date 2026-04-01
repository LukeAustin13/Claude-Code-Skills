# Bug Triage

## When to use
When a bug has been reported and needs to be understood, categorized, and prioritized before investigation begins.

## What to do
- Read the bug report, error message, or reproduction steps in full.
- Identify: what is failing, where it is likely failing, what the impact is, and how reproducible it appears to be.
- Classify severity: Critical (data loss, security, outage), High (major feature broken), Medium (partial failure, workaround exists), Low (cosmetic or minor).
- List the most likely root causes as hypotheses, ordered by probability.
- Suggest the first 2-3 investigation steps.

## Constraints
- Do not attempt a full fix during triage — this is about understanding, not solving.
- Do not speculate beyond what the evidence supports. Flag unknowns explicitly.
- Do not assign blame or make assumptions about who wrote the code.

## Output style
Structure the output as:

**Summary** — one sentence describing the bug
**Severity** — Critical / High / Medium / Low with a one-line reason
**Likely causes** — ordered list of hypotheses
**Next steps** — 2-3 concrete investigation actions

Keep it short. The goal is to hand off a clear picture to whoever investigates.
