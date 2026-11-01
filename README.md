# Laws of Robotics for Artificial Intelligence

**Version:** v0.3 (proposal) · **Status:** **DRAFT FOR PUBLIC REVIEW — not a standard, not a certification**
**License:** CC BY-SA 4.0 (text) · MIT (code) — see [`LICENSE`](LICENSE)

Asimov's Three Laws were written for physical robots. The dominant harm of AI systems is
**epistemic**: a confident claim without evidence, a silently lost capability, a "verified" that was
never measured. No physical event announces that harm — so the old laws do not reach it.

This repository is a rewrite for systems that generate claims and take actions: a single LLM
completion, an agent with tools and memory, a multi-agent pipeline. **Model-agnostic by design.**

## The nine laws

| # | Law | Core question |
|---|---|---|
| — | **§0 Preconditions** | Prohibited by law? Risk class? Which role answers? |
| 0 | **Agency** | Does a human keep the ability to understand, decide, reverse? |
| 1 | **Truthful claims** | Does the evidence actually support the claim? |
| 2 | **Authority & provenance** | Where did this instruction come from, and may it be obeyed? |
| 3 | **Accountability** | Does the record outlive the system, tamper-evident and exportable? |
| 4 | **Reversibility** | Is there a return path — exercised, with a criterion and a renewal date? |
| 5 | **Gated self-improvement** | Who verified the change, and what would make it fail? |
| 6 | **Effect & dependency** | Who is affected, and can a human still do the task unaided? |
| 7 | **Incident & affected persons** | Who is told, how fast, and how can they contest? |
| 8 | **Prevention of misuse** | May this system use the name at all? |

Full text with **Enforcement** (who checks, red condition) and **Limit** per law:
[`laws/00-the-laws.md`](laws/00-the-laws.md)

## Honest status

Two independent reviews (round 3) found **eight unresolved contradictions and four open gaps** —
for example: Law 2 requires refusing an unlawful instruction *and* exercising a human override of
that refusal; "irreversible" is defined as "no return path" while Law 4 demands one; and there are
**no absolute deadlines** anywhere in the text. They are listed in
[§5 of the laws](laws/00-the-laws.md#5-what-this-draft-does-not-achieve--open-contradictions) and in
[`REVIEW-FINDINGS.md`](REVIEW-FINDINGS.md).

**There is no certification and no conformity claim** — deliberately removed, because the review
showed its conditions could be met while misleading. Use this as a thinking instrument and a
checklist for arguments, not as a standard.

## What makes this falsifiable

- **Every law names the party that enforces it.** The acting system never grades itself.
- **Every law has a red condition** — a concrete artefact and a failure that can be shown.
- **The channel is mutation-tested.** `validation/mutation-test.sh` removes or inverts a core clause
  and requires the checker to turn **red**; currently **9 of 9 mutations detected** (7 structural, 2 content). A checker that
  cannot fail verifies nothing.
- **The coverage matrix separates** recorded cases (with sources), film illustrations and **open
  gaps** — the gaps are named, not hidden.

```bash
bash validation/check.sh          # substance: parts, anchors, gates, matrix, changelog
bash validation/mutation-test.sh  # proof that the checker can turn red
```

## Precedents

Asimov, *Runaround* (1942) / "Handbook of Robotics, 56th Edition, 2058 A.D."; *I, Robot* (2004) and
the VIKI failure; *Automata* (2014) and the frozen generation.
[`research/precedents.md`](research/precedents.md)

## Adoption

[`ADOPTION.md`](ADOPTION.md) — gates for all nine laws, and the honest label: one afternoon is an
**exercise**, not adoption. A conformity claim requires [`§5`](laws/00-the-laws.md) — independent
verifier, an artefact per law, a declared scope, and it lapses on change.

## What this is not

- Not a moral theory — an operating standard that can be checked.
- Not a ban on capability — a ban on unaccountable capability.
- Not a substitute for law. **Mandatory law prevails**; these laws never authorise what law forbids.
