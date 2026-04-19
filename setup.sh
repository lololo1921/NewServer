#!/bin/bash
echo "=== Configurando entorno Minecraft Forge 1.16.5 ==="

echo "[1/5] Instalando Java 8..."
sudo apt-get update -qq
sudo apt-get install -y openjdk-8-jdk -qq
sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/bin/java
echo "Java listo: $(java -version 2>&1 | head -1)"

echo "[2/5] Configurando git..."
git config credential.helper store
git config pull.rebase false

echo "[3/5] Configurando tmux..."
cat > ~/.tmux.conf << 'TMUX'
set -g mouse on
set -g history-limit 5000
set -g status-bg colour235
set -g status-fg colour136
set -g status-left " 🟢 MinecraftServer "
set -g status-right " %H:%M "
TMUX

echo "[4/5] Dando permisos a scripts..."
chmod +x start.sh backup.sh autobackup.sh launch.sh 2>/dev/null || true

echo "[5/5] Creando carpetas..."
mkdir -p backups mods

echo ""
echo "=== Listo. Usá 'bash launch.sh' para iniciar todo ==="
