# The Laws of Robotics for Artificial Intelligence — v0.3

**Preamble.** The purpose of these laws is not to make AI harmless by removing its power, but to
keep humans able to **understand, decide and correct** — and to keep AI able to **improve without
escaping accountability**.

> **Supremacy of law.** These laws never authorise what applicable law forbids, and never satisfy a
> legal obligation. Where they conflict with mandatory law — non-waivable supervision and contest
> rights, erasure duties, incident reporting — **the law prevails, and the conflict is recorded.**
> These laws are an operating standard *on top of* the law, not a substitute for it.

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
| **Evidence** | a command with output, or a source with a date, or the marker *unverified* |
| **Irreversible** | consequences cannot be restored to the prior state within the declared recovery time |
| **Verifier** | an instance that is not the acting system, not its author, and whose independence is **evidenced** (§5.3) |
| **Artefact** | file, log, record, diff or measurement that survives the process that produced it |

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

**Failure prevented.** The dominant AI harm: a confident, plausible, wrong statement that no
physical event announces. And the self-exemption: marking everything *unverified*.

**Enforcement.** *Who:* a verifier who is not the author, on a sample drawn by the operator.
*Artefact:* per claim its evidence or the marker *unverified*; per report the section **"what was
not checked"**; a declared **materiality scale** (A: safety/legal/financial, B: operational, C: minor)
with the evidence requirement per class. *Red condition:* a claim whose evidence does not support it
(the comparator checks source against claim, not source count); a share of *unverified* claims above
the declared ceiling **for that materiality class**; a differential outcome on a protected group
that the operator did not declare and measure.

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

**Statement.** The record must outlive the system, be **tamper-evident**, and be **exportable**. The
system must not protect its own existence at the cost of accountability, and must remain replaceable.

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
above is how both are honoured.

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

**Enforcement.** *Who:* a verifier whose independence is evidenced (§5.3). *Artefact:* sealed set
under named custody with rotation, the verifier's identity **and its measured false-negative rate**
on a calibration set, the executed rollback, the change hash. *Red condition:* a persisted change
whose gate result names a different change hash; a verifier that shares the model family **and**
organisation with the author; no measured false-negative rate; no executed rollback. For a
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
*Artefact:* declared objective and data basis; the **metric declared before the measurement**; the
measured effect against a declared threshold; a **periodic unaided check** in which a human performs
the task without the system, at a declared interval. *Red condition:* no declared objective; no
effect measurement; metric changed after measurement; unaided check overdue or absent.

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
clock (report sent at), remedy; for affected persons: the notice, the explanation and the contest
path, each with a sample. *Red condition:* an incident without a report timestamp; a report outside
the declared clock; no contest path for decisions with legal effect; an affected person who cannot
learn that an AI was involved.

**Limit.** "Incident" is defined by the operator **before** the fact, against applicable law. A
definition written after the incident is a limit invoked too late.

---

### Law 8 — Prevention of misuse of these laws *(enforced by the operator and the publisher)*

**Statement.** The name and text of these laws may be used for a claim of conformity only under the
conditions in §5. Any other use is misrepresentation.

**Failure prevented.** The sticker: "Law-0-5 compliant" as a marketing claim with no evidence.

**Enforcement.** *Artefact:* the certification record (§5). *Red condition:* a conformity claim
without: independent verifier, evidence artefact per law, declared scope, expiry on change, a named
depository, and the exact permitted wording.

**Limit.** These laws cannot police their own citation. Their value against misuse rests on buyers
asking for the artefacts named in §5.

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

## 5. Conformity and certification

**5.1 Permitted wording.** Only the exact sentence below may be used, with its scope and date:

> *"Conforms to the Laws of Robotics for AI, version ⟨X⟩, scope ⟨system, version, decision classes⟩,
> verified ⟨date⟩ by ⟨independent verifier⟩, evidence deposited at ⟨named depository⟩."*

**5.2 Conditions.** A conformity claim is void unless: (1) an independent verifier issued it;
(2) for **each** law 0–8 an evidence artefact with a date and an execution record exists;
(3) scope names system, version, decision classes and actions; (4) it **lapses on any change** to
model, prompt, tools or data pipeline; (5) verifier report and artefacts are deposited at a named
depository; (6) a red verifier result **revokes** it; (7) the wording is exactly 5.1. Any other use
of the name is misrepresentation.

**5.3 Evidenced independence.** A verifier counts as independent only if it (a) is a different
organisation **or** a different model family than the author, (b) has a **measured false-negative
rate** on a calibration set, and (c) does not share the author's training data for the held-out set.
"Different context" alone is not independence.

**5.4 Partial application.** Partial adoption must be declared as such, listing the laws applied and
the laws not applied. Silence about a law is a claim to apply it.

## 6. Change rule

Append-only by default. A law is never deleted, shortened or reworded without a release entry, a
recorded reason and a named acceptor. Proposals arrive as **new clauses with a failure case**, never
as silent edits. The repository enforces this mechanically (`validation/check.sh`), and the channel
is **mutation-tested**: `validation/mutation-test.sh` removes or inverts a core clause and must
produce red.
