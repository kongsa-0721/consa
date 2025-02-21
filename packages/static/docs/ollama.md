#### 启动 & 停止

1. 启动 ollama 监听 0.0.0.0

```
nohup env OLLAMA_HOST=0.0.0.0:11434 /Applications/Ollama.app/Contents/Resources/ollama serve > /Users/kongsa/Desktop/init/ownProject/ragflow/ollama.log 2>&1 &
```

2. 停止 ollama

```
lsof -i -n -P | grep ollama
kill 掉 11434 那个 pid
```

#### 安装模型

```
ollama run deepseek-r1:1.5b
ollama run deepseek-r1:7b
ollama pull nomic-embed-text
ollama pull bge-m3
```
