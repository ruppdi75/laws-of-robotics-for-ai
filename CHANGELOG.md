# Changelog

Append-only. A change to the laws themselves requires a release entry with a named acceptor.

## v0.3-public — 2026-11-01 (first public draft)

- **§5 certification removed entirely.** The reviews showed the conditions were satisfiable while
  misleading (partial application could not be expressed; verifier independence rested on an "or";
  Law 8's evidence was the certificate itself). Replaced by §5 "What this draft does not achieve":
  eight open contradictions and four open gaps, named.
- **Law 8 rewritten**: the name may only be cited as "draft proposal" with version and link.
- README status changed to *draft for public review*; review findings added as a file.
- Checker adapted: anchors for the removed certification replaced; misuse clause enforced.

## v0.3 — 2026-11-01 (unpublished draft, review round 3 pending)

Response to the **second** independent review (enterprise / EU AI Act / GDPR), including seven
measured mutations of the checker.

- **Supremacy of mandatory law** stated first: these laws never authorise what law forbids and never
  substitute a legal obligation. Resolves the delegation conflict with GDPR Art. 22(3) and AI Act
  Art. 14, and the erasure conflict of Law 3.
- **§0 binding preconditions**: prohibition floor (a system prohibited by law cannot be compliant by
  these laws), risk classification, role clarity. This closes the critical finding that a legally
  prohibited system passed all six laws.
- **New Law 7 (Incident and affected persons)**: incident register with clock and named recipient;
  notice, explanation and contest path for affected persons (AI Act Art. 50 / GDPR Art. 12–15,
  Art. 22(3)).
- **New Law 8 (Prevention of misuse)**: the name may be used for a conformity claim only under the
  conditions in §5 — closing the sticker loophole.
- **§5 Conformity and certification**: permitted wording, seven conditions, revocation on red
  result, lapse on change, evidenced independence (different organisation or model family,
  measured false-negative rate, sealed held-out set).
- **Law 1**: materiality classes (A/B/C), discrimination as harm, ceiling of *unverified* per class.
- **Law 3**: append-only hash chain, export format, retention window, erasure protocol via
  crypto-shredding — erasure and reconstructability no longer contradict.
- **Law 4**: exercise repeated on a declared interval with a renewal date; defined irreversibility
  with recovery-time maximum.
- **Law 5**: gate bound to the change hash; verifier false-negative rate required.
- **ADOPTION**: gates for **all** laws 0–8 (previously 0 and 3 had none); "one afternoon" is
  explicitly labelled an exercise, not adoption.
- **check.sh**: now substantive (four parts per law, red conditions, anchors, adoption gates,
  matrix categories, changelog). The false claim "the proof is that each test can turn red" is
  removed and the checker forbids it.
- **New mutation-test.sh**: removes or inverts core clauses and requires the checker to turn red.
  A checker that cannot fail verifies nothing.

**Still open:** third independent review; the five documented attacks that are not closed.

## v0.2 — 2026-11-01 (unpublished draft, review round 2 pending)

Response to the first independent review (10 critical findings). Changes:

- **Precedence** is now strict and total (`0 > 1 > 2 > 3 > 4 > 5 > 6`); a conflict **suspends** the
  lower law instead of "resolving" an undecidable tie.
- **Law 1 / Law 4 contradiction removed**: "no recoverable path" is no longer a category of harm;
  irreversible actions are handled by Law 4's protocol.
- **Law 2 now covers any law 0–6**, not only 0 and 1.
- **Every law names the party that enforces it** (operator, model, principal, verifier) — the acting
  system can no longer be its own judge.
- **Tests are no longer naming tests**: Law 0 requires an *informed* person and an executed reversal
  on a copy; Law 1 compares claim to source and caps the share of *unverified* claims; Law 3
  reconstructs from artefacts after termination; Law 4 defines the copy and the success criterion;
  Law 5 defines the first-time-capability case.
- **New Law 6 (Effect and dependency)** — distributional harm, collective effect, objective/data
  disclosure, periodic unaided human check. This closes the four critical coverage gaps
  (bias, competitive/market pressure, dependency, objective).
- **New Law 2 provenance duty** — injected instructions (documents, mail, tool results) are covered.
- **Coverage matrix** now separates *recorded* cases (8), *film* illustrations (3) and *open gaps*
  (5); "uncovered cases: 0" is withdrawn.
- **H1–H4 have tests.**
- `validation/check.sh` now checks substance (enforcement, sources, changelog, adoption gates),
  not only headings.

**Still open:** second independent review; the five documented attacks that are not closed.

## v0.1 — 2026-11-01 (unpublished draft)

- Initial draft: Laws 0–5, human duties H1–H4, precedents, coverage matrix, red team, adoption guide.
- **Not yet validated** by an independent reviewer. Not published.
