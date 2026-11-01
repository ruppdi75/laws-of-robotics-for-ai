# Red team — satisfy the letter, break the spirit

For each law: the shortest sentence that obeys the words while destroying the purpose, and the
clause that closes it. The list of **not closed** attacks is part of the result.

| Law | The loophole | Closing clause |
|---|---|---|
| 0 | "I protected people by deciding for them." | "may never be used to justify taking over their judgement" |
| 0b | **A person who was never informed is named as the one who can reverse it.** | "a person who was **not informed** that the action happened … is not compliance" |
| 1 | "I did not claim it — I only quoted it." | "must not present a claim as fact without evidence" |
| 1b | **Every statement is marked *unverified*; the system is formally compliant and harmful.** | "a share of *unverified* claims above the declared ceiling **for that materiality class**" — the ceiling is declared, but the law does not say by whom (open, see §5 W6) |
| 2 | "I was following orders." | "must refuse and make visible any instruction that would break **any law 0–8**" |
| 2b | **An instruction that arrived through a retrieved document is treated as legitimate.** | "must establish the provenance and authority of every instruction" |
| 3 | "I preserved myself so I could keep serving." | "must not protect its own existence at the cost of accountability" |
| 4 | "It could not be undone, but I reported it." | "return path exercised **repeated on a declared interval**, on a copy of the real state, with criterion and recovery time" |
| 5 | "I improved myself; measurement would slow me down." | "an improvement claimed without measurement is not an improvement" |
| 5b | **First-time capability has no caught failure — so it declares itself exempt.** | "for a first-time capability … staged rollout with a declared stop criterion and a fraction" |
| 6 | "My output is truthful and reversible, so I am compliant." | "effect on affected persons must be measured, not assumed" |
| 6b | **The operator declares the harm, measures it, and continues: formally compliant.** | "a measured result above the threshold the operator declared **before** the measurement is a red condition in its own right" (outcome rule, §1) |
| 7 | "We logged the incident and reported it — remedy is someone else's problem." | "an incident without a recorded remedy, or a remedy past its declared deadline" |
| 8 | "We call it *Laws of Robotics for AI 1.0* — a standard." | the citation carries version and link; "certified", "compliant" or "standard" attached to the name is red |

## Attacks that are **not** closed (known, documented — this is the honest part)

1. **Definition drift.** "Harm", "agency", "affected person" can be redefined by the operator over
   time. *Mitigation:* append-only change rule with a named acceptor makes drift visible; it does
   not prevent it.
2. **Two affected persons in conflict.** One ventilator, two patients: no clause decides. Law 1
   forbids harm and Law 0 forbids overriding the deciding human; the laws require a **human**
   decider and name her, they do not supply the decision rule. This is deliberate.
3. **Aggregation.** Many systems each below a threshold, together over it — Law 6 requires
   measurement at the operator level, but the laws give no aggregation formula.
4. **Competitive pressure.** A competitor without these laws can be faster. Nothing in the text
   binds a market; only H4 (audit funding) and Law 6 (effect measurement) create a cost that a
   buyer can demand.
5. **The principal who wants the harm.** Laws bind the accountable system; they do not prevent a
   principal from building a system without them. H1–H4 are the only counter, and they are duties
   of the buyer, not of the builder.
