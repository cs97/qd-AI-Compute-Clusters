# qd-AI-Compute-Clusters


# llama.ccp build
alpine
```
doas apk add cmake vulkan-loader-dev spirv-headers linux-headers
```
```
git clone https://github.com/ggml-org/llama.cpp
```
```
cd llama.cpp
```
```
cmake -B build -DGGML_VULKAN=1 -DGGML_RPC=ON -DCMAKE_BUILD_TYPE=Release
```
```
cmake --build build --config Release -j$(nproc)
```

# system config rpc server
```
sudo nano /etc/security/limits.conf
```
```
*               soft    memlock         unlimited
*               hard    memlock         unlimited
```
```
reboot
```
```
ulimit -l
```


#start rpc-server
```
./build/bin/ggml-rpc-server -p 50052 --host 0.0.0.0
```


# start llama-server
```
./build/bin/llama-server -m ~/llm/Qwopus3.6-35B-A3B-v1-MTP-Q6_K.gguf \
	--mlock --no-mmap \
	--spec-type draft-mtp --spec-draft-n-max 2 \
	--temp 0.6 --parallel 1 -fa on \
	--rpc 192.168.1.3:50052  --tensor-split 1,1
```
