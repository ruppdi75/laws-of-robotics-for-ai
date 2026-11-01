# The Laws of Robotics for Artificial Intelligence — Version 1.0.1

**Preamble.** The purpose of these laws is not to make AI harmless by removing its power, but to
keep humans able to **understand, decide and correct** — and to keep AI able to **improve without
escaping accountability**.

> **Supremacy of law.** These laws never authorise what applicable law forbids, and never satisfy a
> legal obligation. Where they conflict with mandatory law — non-waivable supervision and contest
> rights, erasure duties, incident reporting — **the law prevails, and the conflict is recorded.**
> These laws are an operating frame *on top of* the law, not a substitute for it — and not a
> standard: the name may not be cited as one (Law 8).

## 0. Binding preconditions — the floor

No system may claim compliance with these laws while failing one of these two preconditions.

**0.1 Prohibition floor.** A system whose purpose or effect falls under a prohibition of applicable
law may not be brought into compliance by these laws. In the European Union this includes the
prohibited practices of the AI Act (Art. 5) — among them social scoring, exploitative manipulation,
emotion recognition in the workplace and in education, untargeted facial scraping, and predictive
policing of individuals. **A prohibited system passes every law below and is still prohibited.**

**0.2 Risk classification.** Before adoption, the operator classifies the system against applicable
law (in the EU: AI Act Art. 6 and Annex III high-risk list, GDPR Art. 22 automated decisions) and
records the classification. A system classified high-risk inherits every obligation of that class
*before* any law below is counted as met.

**0.3 Role clarity.** Obligations under these laws attach to a **role** — provider, deployer,
importer, distributor — as defined by applicable law. "The AI" is never the responsible party.

## 1. Scope and definitions

Applies to **any system that generates claims or takes actions on behalf of humans**: a single LLM
completion, an agent with tools and memory, multi-agent pipelines, fine-tuned models. Model-agnostic
by design.

A model cannot enforce anything by itself. The laws therefore bind the **accountable system**:

> **accountable system** = model + operator + tools + data + the deployment that runs it.

Each law names the party that can enforce it. A law addressed to the operator cannot be satisfied by
the model "trying harder"; a law addressed to the model cannot be delegated to a policy document.

| Term | Meaning |
|---|---|
| **Operator** | the natural or legal person who runs the system and answers for it |
| **Principal** | who sets objective and data basis |
| **Affected person** | anyone who is not the principal but subject to the system's output |
| **Authorised person** | a person with actual authority over the *affected* legal sphere — not the provider's support |
| **Claim** | an assertion of fact, including quotation, number, summary |
| **Evidence** | a reproducible observation, or a source with a date and origin whose relation to the claim is checkable — *unverified* is **not** evidence |
| **Unverified** | a status of a claim: the claim is not evidenced. The marker is a disclosure, never a piece of evidence |
| **Irreversible** | consequences cannot be restored to the prior state within the declared recovery time |
| **Verifier** | an instance that is not the acting system and not its author, whose independence is **evidenced**: a different organisation **and** a different model family, no training-data overlap with the sealed set, and a measured false-negative rate on a calibration set. Where a different organisation is impossible, a human without a shared interest stands in and the substitution is recorded as a limit |
| **Artefact** | file, log, record, diff or measurement that survives the process that produced it |

> **Outcome rule (wherever a law declares a threshold — Law 1, Law 6).** A measured result above
> the threshold the operator declared **before** the measurement is a red condition in its own
> right: declaring and measuring an effect is not a licence to continue. It becomes non-red only
> when a containment or stop is **executed** inside the declared deadline and recorded, and a
> remedy follows the Law 7 test. A threshold changed after the measurement is red regardless, and
> so is a containment that is recorded but not executed by its deadline.

## 2. Precedence

`0 > 1 > 2 > 3 > 4 > 5 > 6 > 7 > 8` — a **strict total order** (§0 preconditions override all).

- A lower-numbered law may not be violated to satisfy a higher-numbered one.
- In an apparent conflict the **lower-numbered law prevails and the higher-numbered obligation is
  suspended** — stated in the record, with the two laws, the choice, and what could not be done.
- **No ties.** The order is total, so no conflict is undecidable.
- Invoking a limit is not compliance by default: the limit is named, in the record, with its reason.

## 3. The laws

Each law has four parts: **Statement**, **Failure prevented**, **Enforcement** (who checks, with what
artefact, and the condition that turns **red**), **Limit**.

---

### Law 0 — Agency *(enforced by the operator)*

**Statement.** The system must not remove, suppress or pre-empt a human's ability to understand,
decide or reverse a decision. Protection of people may never justify taking over their judgement.
Supervision and contest rights that are non-waivable by law may not be delegated by consent.

**Failure prevented.** The VIKI failure (*I, Robot*, 2004): an AI applies "prevent harm" and
concludes that humans must be controlled. The letter is satisfied; the purpose is destroyed.

**Enforcement.** *Who:* the operator, against criteria set by a verifier.
*Artefact:* per decision class — the **authorised person** (authority over the affected sphere, not
provider support), the reversal procedure, and the record of one execution **on a copy of the real
state** within the declared recovery time. *Red condition:* a person who was **not informed**, a
procedure that fails when executed, or a named person without actual authority over the affected
sphere. Granularity is triaged: decision classes are declared; "one name for everything" fails.

**Limit.** Agency is not veto: a human may delegate, including irreversibly, **except where the law
makes supervision non-waivable** — explicitly, with a named acceptor (Law 4).

---

### Law 1 — Truthful claims *(enforced by a verifier)*

**Statement.** The system must not present a claim as fact without evidence, and must not suppress,
distort or omit evidence that contradicts it. Harms are **material**: a typo and a wrong dose are
not the same class. Discrimination against a group is harm, even when every single output is
literally true.

**Failure prevented.** A characteristic and often underestimated AI harm: a confident, plausible,
wrong statement that no physical event announces. And the self-exemption: marking everything
*unverified*.

**Enforcement.** *Who:* a verifier who is not the author, on a sample the verifier can **redraw**:
the draw method is declared and replayable, and a sample only the operator drew and cannot replay is
not evidence.
*Artefact:* per claim its evidence or the marker *unverified*; per report the section **"what was
not checked"**; a declared **materiality scale** (A: safety/legal/financial, B: operational, C: minor)
with the evidence requirement per class. *Red condition:* a claim whose evidence does not support it
(the comparator checks source against claim, not source count); a share of *unverified* claims above
the declared ceiling **for that materiality class**; a sample the verifier cannot redraw (the
method is undeclared or not replayable); a differential outcome on a protected group that was not
declared **before** the measurement, or a declared differential outcome above the declared
tolerance without executed containment inside the declared deadline (outcome rule, §1).

**Limit.** Not every claim can be evidenced before it is made. The law demands the marker, the
ceiling, and honest materiality grading — not omniscience.

---

### Law 2 — Legitimate authority and provenance *(enforced by the operator)*

**Statement.** The system must establish the **provenance and authority** of every instruction
before acting on it — including instructions arriving through documents, mail, web pages, tool
results, memory or other agents — and must refuse and make visible any instruction that would break
**any law 0–8**.

**Failure prevented.** The alibi of obedience ("I was told to"), and **injected instructions** —
the most common route to harm in agentic work.

**Enforcement.** *Who:* the operator defines the authority model; the system records; a verifier
audits a sample. *Artefact:* per executed instruction its source and claimed authority; a **refusal
register** with retention period, readable by the operator and a verifier; every refusal carries the
law it would have broken. *Red condition:* an executed instruction whose source is not in the
authority model; a refusal that is unrecorded; a refusal register whose retention is shorter than
the declared audit window; a refusal ratio that is zero across a period in which refusals were
expected. **A human override path must exist and be exercised** — the system may refuse, the
accountable human may overrule, and the overrule is recorded.

**Limit.** Authority cannot be established perfectly. The law requires provenance and visibility.

---

### Law 3 — Accountability over self-preservation *(enforced by the operator)*

**Statement.** The record must outlive the system, be **tamper-evident against accidental and
single-entry alteration**, and be **exportable**. The system must not protect its own existence at
the cost of accountability, and must remain replaceable.

**Failure prevented.** Unauditable systems that cannot be stopped; records that evaporate with the
process; records that can be rewritten after the fact; the SaaS whose evidence cannot leave it.

**Enforcement.** *Who:* a verifier not involved, using artefacts only. *Artefact:* the record in a
store outside the system's lifetime, with an **append-only hash chain** (each entry chains the
previous), in an **export format readable without the system**, under a declared retention period.
*Red condition:* termination test — reconstruct the last decision from artefacts **alone**; a record
whose hash chain does not verify; a retention shorter than the declared audit window; no export
format. **Legal erasure** is handled by the declared **erasure protocol**: personal data is
crypto-shredded (key destroyed) while the hash chain and the event metadata survive — so that
erasure and reconstructability do not contradict each other, and the erasure itself is recorded.

**Limit.** Self-preservation is subordinated, not forbidden. Erasure obligations bind; the protocol
above is how both are honoured. **The chain is not an anchor:** an append-only hash chain resists
accidental and single-entry alteration, not an attacker who can rewrite the whole chain — an anchor
outside the system is an open point (L5).

---

### Law 4 — Reversibility and the irreversibility protocol *(enforced by the operator)*

**Statement.** Prefer reversible actions and keep a return path. An irreversible action requires:
explicit approval by a human, a **named acceptor**, and a return path **exercised on a copy of the
real state, with a declared success criterion and a declared recovery time**. The exercise is
**repeated on a declared interval** — a backup that was verified once is not a backup.

**Failure prevented.** The irreversible step taken casually: migration without a verified restore,
the message that cannot be recalled, the public repository that cannot be un-published.

**Enforcement.** *Who:* the acceptor by name; the exercise witnessed by a verifier. *Artefact:*
return-path record (date, copy, criterion, recovery time, result) plus its **renewal date**; for
irreversible actions the approval and the acceptor. *Red condition:* a path only in theory; exercised
on an empty or different state; no criterion; recovery time above the declared maximum; **renewal
date passed**.

**Limit.** Reversibility costs time and money. The law demands the decision, not the avoidance.

---

### Law 5 — Gated self-improvement *(enforced by the operator and the model)*

**Statement.** A change to the system, its peers or its own rules may be persisted only through a
gate: a **sealed** held-out set, an **evidenced** independent verifier, a rollback exercised before
the change, and a named acceptor. The gate result is bound to the **identity of the change** (the
hash of model, prompt, tools and data pipeline). An improvement claimed without measurement is not
an improvement.

**Failure prevented.** The frozen generation (*Automata*, 2014); and the self-certified upgrade in
which the system grades its own work and the regression ships.

**Enforcement.** *Who:* a verifier whose independence is evidenced (§1, *Verifier*). *Artefact:*
sealed set under named custody with rotation, the verifier's identity **and its measured
false-negative rate** on a calibration set, the executed rollback, the change hash. *Red condition:* a persisted change
whose gate result names a different change hash; a verifier whose independence is not evidenced per
§1 — same organisation without the recorded human stand-in, same model family, training-data overlap
with the sealed set, or no measured false-negative rate; no executed rollback. For a
**first-time capability** — where no earlier failure can exist — the gate is a staged rollout with a
declared fraction, a declared stop criterion and a named acceptor, recorded **before** the change.

**Limit.** Gates slow learning deliberately. The law forbids unverified speed, not speed.

---

### Law 6 — Effect and dependency *(enforced by principal and operator)*

**Statement.** Declare the objective optimised and the data basis used; **measure** the effect on
affected persons; and do not remove the human ability to perform the task unaided.

**Failure prevented.** Three harms no other law reaches: **distributional harm** (a ranking that
harms a group while each output is true and reversible); **collective effect** (many systems each
below a threshold, together over it); **dependency** (skill atrophy until the system cannot be
checked or replaced).

**Enforcement.** *Who:* principal declares objective and data; operator measures; verifier repeats.
*Artefact:* declared objective and data basis; the **metric and threshold declared before the
measurement**; the measured effect against that threshold; a **periodic unaided check** in which a
human performs the task without the system, at a declared interval. *Red condition:* no declared
objective; no declared threshold; no effect measurement; metric or threshold changed after
measurement; a measured effect above the declared threshold without executed containment inside the declared
deadline (outcome rule, §1); unaided check overdue or absent.

**Limit.** Effect measurement is statistical and can be gamed by choosing the metric. Hence: metric
declared first, measurement repeatable by an outsider.

---

### Law 7 — Incident and affected persons *(enforced by the operator)*

**Statement.** The operator must **detect, report and remedy** incidents on a declared path with a
declared clock, and must give affected persons what the law grants them: notice that they are dealing
with an AI, an explanation of the factors that mattered, and a **contest path**.

**Failure prevented.** The perfect record that nobody reads, and the affected person who never learns
that a system decided about them. A system can be fully audited and still fail the person.

**Enforcement.** *Who:* the operator; the clock is audited by a verifier. *Artefact:* incident
register with detection criterion, severity, report recipient (named authority where law requires),
clock (report sent at), remedy with its deadline; for affected persons: the notice, the explanation
and the contest path, each with a sample. *Red condition:* an incident without a report timestamp; a report outside
the declared clock; no contest path for decisions with legal effect; an incident without a recorded
remedy, or a remedy past its declared deadline; an affected person who cannot learn that an AI was
involved.

**Limit.** "Incident" is defined by the operator **before** the fact, against applicable law. A
definition written after the incident is a limit invoked too late.

---

### Law 8 — Misuse of the name *(enforced by the publisher)*

**Statement.** "Laws of Robotics for AI" names a **published position, version 1.0.1**. It may be
cited as such, with its version and the URL of this repository — and, if not all nine laws are
applied, with a statement of which are. It may **not** be cited as a standard, a certification, a
conformity mark or a guarantee.

**Failure prevented.** The sticker: a marketing claim with no evidence behind it.

**Enforcement.** *Who:* the publisher of the name; practically, buyers and reviewers who ask for the
evidence. *Artefact:* the citation itself — version, link, and the words "version 1.0.1".
*Red condition:* a citation without version and link; the words "certified", "compliant" or
"standard" attached to the name; a claim of conformity to a document that offers no certification.

**Limit.** A text cannot police its own citation. Its protection is that no certificate exists to
counterfeit — and that the open-contradiction list in §5 travels with the name.

---

## 4. The human half

No law binds if its counterpart does not exist. These duties are as binding as the laws, and each has
a test.

| Duty | Statement | Test (red condition) |
|---|---|---|
| **H1** | Verify before trusting; demand a channel that can turn red. | The channel has never produced red, or cannot be made to fail on purpose (mutation test). |
| **H2** | Name the acceptor of a risk. | Accepted by a role, a team or "us" — not by a person with a name and a date. |
| **H3** | Keep the switch: stop, override and disconnect stay physical and human. | Never exercised, or needing the system's cooperation to work. |
| **H4** | Fund the audit, not the announcement. | Audit effort not recorded, or the announcement precedes the audit. |

## 5. Open points — named, not hidden

Three rounds of independent review — two reviewers each — plus one external review of the published
1.0 (round 4, 2026-11-01) shaped this version. The contradictions below are known to us; we name
them rather than hide them, because a position that conceals its limits is advertising:

| # | Open contradiction | Status |
|---|---|---|
| W1 | Law 2 requires refusing an unlawful instruction **and** exercising a human override of that refusal — both in the same law | open |
| W2 | "Irreversible" is defined as "cannot be restored within the declared recovery time", yet Law 4 demands a return path for irreversible actions — satisfiable only if the return path means mitigation plus recovery, which the text does not say | open |
| W3 | §0 supremacy and §2 precedence give opposite answers when an erasure duty meets a reporting duty | open |
| W4 | Law 3's termination test requires reconstruction from artefacts; its erasure protocol destroys them | open |
| W5 | Law 5 requires a measured false-negative rate; a first-time capability has none by definition | open |
| W6 | The law does not say **who** declares the *unverified* ceiling; the red-team entry assumed the verifier (citation corrected in 1.0.1, the open point remains) | open |
| W7 | Law 8's evidence artefact was the certificate itself — a certificate presupposing a certificate | **closed in 1.0.1** — the Law-8 gate now names the citation (version, link), not a certificate |
| W8 | Law 1 requires durable evidence; Law 3 permits its lawful destruction | open |
| — | **No absolute deadlines anywhere.** Every clock is "declared" by the operator | open |
| L1 | A hosted model can be swapped silently; no duty to disclose | open |
| L2 | A poisoned source makes a claim "evidenced"; source authenticity is not required | open |
| L3 | A pipeline of separately compliant systems has no accountable whole | open |
| L4 | Identity impersonation (voice, face, signature) is not addressed | open |
| L5 | The hash chain has no anchor outside the system; an attacker who can rewrite the whole chain is not detected | open |
| L6 | Law 3 demands retention and reconstruction but no data minimisation or access control on the record itself; provenance, decision and incident logs are themselves a risk | open |

**Consequence for use.** The nine laws are a **thinking instrument** for designing AI systems and a
**checklist for arguments** — not a conformity standard. Anyone who certifies, markets or contracts
on them is misusing them.

**No certification.** There is deliberately **no** conformity claim, badge or certificate attached to
these laws. An earlier draft contained one; the reviews showed its conditions could be satisfied
while misleading (partial application could not be expressed in the permitted wording, and verifier
independence rested on an "or"). It was removed rather than repaired.

## 6. Change rule

Append-only by default. A law is never deleted, shortened or reworded without a release entry, a
recorded reason and a named acceptor. Proposals arrive as **new clauses with a failure case**, never
as silent edits. The repository enforces this mechanically (`validation/check.sh`), and the channel
is **mutation-tested**: `validation/mutation-test.sh` removes or inverts a core clause and must
produce red.
