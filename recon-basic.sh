#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

DOMAIN="$1"
SUBS_FILE="subdomains.txt"
OUT_FILE="httpx.txt"

echo "[*] Running subfinder on: $DOMAIN"
subfinder -d "$DOMAIN" -all -silent -o "$SUBS_FILE"

if [ ! -s "$SUBS_FILE" ]; then
    echo "Error: no subdomains found."
    exit 1
fi

echo "[*] Found $(wc -l < "$SUBS_FILE") subdomains. Saved to $SUBS_FILE"

echo "[*] Running httpx on: $SUBS_FILE"
httpx -l "$SUBS_FILE" \
    -sc \
    -cl \
    -location \
    -title \
    -ip \
    -td \
    -server \
    -cname \
    -o "$OUT_FILE"

echo "[*] Done. Results saved to $OUT_FILE"
