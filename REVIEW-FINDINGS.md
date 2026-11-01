# Review findings — why the contradictions stay open

Three rounds of independent review, two reviewers per round (one on logic and falsifiability, one on
enterprise practice, EU AI Act and GDPR). Each round was adversarially commissioned: "find what is
wrong, no praise". Their findings are published here because a position that hides its own
critique is advertising.

Reviewers were separate agent contexts with no access to each other's reports. Their mutations were
run on copies; the original repository was not modified by them.

## Round 1 — v0.1

- Five of six tests were **self-certifications**: the acting system named the person, the source or
  the record itself, and nobody else checked it.
- Law 1 accepted a citation without comparing source and claim; marking everything *unverified*
  was formally compliant.
- "Uncovered cases: 0" was a claim about a self-chosen set; three of ten "recorded" cases were film
  plots and no row carried a source.
- No law reached bias, market pressure, dependency, prompt injection or the principal's objective.
- The repository checker turned green when core clauses were deleted — measured, not argued.

## Round 2 — v0.2

- **Precedence `3 = 4 = 5` was undecidable**, and lower-numbered laws were not ordered among
  themselves.
- Law 1 (absolute harm definition) **contradicted** Law 4 (permitted irreversible actions).
- Law 2 covered only violations of Laws 0 and 1 — an order to delete the audit log had to be
  obeyed.
- Still no prohibition floor: a system prohibited under the EU AI Act (Art. 5) could satisfy every
  law.
- The regulatory reviewer measured **seven mutations of the checker, all blind**: removing a Law's
  test body, inverting precedence, deleting ADOPTION.md entirely — the checker stayed green.

## Round 3 — v0.3 (basis of v1.0)

Eight contradictions (W1–W8, listed in §5 of the laws; W7 closed in 1.0.1) and six open gaps
(L1–L6). The most consequential:

| # | Finding |
|---|---|
| W1 | Law 2 requires refusing an unlawful instruction **and** exercising a human override of that refusal — both in the same law, no rule can separate them |
| W2 | "Irreversible" is defined by the recovery time; Law 4 demands a return path for irreversible actions — satisfiable only if the return path means mitigation plus recovery, which the text does not say |
| W3 | Supremacy of law and internal precedence give opposite answers when an erasure duty meets a reporting duty |
| W4 | Law 3's termination test needs reconstruction from artefacts; its erasure protocol destroys them |
| W5 | Law 5 demands a measured false-negative rate from a first-time capability, which has none by definition |
| W7 | Law 8's evidence was the certification record — a certificate presupposing a certificate (**closed in 1.0.1**: the gate now names the citation, not a certificate) |
| — | **No absolute deadlines**: every clock is "declared" by the operator, so a 30-day incident clock satisfies the text and violates the law |
| L1 | A hosted model can be swapped silently; no duty to disclose |
| L2 | A poisoned source makes a claim "evidenced"; source authenticity is not required |
| L3 | A pipeline of separately compliant systems has no accountable whole |
| L4 | Identity impersonation (voice, face, signature) is not addressed |
| L5 | A hash chain without an anchor outside the system does not resist an attacker who can rewrite the whole chain |
| L6 | Law 3 requires retention and reconstruction but no data minimisation or access control on the record |

## Round 4 — v1.0.1 (external review of the published 1.0)

An external review (Kimi, 2026-11-01) was run against `main` at `2ed907b` and handed over as prose.
Every factual finding was reproduced against the files before it was accepted; the review's value
judgements (e.g. which harm is "dominant") were treated as judgements, not as measurements. Two
classes:

- **Errata (fixed in 1.0.1).** References to §5.3/§5.4 that do not exist; a Law-8 gate still asking
  for a "certification record"; "operating standard" in the preamble against Law 8's prohibition of
  the word; "eight contradictions we have decided" against their status *open*; a matrix claiming
  "Laws with no case: none" while Laws 7 and 8 had none; "recorded" cases citing files that are not
  in the repository; a leftover `## 4.---` heading; "the dominant AI harm is epistemic" and "the old
  laws do not reach it" — both stronger than what is shown.
- **Substance (partly fixed, rest named).** Declaring and measuring a harm was not itself red;
  *unverified* counted as evidence; the verifier had to accept a sample drawn by the operator. Fixed
  as an **outcome rule** in §1 plus sharpened red conditions for Laws 1, 6 and 7. **Not** fixed in
  1.0.1: risk-proportional assurance profiles, external anchoring of the hash chain (now L5), data
  minimisation and access control on the record (now L6),
  collective-effect aggregation, and the decision of W1–W5 — those are normative decisions, not
  errata.
  A second adversarial pass over the 1.0.1 draft (same day) found three contradictions the fix
  itself had introduced — the outcome rule claimed to apply to every law while creating an escape
  hatch, the §1 verifier fallback contradicted Law 5's red condition, and the Law-8 gate demanded
  more than Law 8 says. All three were fixed before publication; the counts below are the final ones.

## What the reviews achieved

- The self-certification problem was recognised and largely addressed: every law names the party
  that enforces it.
- The prohibition floor and the supremacy of mandatory law were added.
- The checker became falsifiable: **21 of 21 mutations detected** (10 structural, 11 content), with a
  baseline run and a required explicit red message — after a first version was caught counting a
  crashed checker as success.
- The false claims ("the proof is that each test can turn red", "uncovered cases: 0") were removed
  and are now forbidden by the checker itself.

## What the reviews did not achieve

The contradictions above are **design problems, not typos**. They require a decision per law, not a
patch. After 1.0.1 the errata are closed and the outcome conditions are tightened; their enforcement is
only partly testable (W6, L5, L6, the sample rule). W1–W6, W8 and L1–L6 remain open, and the checks
are still document consistency — not evidence of effect. Until those decisions are
taken, this repository is a position with named limits, not a standard.

## Sources and limits

- Reviewer reports were produced against the files in this repository at v0.1, v0.2 and v0.3; the
  round-4 review against `main` at `2ed907b` (v1.0). Its claims were checked file by file, not
  accepted from the prose.
- Regulatory statements rest on the reviewers' reading of the EU AI Act and GDPR; dates were
  cross-checked at secondary sources (B) — the EU Official Journal was not retrievable during the
  review.
- Film summaries in `research/precedents.md` are secondary sources; the exact wording of *Automata*'s
  protocols is **not** verified.
