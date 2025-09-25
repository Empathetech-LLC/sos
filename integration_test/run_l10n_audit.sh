#!/usr/bin/env bash

set -e

ARB_DIR="$HOME/repos/flutter/sos/lib/l10n"
SRC_FILE="$ARB_DIR/lang_en.arb"

if [[ ! -f "$SRC_FILE" ]]; then
  echo "Source English file not found: $SRC_FILE" >&2
  exit 1
fi

# build a map of base-lang -> file, skipping duplicates (keep first)
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

# gather rs* keys (line number and key) from English source
mapfile -t RS_LINES < <(grep -nP '"rs[^"]*"\s*:' "$SRC_FILE" || true)
if [[ ${#RS_LINES[@]} -eq 0 ]]; then
  echo "No rs* entries found in $SRC_FILE" >&2
  exit 1
fi
declare -A FAILS  # FAILS[lang]="line1,line2,..."

# helper for extracting an .arb entry value
extract_value_from_line() {
  local line="$1"
  # remove leading key stuff:    "rsKey": "value",
  # capture inner JSON string (may contain escaped chars)
  if [[ "$line" =~ :\ \"(.*)\"[[:space:]]*,?[[:space:]]*$ ]]; then
    printf '%s' "${BASH_REMATCH[1]}"
  else
    # fallback: print whole line
    printf '%s' "$line"
  fi
}

# iterate entries
for entry in "${RS_LINES[@]}"; do
  line_num="${entry%%:*}"
  line_content="$(sed -n "${line_num}p" "$SRC_FILE")"

  # extract key
  if [[ "$line_content" =~ \"([^\"]+)\"\s*:\s*\" ]]; then
    key="${BASH_REMATCH[1]}"
  else
    # fallback parse from entry raw
    key=$(echo "$entry" | sed -E 's/^[0-9]+:.*"([^"]+)".*/\1/')
  fi

  # english value
  en_value="$(extract_value_from_line "$line_content")"

  clear; echo "KEY: $key"; echo; echo "EN: $en_value"; echo

  # show each other language (base) and its translation + translate-shell result
  for base in "${!LANG_FILE[@]}"; do
    file="${LANG_FILE[$base]}"

    # find the key line in that file
    match_line=$(grep -nP "\"${key}\"\\s*:" "$file" || true)
    if [[ -z "$match_line" ]]; then
      # no translation for this key in that language
      echo "$base: (missing)"; echo "  -> (no translation found)"; echo
      continue
    fi

    other_line_num="${match_line%%:*}"
    other_line="$(sed -n "${other_line_num}p" "$file")"
    other_val="$(extract_value_from_line "$other_line")"
    echo "$base: \"$other_val\""
    
    # use translate-shell to translate into English (auto-detect source)
    trans_out=$(trans -b :en "$other_val" 2>/dev/null || printf '[translate failed]')
    echo "  -> $trans_out"; echo
  done

  # Prompt user
  echo "Mark this entry as OK or failing."
  echo " - Press Enter or Space to accept (OK)."
  echo " - Or type comma-separated base language codes to mark failures (e.g. ar, zh)."
  read -r -p "> " user_in

  # trim whitespace
  user_trimmed="$(echo "$user_in" | sed -E 's/^[[:space:]]+|[[:space:]]+$//g')"
  if [[ -z "$user_trimmed" ]]; then
    continue
  fi

  # mark failures
  IFS=',' read -r -a badlangs <<< "$user_trimmed"
  for raw in "${badlangs[@]}"; do
    lang="$(echo "$raw" | tr -d '[:space:]' | tr '[:upper:]' '[:lower:]')"
    [[ -z "$lang" ]] && continue

    # only record if we have that language file and the key exists there
    if [[ -n "${LANG_FILE[$lang]:-}" ]]; then
      file="${LANG_FILE[$lang]}"
      match_line=$(grep -nP "\"${key}\"\\s*:" "$file" || true)
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

# final report
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