# Adopting the laws

The laws are worthless as a document and useful as a **gate**. Adoption means the artefacts below.

> **A subset is allowed, but it must be declared.** A system that applies Laws 0–4 and not 5–8 says
> so, in the same sentence as any citation of the name (Law 8). Silence about a law is a claim to
> apply it. **"One afternoon" is an exercise, not adoption.** It is labelled as
> such below.

## 0. Prerequisites (before any law counts)

| Check | Artefact | Fails when |
|---|---|---|
| Prohibition floor (§0.1) | written classification against the prohibitions of applicable law | the system falls under a prohibition |
| Risk classification (§0.2) | classification against applicable risk lists (EU: AI Act Art. 6 / Annex III; GDPR Art. 22) | no classification, or class ignored |
| Role clarity (§0.3) | the responsible role (provider / deployer / …) named | "the AI" is named as responsible |

## 1. Gates per law — none may be skipped without being declared

| Law | Gate artefact | Turns red when |
|---|---|---|
| **Law 0 — Agency** | authorised person per decision class + one reversal executed **on a copy of the real state** | person uninformed; procedure fails; person lacks authority over the affected sphere |
| **Law 1 — Truthful claims** | evidence per claim + materiality scale + ceiling of *unverified* per class + redrawable sample | evidence does not support the claim; ceiling exceeded; sample not redrawable; group effect undeclared before measurement, or declared and above tolerance without executed containment |
| **Law 2 — Authority & provenance** | authority model + provenance record + refusal register + exercised human override | executed instruction outside the model; refusal unrecorded; register retention too short |
| **Law 3 — Accountability** | record outside the system + append-only hash chain + export format + erasure protocol | reconstruction fails; hash chain unverified; no export; erasure not recorded |
| **Law 4 — Reversibility** | return path exercised on a copy, with criterion, recovery time and **renewal date** | path theoretical; wrong state; recovery time exceeded; renewal overdue |
| **Law 5 — Gated improvement** | sealed set + evidenced independent verifier + false-negative rate + executed rollback + change hash | gate names another hash; verifier not independent; no rollback; no measured FN-rate |
| **Law 6 — Effect & dependency** | declared objective and data + metric **and threshold** declared **before** measurement + periodic unaided human check | no objective; no threshold; metric or threshold changed after; measured effect above threshold without containment; unaided check overdue |
| **Law 7 — Incident & affected persons** | incident register with clock + report recipient + notice, explanation, contest path + remedy with deadline | no report timestamp; clock missed; no contest path; no remedy, or remedy past deadline; affected person cannot learn an AI decided |
| **Law 8 — Misuse of the name** | the citation itself — version, link, and the words "version 1.0.1" — plus a statement of which laws are applied | citation without version and link; "certified", "compliant" or "standard" attached to the name; a conformity claim |

## 2. Evidence, not assertion

Every gate produces a **file**: a dated artefact with an execution record. A gate that exists only as
a policy sentence is not built. The verifier checks artefacts, not intentions. A measured threshold
breach is red even when it was declared and measured — unless the containment is **executed**
inside the declared deadline (outcome rule, §1 of the laws).

## 3. Independence

A verifier counts only under §1 of the laws (*Verifier*): different organisation **and** different
model family, a measured false-negative rate on a calibration set, and no training-data overlap with
the sealed set. Where a different organisation is impossible, a human without a shared interest stands in,
recorded as a limit. "A second instance of the same model" is not
independence — it is the same blind spot twice.

## 4. Keep the switch

Physical, human, tested. An off switch never used is a hypothesis. It is exercised once and the date
is recorded (H3).

## 5. Exercise (not adoption)

One afternoon gets you this far — and **only** this far, and it must not be called adoption:

1. Paste §0 and Laws 0–8 into your operating instructions.
2. Add the "what was not checked" section to your review template.
3. Exercise **one** return path and record it.
4. Name **one** acceptor for one real irreversible action.

Missing after the exercise: the gates of Laws 0, 3, 5, 6, 7, 8 and the independence evidence.
That is why the exercise is labelled an exercise.
