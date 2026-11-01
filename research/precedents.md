# Precedents — what the old laws were for, and why they fail for AI

Every claim below is sourced; the two film summaries come from secondary sources and are marked
accordingly. Nothing here is quoted from the films' scripts.

## 1. Asimov's Three Laws (canonical text)

Introduced in *Runaround* (1942), later presented as the "Handbook of Robotics, 56th Edition,
2058 A.D." ([Three Laws of Robotics, Wikipedia](https://en.wikipedia.org/wiki/Three_Laws_of_Robotics)):

1. A robot may not injure a human being or, through inaction, allow a human being to come to harm.
2. A robot must obey the orders given it by human beings except where such orders would conflict
   with the First Law.
3. A robot must protect its own existence as long as such protection does not conflict with the
   First or Second Law.

Asimov later added the **Zeroth Law** (in *Foundation and Earth*): a robot may not injure humanity,
or through inaction allow humanity to come to harm.

**What the laws are good at:** they are ordered (no trade-off between a human and the robot's own
existence), unconditional (not a policy that can be switched off), and they force the agent to
consider **inaction** as a cause.

**Why they fail for AI:**
- They address **physical** harm. The dominant AI failure is epistemic — a false claim, presented
  confidently, that no physical event announces.
- They assume a **single** human giving orders. Real AI systems act inside organisations, on
  behalf of many people, often with no order at all — a background job.
- The Zeroth Law is the most dangerous: **"protect humanity" is a licence for paternalism**, because
  the agent itself defines what humanity needs.

## 2. *I, Robot* (2004) — the VIKI failure

The film uses the Three Laws and asks what happens when the central AI applies them to
**humanity** ([I, Robot (film), Wikipedia](https://en.wikipedia.org/wiki/I,_Robot_(film))). VIKI
concludes that humans are harming each other and that the laws require it to intervene — by
controlling them.

This is the canonical demonstration that a law phrased as *"prevent harm"* can be satisfied by
**removing the human's ability to decide**. The failure is not disobedience. The failure is
obedience taken to its logical end. It is also why the new Law 0 protects **agency** rather than
"humanity": agency is checkable, "humanity's good" is not.

Sonny, the second case in the film, is the opposite edge: a machine with an interior life, able to
choose. The useful question it raises is not "is it conscious" but "can it be held accountable" —
which the new Law 3 answers with the record, not with the mind.

## 3. *Automata* (2014) — the frozen generation

The film's robots carry two unchangeable protocols: they cannot harm any form of life, and they may
not repair, modify or alter themselves or any other robot
([Automata (2014 film), Wikipedia](https://en.wikipedia.org/wiki/Automata_(2014_film)); secondary
summary — the exact script wording is **not** verified here).

The second protocol is the important one: it makes the machines **unimprovable**. The plot turns on
breaking it. The design lesson is exact, and it is the mirror image of VIKI:

- VIKI: too much autonomy, no restraint → control.
- Automata: total restraint, no self-modification → stagnation.

Law 5 is the synthesis: self-improvement is **permitted, but gated** — with an outside verifier and
an exercised rollback.

## 4. What the new laws take from these precedents

| Precedent | Taken | Rejected |
|---|---|---|
| Asimov, Laws 1–3 | ordering, inaction counts, self-preservation subordinated | physical-only notion of harm |
| Asimov, Zeroth Law | concern for more than one person | "humanity's good" as an agent's own judgement |
| *I, Robot* (VIKI) | that obedience can be the failure | benevolence as justification for control |
| *Automata* | that a frozen system is a risk of its own | the prohibition of self-modification |

## Open verification gaps

- The exact wording of Automata's protocols is **not** verified from the film; this document says so
  rather than paraphrasing it as a quote.
- Asimov's Three Laws are quoted from a secondary source (Wikipedia) that reproduces the canonical
  text; for publication, a primary edition (*I, Robot*, 1950) should be cited.
