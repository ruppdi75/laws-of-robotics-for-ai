#!/usr/bin/env bash
# Substanzprüfung des Gesetzes-Repos. Kann rot werden — und wird es im Mutationstest bewiesen.
set -uo pipefail
cd "$(dirname "$0")/.." || exit 1
fehler=0
rot() { printf '  ROT  %s\n' "$1"; fehler=1; }
ok()  { printf '  OK   %s\n' "$1"; }
zahl() { local n; n=$(grep -cE -- "$1" "$2" 2>/dev/null); printf '%s' "${n:-0}"; }

echo "== 1. Neun Gesetze mit vier Teilen =="
for teil in '**Statement.**' '**Failure prevented.**' '**Enforcement.**' '**Limit.**'; do
  n=$(grep -c "^$teil" laws/00-the-laws.md || true)
  [ "${n:-0}" -eq 9 ] && ok "$teil 9×" || rot "$teil nur ${n:-0}× (erwartet 9)"
done
for n in 0 1 2 3 4 5 6 7 8; do
  grep -q "^### Law $n " laws/00-the-laws.md || rot "Law $n fehlt"
done
rc=$(zahl 'Red condition:' laws/00-the-laws.md)
[ "$rc" -ge 9 ] && ok "Red conditions: $rc" || rot "nur $rc Red conditions (erwartet >= 9)"

echo "== 2. Vorrang, Verbotsuntergrenze, Mißbrauchsgrenze =="
for anker in 'Supremacy of law' 'Prohibition floor' 'Risk classification' 'Role clarity' 'Open points' 'No certification'; do
  grep -q "$anker" laws/00-the-laws.md && ok "$anker" || rot "$anker fehlt"
done
grep -qi 'may \*\*not\*\* be cited as a standard\|misusing them' laws/00-the-laws.md && ok "Mißbrauchsgrenze geregelt" || rot "Mißbrauchsgrenze fehlt"

echo "== 3. Vorrangordnung streng und total =="
grep -q 'strict total order' laws/00-the-laws.md && ok "Totale Ordnung benannt" || rot "keine totale Ordnung"
grep -q '0 > 1 > 2 > 3 > 4 > 5 > 6 > 7 > 8' laws/00-the-laws.md && ok "Reihenfolge 0..8" || rot "Reihenfolge fehlt"

echo "== 4. Adoption: Gate je Gesetz =="
for n in 0 1 2 3 4 5 6 7 8; do
  grep -q "Law $n" ADOPTION.md || rot "ADOPTION ohne Gate für Law $n"
done
grep -q 'exercise, not adoption\|Exercise (not adoption)' ADOPTION.md && ok "Übung ≠ Adoption gekennzeichnet" || rot "Abgrenzung fehlt"

echo "== 5. Deckungsmatrix: Quelle je Zeile, Kategorien, Fall je Gesetz =="
rows=$(zahl '^\| F[0-9]+ ' validation/coverage-matrix.md)
[ "$rows" -ge 18 ] && ok "$rows Fallzeilen" || rot "nur $rows Fallzeilen (erwartet >= 18)"
rec=$(zahl '^\| F[0-9]+ .*\*\*recorded \(internal\)\*\*' validation/coverage-matrix.md)
film=$(zahl '^\| F[0-9]+ .*\*\*film\*\*' validation/coverage-matrix.md)
gap=$(zahl '^\| F[0-9]+ .*\*\*open gap\*\*' validation/coverage-matrix.md)
[ "$rec" -ge 1 ] && ok "Kategorie recorded (internal): $rec" || rot "Kategorie recorded (internal) fehlt"
[ "$film" -ge 1 ] && ok "Kategorie film: $film" || rot "Kategorie film fehlt"
[ "$gap" -ge 1 ] && ok "Kategorie open gap: $gap" || rot "Kategorie open gap fehlt"
unbelegt=$(grep -E '^\| F[0-9]+ ' validation/coverage-matrix.md | grep -vcE '\*\*recorded \(internal\)\*\*|\*\*film\*\*|\*\*open gap\*\*' || true)
[ "${unbelegt:-0}" -eq 0 ] && ok "keine Zeile ohne Kategorie/Quelle" || rot "$unbelegt Zeilen ohne Kategorie"
laws_im_matrix=$(awk -F'|' '/^\| F[0-9]+ /{gsub(/H[0-9]+/,"",$5); print $5}' validation/coverage-matrix.md \
                  | grep -oE '[0-9]' | sort -u | tr '\n' ' ')
[ "$laws_im_matrix" = "0 1 2 3 4 5 6 7 8 " ] && ok "jedes Gesetz 0–8 hat mindestens einen Fall" \
  || rot "Gesetze ohne Fall: $(comm -23 <(printf '0\n1\n2\n3\n4\n5\n6\n7\n8\n') <(printf '%s' "$laws_im_matrix" | tr ' ' '\n' | grep -v '^$' | sort) | tr '\n' ' ')"
claim_cases=$(grep -oE 'Cases: \*\*[0-9]+\*\*' validation/coverage-matrix.md | grep -oE '[0-9]+')
claim_rec=$(grep -oE 'recorded \(internal\): \*\*[0-9]+\*\*' validation/coverage-matrix.md | grep -oE '[0-9]+')
claim_film=$(grep -oE 'film illustrations: \*\*[0-9]+\*\*' validation/coverage-matrix.md | grep -oE '[0-9]+')
claim_gap=$(grep -oE 'open gaps: \*\*[0-9]+\*\*' validation/coverage-matrix.md | grep -oE '[0-9]+')
[ "$claim_cases" = "$rows" ] && ok "Ergebniszahl Fälle = Zeilen ($rows)" || rot "Ergebnis nennt ${claim_cases:-?} Fälle, Matrix hat $rows"
[ "$claim_rec" = "$rec" ] && ok "Ergebniszahl recorded (internal) = $rec" || rot "Ergebnis nennt ${claim_rec:-?} recorded, Matrix hat $rec"
[ "$claim_film" = "$film" ] && ok "Ergebniszahl film = $film" || rot "Ergebnis nennt ${claim_film:-?} film, Matrix hat $film"
[ "$claim_gap" = "$gap" ] && ok "Ergebniszahl open gaps = $gap" || rot "Ergebnis nennt ${claim_gap:-?} open gaps, Matrix hat $gap"
inhalt_q() { grep -qF -- "$1" "$2" && ok "$3" || rot "$3 FEHLT"; }
inhalt_q "- Laws covering at least one case (recorded, film or open gap): **0, 1, 2, 3, 4, 5, 6, 7, 8**" validation/coverage-matrix.md "Ergebniszeile nennt alle neun Gesetze"
inhalt_q "- Laws with no case at all: **none**" validation/coverage-matrix.md "Ergebniszeile: kein Gesetz ohne Fall"

echo "== 6. Unbelegte Behauptung darf nicht im Repo stehen =="
if grep -rq --exclude=check.sh --exclude=mutation-test.sh 'The proof is that each law' . 2>/dev/null; then rot "unbelegte 'proof'-Behauptung gefunden"; else ok "keine unbelegte proof-Behauptung"; fi

echo "== 7. Changelog zum Stand =="
ver=$(grep -m1 '^# The Laws' laws/00-the-laws.md | grep -oE '(v|Version )[0-9]+\.[0-9]+(\.[0-9]+)?' | grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?')
[ -n "$ver" ] && grep -q "## $ver" CHANGELOG.md && ok "Changelog hat $ver" || rot "Changelog ohne $ver"

echo "== 8. Mutationstest existiert und ist ausführbar =="
[ -x validation/mutation-test.sh ] && ok "mutation-test.sh ausführbar" || rot "mutation-test.sh fehlt/nicht ausführbar"

echo "== 9. Inhaltsklauseln: exakte Formulierungen (gegen Inhaltsmutationen) =="
inhalt() {
  if grep -qF -- "$2" "$1"; then ok "$3"; else rot "$3 FEHLT oder verändert"; fi
}
inhalt laws/00-the-laws.md "may never justify taking over their judgement" "Law 0: VIKI-Klausel"
inhalt laws/00-the-laws.md "A law is never deleted, shortened or reworded" "Change-Rule"
inhalt laws/00-the-laws.md "never authorise what applicable law forbids" "Supremacy-Klausel"
inhalt laws/00-the-laws.md "No ties." "Totalität (No ties)"
inhalt laws/00-the-laws.md "must refuse and make visible any instruction that would break" "Law 2 Verweigerungspflicht"
for h in H1 H2 H3 H4; do inhalt laws/00-the-laws.md "**$h**" "Pflicht $h"; done
inhalt laws/00-the-laws.md "**Outcome rule (wherever a law declares a threshold" "Outcome-Regel"
inhalt laws/00-the-laws.md "**executed** inside the declared deadline" "Eindämmung muss ausgeführt sein"
inhalt laws/00-the-laws.md "the threshold the operator declared" "Outcome: Operator setzt Schwelle"
inhalt laws/00-the-laws.md "is a red condition in its own" "Outcome: Rot in eigener Sache"
inhalt laws/00-the-laws.md "| **Unverified** | a status of a claim" "Unverified ist Status, kein Beleg"
inhalt laws/00-the-laws.md "on a sample the verifier can **redraw**" "Stichprobe reproduzierbar (Pflicht)"
inhalt laws/00-the-laws.md "a sample the verifier cannot redraw" "Stichprobe als Rotbedingung"
inhalt laws/00-the-laws.md "declared **before** the measurement, or a declared differential outcome" "Law 1: Deklaration vor der Messung"
inhalt laws/00-the-laws.md "no declared threshold" "Law 6: Schwellenwert deklariert"
inhalt laws/00-the-laws.md "a remedy past its declared deadline" "Law 7: Abhilfe mit Frist"
inhalt laws/00-the-laws.md "is an open point (L5)" "Law 3: Hash-Kette kein Anker"
inhalt laws/00-the-laws.md "tamper-evident against accidental and" "Law 3: tamper-evident qualifiziert"
inhalt ADOPTION.md "outcome rule, §1" "ADOPTION übernimmt Outcome-Regel"

echo "== 10. Redteam zitiert die geltende Fassung =="
grep -qF "any law 0–8" validation/redteam.md && ok "Redteam nennt 0–8" || rot "Redteam nennt veraltete Gesetzesnummer"
grep -qF "repeated on a declared interval" validation/redteam.md && ok "Redteam zitiert Wiederholung" || rot "Redteam zitiert alte Einmal-Klausel"

echo "== 11. Law 8 nennt die Mißbrauchsgrenze =="
block8=$(awk '/^### Law 8 /{f=1} f' laws/00-the-laws.md)
grep -q 'may \*\*not\*\* be cited as a standard' <<<"$block8" && ok "Law 8: Mißbrauchsgrenze" || rot "Law 8 ohne Mißbrauchsgrenze"

echo "== 12. Errata dürfen nicht zurückkehren (nur veröffentlichte Fassung) =="
errata() { # $1 = Muster, $2 = Name
  local treffer=""
  for f in README.md ADOPTION.md laws/00-the-laws.md validation/redteam.md validation/coverage-matrix.md research/precedents.md; do
    grep -qF -- "$1" "$f" 2>/dev/null && treffer="$treffer $f"
  done
  if [ -n "$treffer" ]; then rot "Errata zurück: $2 in$treffer"; else ok "kein $2"; fi
}
errata 'a command with output, or a source with a date, or the marker *unverified*' "unverified als Evidence"
errata '§5.3' "Verweis auf §5.3"
errata '§5.4' "Verweis auf §5.4"
errata 'certification record' "Zertifizierungsakte im Adoption-Gate"
errata 'operating standard' "Selbstbezeichnung als Standard"
errata 'eight contradictions we have decided' "entschiedene Widersprüche"
errata 'conformity claim requires' "Conformity-Claim im README"
errata 'The dominant AI harm' "unbelegte Dominanz-Behauptung"
errata 'dominant harm of AI systems' "unbelegte Dominanz-Behauptung (README)"
errata 'Two independent reviews shaped' "falsche Review-Anzahl"
errata '## 4.---' "fehlerhafte Überschrift"

echo "== 13. Assets sind deklariert =="
[ -f assets/README.md ] && ok "assets/README.md vorhanden" || rot "assets/README.md fehlt"
grep -q "archived" assets/README.md && ok "v0.3-Entwurf als archiviert gekennzeichnet" || rot "archived-Hinweis fehlt"
for b in hero.png hero-1080x1350.png hero@2x.png; do [ -f "assets/$b" ] && ok "assets/$b vorhanden" || rot "assets/$b fehlt"; done

echo "== 14. Zähl- und Versionskonsistenz =="
mut_n=$(zahl '^mut "' validation/mutation-test.sh)
[ "$mut_n" -ge 1 ] || rot "keine Mutationen gefunden"
for f in README.md REVIEW-FINDINGS.md; do
  behauptet=$(grep -oE '\*\*[0-9]+ of [0-9]+ mutations detected\*\*' "$f" | grep -oE '[0-9]+' | head -1)
  [ "${behauptet:-x}" = "$mut_n" ] && ok "$f nennt $behauptet/$mut_n Mutationen" \
    || rot "$f nennt ${behauptet:-nichts}, Skript hat $mut_n Mutationen"
done
w=$(zahl '^\| W[0-9] ' laws/00-the-laws.md); l=$(zahl '^\| L[0-9] ' laws/00-the-laws.md)
[ "$w" -eq 8 ] && ok "§5: $w Widersprüche W1–W8" || rot "§5 hat $w Widersprüche (erwartet 8)"
[ "$l" -eq 6 ] && ok "§5: $l offene Lücken L1–L6" || rot "§5 hat $l Lücken (erwartet 6)"
grep -q 'eight contradictions' README.md && ok "README nennt acht Widersprüche" || rot "README nennt die Zahl nicht"
grep -q 'six gaps' README.md && ok "README nennt sechs Lücken" || rot "README nennt die Lückenzahl nicht"
grep -qF "**Version:** $ver" README.md && ok "README nennt Version $ver" || rot "README ohne Version $ver"
grep -qF "\"version $ver\"" laws/00-the-laws.md && ok "Law 8 zitiert Version $ver" || rot "Law 8 zitiert andere Version"
grep -qF "version $ver" ADOPTION.md && ok "ADOPTION zitiert Version $ver" || rot "ADOPTION zitiert andere Version"

echo
if [ "$fehler" -eq 0 ]; then echo "  GRUEN — Substanzprüfung bestanden."; else echo "  ROT — Substanz unvollständig."; fi
echo "  NICHT geprüft: inhaltliche Triftigkeit, Rechtslage im Detail, Wirkung im Feld."
exit "$fehler"
