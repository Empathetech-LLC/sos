#!/usr/bin/env bash

set -eou pipefail

## Setup ##

ARB_DIR="$HOME/repos/flutter/sos/lib/l10n"
SRC_FILE="$ARB_DIR/lang_en_US.arb"

# Build a map of lang -> file, skipping duplicates (keep first)
declare -A LANG_FILE
for f in "$ARB_DIR"/lang_*.arb; do
  [[ -f "$f" ]] || continue
  locale=$(basename "$f" .arb)
  locale=${locale#lang_}
  base=${locale%%_*}
  base=${base,,}
  
  if [[ -z "${LANG_FILE[$base]:-}" ]]; then
    LANG_FILE[$base]="$f"
  fi
done
unset LANG_FILE["en"]

## Preamble ##

echo; echo "Comparing all rights screen (rs) entries"
echo "Reminder: we're not looking for exact matches, but for meaning matches"; echo

echo "Enter/space marks a group success"
echo "If there are lines that need review, enter a CSV of the language codes (e.g. ar,zh)"
echo; read -p "Press enter to start..."

## Make it so ##

# Gather rs* keys (line number and key) from English source
mapfile -t RS_LINES < <(grep -nE '"rs[^"]*"[[:space:]]*:' "$SRC_FILE" || true)
if [[ ${#RS_LINES[@]} -eq 0 ]]; then
  echo "No rs* entries found in $SRC_FILE" >&2
  exit 1
fi
declare -A FAILS  # FAILS[lang]="line1,line2,..."

JSON_LINE_REGEX='^[[:space:]]*"([^"]+)"[[:space:]]*:[[:space:]]*"(.*)"[[:space:]]*,?[[:space:]]*$'
for entry in "${RS_LINES[@]}"; do
  line_num="${entry%%:*}"
  line_content="${entry#*:}"

  # Get key and English source value
  if [[ "$line_content" =~ $JSON_LINE_REGEX ]]; then
    key="${BASH_REMATCH[1]}"
    en_value="${BASH_REMATCH[2]}"
  else
    echo "Warning: Could not parse line $line_num in $SRC_FILE: $line_content" >&2
    continue
  fi  
  clear; echo "$key"; echo "    $en_value"; echo

  # Get translated values and their translate-shell results
  for base in "${!LANG_FILE[@]}"; do
    file="${LANG_FILE[$base]}"

    # find the key line in that file
    match_line=$(grep -nE "\"${key}\"[[:space:]]*:" "$file" || true)
    if [[ -z "$match_line" ]]; then
      # no translation for this key in that language
      echo "$base: (missing)"; echo "    (re-run gen-l10n)"; echo
      continue
    fi

    other_line_num="${match_line%%:*}"
    other_line_content="${match_line#*:}"
    
    if [[ "$other_line_content" =~ $JSON_LINE_REGEX ]]; then
      other_val="${BASH_REMATCH[2]}"
    else
      other_val="[parsing failed]"
    fi
    echo "$base: \"$other_val\" ->"
    
    # use translate-shell to translate into English (auto-detect source)
    trans_out=$(trans -b :en "$other_val" 2>/dev/null || printf '[translate failed]')
    echo "    $trans_out"; echo
  done

  # Prompt user 
  read -r -p "> " user_in

  # trim whitespace
  user_trimmed="$(echo "$user_in" | sed -E 's/^[[:space:]]+|[[:space:]]+$//g')"
  if [[ -z "$user_trimmed" ]]; then
    continue
  fi

  # Mark failures
  IFS=',' read -r -a err_langs <<< "$user_trimmed"
  for raw in "${err_langs[@]}"; do
    lang_tmp="${raw//[[:space:]]/}"
    lang="${lang_tmp,,}"
    [[ -z "$lang" ]] && continue

    if [[ -n "${LANG_FILE[$lang]:-}" ]]; then
      file="${LANG_FILE[$lang]}"
      match_line=$(grep -nE "\"${key}\"[[:space:]]*:" "$file" || true)
      if [[ -n "$match_line" ]]; then
        other_line_num="${match_line%%:*}"
        if [[ -z "${FAILS[$lang]:-}" ]]; then
          FAILS[$lang]="$other_line_num"
        else
          FAILS[$lang]="${FAILS[$lang]},$other_line_num"
        fi
      else
        # if key missing in that lang file, record the english line number as reference
        if [[ -z "${FAILS[$lang]:-}" ]]; then
          FAILS[$lang]="$line_num"
        else
          FAILS[$lang]="${FAILS[$lang]},$line_num"
        fi
      fi
    else
      echo "Warning: language '$lang' not tracked or not present (skipping)" >&2
    fi
  done
done

## Report ##

if [[ ${#FAILS[@]} -eq 0 ]]; then
  echo "Looks great! No issues found."
  exit 0
fi

echo; echo "=== L10N AUDIT FAILURES ==="
for lang in "${!FAILS[@]}"; do
  # remove possible duplicate line numbers and sort
  IFS=',' read -r -a arr <<< "${FAILS[$lang]}"
  uniq_sorted=$(printf '%s\n' "${arr[@]}" | awk '!seen[$0]++' | sort -n | paste -sd, -)
  echo "$lang: $uniq_sorted"
done