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

