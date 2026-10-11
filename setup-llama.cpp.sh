#!/bin/sh

REPO_DIR="llama.cpp"
REPO_URL="git@github.com:ggml-org/llama.cpp.git"

# 1. Prüfen, ob das Verzeichnis existiert
if [ -d "$REPO_DIR" ]; then
    echo "Das Verzeichnis '$REPO_DIR' existiert bereits."
	git pull
else
    echo "Klone llama.cpp via SSH..."
    git clone "$REPO_URL"
fi

# 2. In das Verzeichnis wechseln und kompilieren
echo "Kompiliere llama.cpp..."
cd "$REPO_DIR"

rm -rf build/
#cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake -B build -DGGML_VULKAN=1 -DGGML_RPC=ON -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release -j"$(nproc)"

echo "Fertig! llama.cpp wurde erfolgreich eingerichtet und kompiliert."