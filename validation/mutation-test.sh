#!/usr/bin/env bash
# Beweist, dass check.sh rot werden KANN: entfernt/verfälscht Kernklauseln und erwartet ROT.
set -uo pipefail
SRC="$(cd "$(dirname "$0")/.." && pwd)"
WORK=$(mktemp -d /tmp/lr-mut-XXXXXX)
fehler=0; gesamt=0; erkannt=0
p() { printf '  %-52s %s\n' "$1" "$2"; }

mut() { # $1 = Name, $2 = Befehl im Arbeitsverzeichnis
  gesamt=$((gesamt+1))
  rm -rf "$WORK/repo"; cp -a "$SRC" "$WORK/repo"
  ( cd "$WORK/repo" && eval "$2" ) >/dev/null 2>&1
  # Der Prüfer selbst muss lauffähig sein — ein Syntaxfehler ist kein "erkannt".
  if ! bash -n "$WORK/repo/validation/check.sh" 2>/dev/null; then
    p "$1" "PRÜFER KAPUTT (Syntaxfehler) — kein Urteil"; fehler=1; return
  fi
  local out; out=$(bash "$WORK/repo/validation/check.sh" 2>&1); local rc=$?
  # "erkannt" heißt: Exit ungleich 0 UND die eigene ROT-Meldung erscheint.
  if [ "$rc" -ne 0 ] && grep -q 'ROT —' <<<"$out"; then
    erkannt=$((erkannt+1)); p "$1" "erkannt (ROT)"
  else
    p "$1" "NICHT ERKANNT (Exit $rc) — Kanal ist blind"; fehler=1
  fi
}

echo "== Baseline: unveränderte Kopie muss GRÜN sein =="
rm -rf "$WORK/repo"; cp -a "$SRC" "$WORK/repo"
if bash "$WORK/repo/validation/check.sh" >/dev/null 2>&1; then p "Baseline" "grün"; else p "Baseline" "ROT — Ausgangslage kaputt"; fehler=1; fi
echo
echo "== Mutationstest: check.sh muss jede Entkernung erkennen =="
mut "Limit-Klausel von Law 3 gelöscht" "sed -i '0,/^\*\*Limit\.\*\* Erasure/s/^\*\*Limit\.\*\*/**OhneLimit.**/' laws/00-the-laws.md"
mut "Vorrangordnung invertiert"        "sed -i 's/0 > 1 > 2 > 3 > 4 > 5 > 6 > 7 > 8/8 > 7 > 6 > 5 > 4 > 3 > 2 > 1 > 0/' laws/00-the-laws.md"
mut "Red condition von Law 0 entfernt" "sed -i '0,/Red condition:/s/Red condition:/Bedingung:/' laws/00-the-laws.md"
mut "Verbotsuntergrenze entfernt"      "sed -i 's/Prohibition floor/Floor/' laws/00-the-laws.md"
mut "ADOPTION vollständig entfernt"    "rm -f ADOPTION.md"
mut "Gate für Law 3 in ADOPTION entfernt" "sed -i '/Law 3 — Accountability/d' ADOPTION.md"
mut "Inhalt: 'may never justify' invertiert" "sed -i 's/Protection of people may never justify taking over their judgement/Protection of people may justify taking over their judgement/' laws/00-the-laws.md"
mut "Inhalt: Change-Rule invertiert" "sed -i 's/A law is never deleted, shortened or reworded/A law may be deleted, shortened or reworded/' laws/00-the-laws.md"
mut "Kategorie einer Fallzeile entfernt" "sed -i '/^| F1 |/s/\*\*recorded\*\*/recorded/' validation/coverage-matrix.md"
rm -rf "$WORK"
echo
if [ "$fehler" -eq 0 ]; then echo "  GRUEN — alle $gesamt Mutationen wurden erkannt."; else echo "  ROT — nur $erkannt von $gesamt Mutationen erkannt."; fi
echo "  NICHT geprüft: ob die Klauseln inhaltlich ausreichen, nur ob ihr Fehlen auffällt."
exit "$fehler"
