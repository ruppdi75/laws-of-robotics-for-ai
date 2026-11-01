#!/usr/bin/env bash
# Substanzprüfung des Gesetzes-Repos. Kann rot werden — und wird es im Mutationstest bewiesen.
set -uo pipefail
cd "$(dirname "$0")/.." || exit 1
fehler=0
rot() { printf '  ROT  %s\n' "$1"; fehler=1; }
ok()  { printf '  OK   %s\n' "$1"; }
zaehle() { grep -c -- "$1" "$2" 2>/dev/null || echo 0; }

echo "== 1. Neun Gesetze mit vier Teilen =="
for teil in '**Statement.**' '**Failure prevented.**' '**Enforcement.**' '**Limit.**'; do
  n=$(grep -c "^$teil" laws/00-the-laws.md)
  [ "$n" -eq 9 ] && ok "$teil 9×" || rot "$teil nur ${n}× (erwartet 9)"
done
for n in 0 1 2 3 4 5 6 7 8; do
  grep -q "^### Law $n " laws/00-the-laws.md || rot "Law $n fehlt"
done
rc=$(zaehle 'Red condition:' laws/00-the-laws.md)
[ "$rc" -ge 9 ] && ok "Red conditions: $rc" || rot "nur $rc Red conditions (erwartet >= 9)"

echo "== 2. Vorrang, Verbotsuntergrenze, Zertifizierung =="
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

echo "== 5. Deckungsmatrix: Quelle je Zeile, Kategorien =="
rows=$(grep -cE '^\| F[0-9]+ ' validation/coverage-matrix.md)
[ "$rows" -ge 16 ] && ok "$rows Fallzeilen" || rot "nur $rows Fallzeilen"
for k in '\*\*recorded\*\*' '\*\*film\*\*' '\*\*open gap\*\*'; do
  c=$(grep -cE "^\| F[0-9]+ .*$k" validation/coverage-matrix.md)
  [ "$c" -ge 1 ] && ok "Kategorie $k: $c" || rot "Kategorie $k fehlt"
done
unbelegt=$(grep -E '^\| F[0-9]+ ' validation/coverage-matrix.md | grep -vcE '\*\*recorded\*\*|\*\*film\*\*|\*\*open gap\*\*' || true)
[ "${unbelegt:-0}" -eq 0 ] && ok "keine Zeile ohne Kategorie/Quelle" || rot "$unbelegt Zeilen ohne Kategorie"

echo "== 6. Unbelegte Behauptung darf nicht im Repo stehen =="
if grep -rq --exclude=check.sh --exclude=mutation-test.sh 'The proof is that each law' . 2>/dev/null; then rot "unbelegte 'proof'-Behauptung gefunden"; else ok "keine unbelegte proof-Behauptung"; fi

echo "== 7. Changelog zum Stand =="
ver=$(grep -m1 '^# The Laws' laws/00-the-laws.md | grep -oE 'v[0-9]+\.[0-9]+')
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
echo "== 10. Redteam zitiert die geltende Fassung =="
grep -qF "any law 0–8" validation/redteam.md && ok "Redteam nennt 0–8" || rot "Redteam nennt veraltete Gesetzesnummer"
grep -qF "repeated on a declared interval" validation/redteam.md && ok "Redteam zitiert Wiederholung" || rot "Redteam zitiert alte Einmal-Klausel"
echo "== 11. Law 8 nennt die Mißbrauchsgrenze =="
block8=$(awk '/^### Law 8 /{f=1} f' laws/00-the-laws.md)
grep -q 'may \*\*not\*\* be cited as a standard' <<<"$block8" && ok "Law 8: Mißbrauchsgrenze" || rot "Law 8 ohne Mißbrauchsgrenze"

echo
if [ "$fehler" -eq 0 ]; then echo "  GRUEN — Substanzprüfung bestanden."; else echo "  ROT — Substanz unvollständig."; fi
echo "  NICHT geprüft: inhaltliche Triftigkeit, Rechtslage im Detail, Wirkung im Feld."
exit "$fehler"
