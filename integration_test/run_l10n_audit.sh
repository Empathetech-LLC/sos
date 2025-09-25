#!/usr/bin/env bash

set -e

L10N_DIR="lib/l10n"
EN_FILE="$L10N_DIR/lang_en.dart"

if ! command -v trans >/dev/null 2>&1; then
  echo "ERROR: translate-shell (trans) not found in PATH. Install it and retry." >&2
  exit 2
fi

declare -A LANG_FILE
for f in "$L10N_DIR"/lang_*.dart; do
  fn=$(basename "$f")
  code=${fn#lang_}
  code=${code%.dart}
  base=${code%%_*} # reduce ar_EG -> ar
  if [ "$base" = "en" ]; then
    continue
  fi
done

# build list of keys + english text + line numbers
mapfile -t KEYS < <(grep -nE "String get rs[A-Za-z0-9_]+" "$EN_FILE" | sed -E 's/^([0-9]+):.*String get ([A-Za-z0-9_]+).*/\1|\2/')

declare -A FAIL_LINES
sep=$'\n'

# helper trim
trim() { echo "$1" | awk '{$1=$1;print}'; }

for item in "${KEYS[@]}"; do
  ln=${item%%|*}
  key=${item##*|}

  # extract english value
  en=$(perl -0777 -ne "if(/String get ${key}\\s*=>\\s*'(.*?)'\\s*;/s){ print \$1 }" "$EN_FILE")
  # unescape '\'' sequences for display
  en_display=$(printf "%s" "$en" | sed "s/\\\\'/'/g")

  # clear screen and show english then a blank line
  clear
  echo "Key: $key (line $ln)"; echo
  echo "en: \"$en_display\""; echo

  # attempt to extract and translate the translations
  for lang in "${!LANG_FILE[@]}"; do
    lf="${LANG_FILE[$lang]}"
    tr=$(perl -0777 -ne "if(/String get ${key}\\s*=>\\s*'(.*?)'\\s*;/s){ print \$1 }" "$lf" || true)
    if [ -z "$tr" ]; then
      continue
    fi
    tr_display=$(printf "%s" "$tr" | sed "s/\\\\'/'/g")

    # back-translate to English using translate-shell; keep it short
    bt=$(trans -b :en "$tr_display" 2>/dev/null || echo "[translation failed]")
    echo "${lang}: \"$tr_display\""
    echo " -> $bt"
    echo
  done

  # Prompt for pass/fail
  echo "Mark failures as CSV (e.g. lang1, lang2) or press Enter to accept:"
  read -r resp
  resp=$(trim "$resp")

  if [ -n "$resp" ]; then
    # parse CSV, add line number to each failed lang
    IFS=',' read -ra arr <<< "$resp"
    for raw in "${arr[@]}"; do
      lineNum=$(trim "$raw")
      lineNum=${lineNum%%_*}
      
      if [ -z "${FAIL_LINES[$lineNum]}" ]; then
        FAIL_LINES[$lineNum]="$ln"
      else
        FAIL_LINES[$lineNum]="${FAIL_LINES[$lineNum]},$ln"
      fi
    done
  fi

  # continue to next entry on Enter/space (already consumed)
done

# Print the results
echo; echo "Audit complete."; echo

for lang in "${!FAIL_LINES[@]}"; do
  echo "$lang: ${FAIL_LINES[$lang]}"
done

if [ "${#FAIL_LINES[@]}" -gt 0 ]; then
  exit 1
fi
