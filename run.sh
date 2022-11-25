#!/bin/bash

IMAGE="$1"
PORT="$2"
HTTP_PORT="$3"
SHARED_SECRET="$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM"

echo "[+] running challenge"
exec docker run \
    -e "PORT=$PORT" \
    -e "HTTP_PORT=$HTTP_PORT" \
    -e "ETH_RPC_URL=$ETH_RPC_URL" \
    -e "FLAG=$FLAG" \
    -e "PUBLIC_IP=$PUBLIC_IP" \
    -e "SHARED_SECRET=$SHARED_SECRET" \
    -p "$PORT:$PORT" \
    -p "$HTTP_PORT:$HTTP_PORT" \
    "$IMAGE"
