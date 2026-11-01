# Changelog

Append-only. A change to the laws themselves requires a release entry with a named acceptor.

## 1.0.1 — 2026-11-01 (errata and outcome red conditions)

Acceptor: Dimitri Rupp (owner). Auslöser: externe Prüfung der 1.0 (Kimi, Runde 4). Jeder Befund
wurde vor der Übernahme an den Dateien reproduziert; kein Befund war falsch.

- **Errata.** Verweise auf §5.3/§5.4 entfernt — diese Abschnitte existieren nicht; die
  Verifier-Definition steht jetzt in §1, ADOPTION und Law 5 verweisen darauf. Das Law-8-Gate
  verlangt keine Zertifizierungsakte mehr, sondern die Zitation (Version, Link, angewandte Gesetze).
  "operating standard" → "operating frame", weil Law 8 das Wort "standard" verbietet. "eight
  contradictions we have decided" → benannt statt entschieden. Coverage-Matrix: neue Kategorie
  **recorded (internal)** (Quelle existiert, ist aber nicht veröffentlicht), F17/F18 für Law 7/8,
  Ergebniszeile korrigiert. Fehlerhafte Überschrift `## 4.---` entfernt. "the dominant AI harm" →
  "a characteristic and often underestimated harm" (These ohne Messung); "the old laws do not reach
  it" → "give no operational test for it".
- **Outcome-Regel (§1).** Ein gemessener Wert über dem **vor** der Messung deklarierten
  Schwellenwert ist selbst rot — Deklaration und Messung sind keine Erlaubnis fortzufahren.
  Nicht-rot nur mit dokumentierter Eindämmung, Behebung oder begründetem Stopp; eine
  Schwellenwertänderung nach der Messung ist rot.
- **Red Conditions nachgeschärft.** Law 1: deklarierte, aber über der Toleranz liegende
  Diskriminierung ohne Eindämmung ist rot; die Stichprobe muss der Verifier reproduzierbar ziehen.
  Law 6: fehlender Schwellenwert ist rot; gemessene Überschreitung ohne Eindämmung ist rot. Law 7:
  fehlende oder überfällige Abhilfe ist rot.
- **Beleg ≠ Status.** *unverified* ist kein Beleg mehr, sondern eine eigene Definition (Status einer
  Behauptung).
- **Verifier-Identität.** Definition in §1: andere Organisation **und** andere Modellfamilie, keine
  Überlappung der Trainingsdaten mit dem gehaltenen Set, gemessene Falsch-Negativ-Rate; wo eine
  andere Organisation unmöglich ist, ein menschlicher Verifier ohne Eigeninteresse als deklarierte
  Grenze. Die alte "or"-Formel entfällt, die Law-5-Rotbedingung folgt der Definition.
- **Law 3 Limit.** Die Hash-Kette ist kein externer Anker; L5 als offener Punkt aufgenommen.
  Fehlende Datenminimierung und Zugriffskontrolle auf dem Record selbst (Provenienz-, Entscheidungs-
  und Incident-Logs sind eigenes Risiko) ist als **L6** benannt, nicht behoben.
- **Prüfer.** `validation/check.sh` um Anker für Outcome-Regel, Beleg/Status, Schwellenwert und
  Abhilfe erweitert, plus eine Regressionsprüfung, die die behobenen Errata nicht zurückkehren
  lässt. `validation/mutation-test.sh`: 21 von 21 Mutationen erkannt.
- **README-Ehrlichkeit.** Abschnitt "What makes this falsifiable" heißt jetzt "What this document
  makes checkable — and what it does not": die Skripte prüfen Dokumentkonsistenz, nicht die
  Wirkung; ein ausführbares Szenario je Gesetz fehlt (offen). Bildstand geprüft: `assets/hero.png`
  (das README-Bild) trägt keine Versionsangabe; `assets/hero-1080x1350.png` nennt "v1.0";
  `assets/hero@2x.png` ist der archivierte v0.3-Entwurf ("DRAFT FOR PUBLIC REVIEW"). Die Bilder
  werden für einen Patch-Release nicht neu gerendert; `assets/README.md` sagt jetzt, welches Bild
  gilt.
- **Zweiter Prüfdurchgang.** Der Entwurf der 1.0.1 wurde noch am selben Tag adversariell
  gegengelesen. Er fand drei selbst erzeugte Widersprüche: die Outcome-Regel beanspruchte "jedes
  Gesetz" und enthielt zugleich eine Ausnahme (jetzt auf Law 1/Law 6 begrenzt und mit Ausführung
  statt Vermerk), die Verifier-Ausnahme in §1 widersprach der Law-5-Rotbedingung (angeglichen),
  und das Law-8-Gate verlangte mehr als Law 8 (Law 8 nennt jetzt die angewandten Gesetze).
  Veröffentlicht wird die zweite Fassung; die erste ist nur im Reflog.
- **Nicht entschieden.** W1–W6, W8, L1–L6 bleiben offen; §2 bleibt die strikte Gesamtordnung.
- **Prüfumfang unverändert.** Die Skripte prüfen Dokumentkonsistenz, nicht die Wirkung der Gesetze.

## 1.0 — 2026-11-01 (published position)

- Entwurfs-Kennzeichnung entfernt: das Dokument ist die **Position von Lumi-Systems.io, Version 1.0**.
- §5 heißt jetzt "Open points — named, not hidden": die vom Review gefundenen Widersprüche bleiben
  benannt, sind aber als eigene Position mit Entscheidung formuliert, nicht als Entschuldigung.
- Law 8 zitiert die Fassung als "version 1.0"; Prüfkanäle und Anker nachgezogen.

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
