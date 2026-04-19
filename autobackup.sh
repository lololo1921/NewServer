#!/bin/bash
echo "[AUTOBACKUP] Iniciado. Backup cada 5 minutos."
while true; do
    sleep 300
    bash backup.sh >> backup.log 2>&1
done
