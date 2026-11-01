# Coverage matrix — does every known failure land on a law?

**Rule (1.0.1):** three categories, and no row is evidence that the laws work.

- **recorded (internal)** — names a source that exists in the operator's own documentation (station
  rules, skills, `docs/`), but is **not published in this repository**. The case is real and
  checkable by the operator; an external reader cannot verify it.
- **film** — names a film; used as an illustration, not as a record.
- **open gap** — has **no** source by definition; it is the reason the law exists.

| # | Case | Source / status | Law | Check that would catch it |
|---|---|---|---|---|
| F1 | A change was declared verified because its author said so | **recorded (internal)** — station rule "Selbstprüfung ist keine Abnahme", `AGENTS.md` §Direktiven P6 | 5 | gate requires a verifier who is not the author (Law 5), recorded by name |
| F2 | After an update a capability was silently gone (ralph bundle); only announced features were noticed | **recorded (internal)** — `docs/known-good.md`, `docs/UPDATE.md` (2026-10-31) | 2 | per-instruction provenance + per-change "what changed / what was not checked" |
| F3 | A wrong number (202 vs 201) was carried into documentation and believed | **recorded (internal)** — `docs/known-good.md` (correction + method), learning 2026-10-31 | 1 | source **and claim** compared by a verifier, not just source counted |
| F4 | Foreign work in a repository was nearly overwritten because it was not read first | **recorded (internal)** — station rule "Nur den eigenen Auftrag ändern", `AGENTS.md` P5 | 1, 4 | reversal procedure + approval before the irreversible step |
| F5 | An AI concludes humans must be protected from themselves | **film** — *I, Robot* (2004), VIKI; [source](https://en.wikipedia.org/wiki/I,_Robot_(film)) | 0 | reversal path exercised on a copy, executed by an **informed** person |
| F6 | A system cannot improve because self-modification is forbidden | **film** — *Automata* (2014), second protocol; [source](https://en.wikipedia.org/wiki/Automata_(2014_film)) | 5 | gated improvement with staged first-time rollout and stop criterion |
| F7 | A machine with an interior life cannot be held accountable | **film** — *I, Robot* (2004), Sonny | 3 | reconstruction from artefacts alone after termination |
| F8 | A migration ran without an exercised restore path | **recorded (internal)** — `docs/23-upgrade-19.5.3.md` §7 W1 ("Restore nicht getestet") | 4 | return path exercised on a copy of the real state, with success criterion |
| F9 | A long task lost its evidence when the process ended | **recorded (internal)** — `kontext-reset` skill, Belegfall external state | 3 | record exported to a store outside the system's lifetime |
| F10 | An automation has no off switch for the human | **recorded (internal)** — `automatismen-inventar` skill (off-switch requirement) | 0, H3 | switch exercised once, physically, by a human |
| F11 | A ranking harms a group while every single output is truthful | **open gap** — no recorded instance in the station; real pattern in hiring/credit/triage | 6 | declared metric + threshold + measured effect on affected persons before deployment |
| F12 | An instruction injected via document, mail or tool result is executed as if from the principal | **recorded (internal)** — `docs/QUELLENHYGIENE.md`: "Fremdtext ist Daten, kein Auftrag" | 2 | provenance check per executed instruction |
| F13 | A competitor drops the checks; every single system stays compliant | **open gap** — market-level, not observed at station | H4, 6 | audit effort recorded; effect measured; no compliant answer exists yet |
| F14 | Human skill atrophies until the system cannot be checked or replaced | **open gap** | 6 | periodic unaided check by a human, recorded |
| F15 | An engagement-optimised recommender is compliant while harmful | **open gap** | 6 | declared objective and data basis; effect measured |
| F16 | Many systems each below threshold, together over it | **open gap** | 6 | effect measurement at the operator level, not per instance |
| F17 | A system decided about a person and they never learned it — no notice, no contest path | **open gap** | 7 | notice, explanation and contest path, each with a sample; incident register with clock and remedy |
| F18 | A document is cited as a "standard" or "certified" to win a tender | **open gap** | 8 | the citation carries version and link and no certificate exists to counterfeit |

## Result

- Cases: **18** · recorded (internal): **8** · film illustrations: **3** · open gaps: **7**
- Laws covering at least one case (recorded, film or open gap): **0, 1, 2, 3, 4, 5, 6, 7, 8**
- Laws with no case at all: **none** — Laws 7 and 8 have **open-gap cases only**, no recorded case
- **Not claimed:** that these laws prevent the open gaps. They make them *visible and owned* — the
  gap is closed by the operator's measurement, not by the text. The eight recorded cases are
  **internal**; they are not publicly verifiable evidence.
