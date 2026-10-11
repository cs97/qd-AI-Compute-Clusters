#!/bin/sh

REPO_DIR="llama.cpp"
REPO_URL="git@github.com:ggml-org/llama.cpp.git"

if [ -d "$REPO_DIR" ]; then
    echo "The directory '$REPO_DIR' already exists."
	git pull
else
    echo "Cloning llama.cpp via SSH..."
    git clone "$REPO_URL"
fi

echo "Compiling llama.cpp..."
cd "$REPO_DIR"

rm -rf build/
cmake -B build -DGGML_VULKAN=1 -DGGML_RPC=ON -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release -j"$(nproc)"

echo "Done! llama.cpp has been successfully set up and compiled."
