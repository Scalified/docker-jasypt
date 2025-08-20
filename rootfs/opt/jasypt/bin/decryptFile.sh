#!/bin/sh

set -eu

FILE=""
ARGS=""
VERBOSE=false

for arg in "$@"; do
  case $arg in
    file=*)
      FILE="${arg#*=}"
      ;;
    verbose=true)
      VERBOSE=true
      ;;
    *)
      ARGS="$ARGS $arg"
      ;;
  esac
done

if [ -z "$FILE" ] || ! echo "$ARGS" | grep -q 'password='; then
  echo "[ERROR]: Usage: $0 file=path/to/file password=123 [other_args...]"
  exit 1
fi

sed -i -E ':a;N;$!ba;s/\\\r?\n[[:space:]]*//g' "$FILE"

while grep -q 'ENC(' "$FILE"; do
  enc_value=$(grep -o 'ENC([^)]*)' "$FILE" | head -n1 | sed 's/ENC(\(.*\))/\1/')
  dec_value=$(./decrypt.sh input="$enc_value" verbose=false $ARGS)
  sed -i "s#ENC($enc_value)#$dec_value#" "$FILE"
  if [ "$VERBOSE" = true ]; then
    echo "[DEBUG]: Decrypted '$enc_value' value"
  fi
done

