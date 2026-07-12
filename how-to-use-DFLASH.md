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
# SETUP

| Devices | - |
| ------- | - |
| CPU | Ryzen 7900X |
| GPU | Radeon RX 5700 XT|

| token/s | device | draft model | spec-draft-n-max |
| ------- | ------ | ----------- | ---------------- |
| 10 | CPU | none | 0 |
| 17 | CPU | MTP | 2 |
| 19 | CPU | DFLASH | 3 |
| 48 | GPU | none | 0 |
| 70 | GPU | MTP | 2 |
| 63 | GPU | DFLASH | 2 |
| 56 | GPU | DFLASH | 3 |
