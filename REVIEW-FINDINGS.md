# Review findings — why this is a draft

Three rounds of independent review, two reviewers per round (one on logic and falsifiability, one on
enterprise practice, EU AI Act and GDPR). Each round was adversarially commissioned: "find what is
wrong, no praise". Their findings are published here because a standard that hides its own
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

## Round 3 — v0.3 (current)

Eight unresolved contradictions (W1–W8, listed in §5 of the laws) and four open gaps (L1–L4).
The most consequential:

| # | Finding |
|---|---|
| W1 | Law 2 requires refusing an unlawful instruction **and** exercising a human override of that refusal — both in the same law, no rule can separate them |
| W2 | "Irreversible" is defined as "no return path"; Law 4 demands a return path for irreversible actions |
| W3 | Supremacy of law and internal precedence give opposite answers when an erasure duty meets a reporting duty |
| W4 | Law 3's termination test needs reconstruction from artefacts; its erasure protocol destroys them |
| W5 | Law 5 demands a measured false-negative rate from a first-time capability, which has none by definition |
| W7 | Law 8's evidence was the certification record — a certificate presupposing a certificate (the certification was removed; the contradiction is documented) |
| — | **No absolute deadlines**: every clock is "declared" by the operator, so a 30-day incident clock satisfies the text and violates the law |
| L1 | A hosted model can be swapped silently; no duty to disclose |
| L2 | A poisoned source makes a claim "evidenced"; source authenticity is not required |
| L3 | A pipeline of separately compliant systems has no accountable whole |
| L4 | Identity impersonation (voice, face, signature) is not addressed |

## What the reviews achieved

- The self-certification problem was recognised and largely addressed: every law names the party
  that enforces it.
- The prohibition floor and the supremacy of mandatory law were added.
- The checker became falsifiable: **9 of 9 mutations detected** (7 structural, 2 content), with a
  baseline run and a required explicit red message — after a first version was caught counting a
  crashed checker as success.
- The false claims ("the proof is that each test can turn red", "uncovered cases: 0") were removed
  and are now forbidden by the checker itself.

## What the reviews did not achieve

The contradictions above are **design problems, not typos**. They require a decision per law, not a
patch. Until then this repository is a proposal.

## Sources and limits

- Reviewer reports were produced against the files in this repository at v0.1, v0.2 and v0.3.
- Regulatory statements rest on the reviewers' reading of the EU AI Act and GDPR; dates were
  cross-checked at secondary sources (B) — the EU Official Journal was not retrievable during the
  review.
- Film summaries in `research/precedents.md` are secondary sources; the exact wording of *Automata*'s
  protocols is **not** verified.
