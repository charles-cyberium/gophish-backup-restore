#!/bin/bash
source ./venv/bin/activate
source ./.env
./disable_ssl.sh python3 ./gophish-restore.py --instance ${GOPHISH_URI} --api-key ${GOPHISH_API_KEY}
