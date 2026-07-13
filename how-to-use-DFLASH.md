
# SETUP

| Devices | - |
| ------- | - |
| CPU | Ryzen 7900X |
| GPU | Radeon RX 5700 XT|



# Qwen3.5-9B-IQ4_XS
```
wget https://huggingface.co/unsloth/Qwen3.5-9B-MTP-GGUF/resolve/main/Qwen3.5-9B-IQ4_XS.gguf
```
```
wget https://huggingface.co/onion515/Qwen3.5-9B-DFlash-GGUF/resolve/main/qwen3.5-9b-dflash-Q4_K_M.gguf
```
```
./build/bin/llama-server -m ~/llm/Qwen3.5-9B-IQ4_XS.gguf \
	--device Vulkan0 --mlock --no-mmap \
	--spec-draft-model ~/llm/qwen3.5-9b-dflash-Q4_K_M.gguf \
	--spec-type draft-dflash \
	--spec-draft-n-max 3 \
	--spec-draft-device Vulkan0
```

| token/s | device | draft model | spec-draft-n-max |
| ------- | ------ | ----------- | ---------------- |
| 10 | CPU | none | 0 |
| 17 | CPU | MTP | 2 |
| 19 | CPU | DFLASH | 3 |
| 48 | GPU | none | 0 |
| 70 | GPU | MTP | 2 |
| 63 | GPU | DFLASH | 2 |
| 63 | GPU | DFLASH | 3 |




# Qwen3.6-27B-Q4_K_M
```
wget https://huggingface.co/unsloth/Qwen3.6-27B-MTP-GGUF/resolve/main/Qwen3.6-27B-Q4_K_M.gguf
```
```
wget https://huggingface.co/Alittlehammmer/Qwen3.6-27B-DFlash-GGUF-llama.cpp/resolve/main/Qwen3.6-27B-DFlash-Q4_K_M.gguf
```
```
./build/bin/llama-server -m ~/llm/Qwen3.6-27B-Q4_K_M.gguf \
	--device none --mlock --no-mmap \
	--spec-draft-model ~/llm/Qwen3.6-27B-DFlash-Q4_K_M.gguf \
	--spec-type draft-dflash \
	--spec-draft-n-max 4 \
	--spec-draft-device Vulkan0 \
	-c 4096 --temp 0.4
```

| token/s | draft model | spec-draft-n-max | temp |
| ------- | ----------- | ---------------- | ---- |
| 3 | none | 0 |
| 5 | MTP | 2 |
| 6-7 | DFLASH | 3 |
| 7 | DFLASH | 4 | 0.6 |
| 7-8 | DFLASH | 4 | 0.4 |
| 7-8 | DFLASH | 5 | 0.4 |
