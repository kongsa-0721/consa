[Dify](https://github.com/langgenius/dify) 是一个开源的 LLM 应用开发平台。其直观的界面结合了 AI 工作流、RAG 管道、Agent、模型管理、可观测性功能等，让您可以快速从原型到生产。

#### 本地启动dify

```
git clone

1. docker 文件夹下
   cp .env.example .env

2. .env 添加内容
   CUSTOM_MODEL_ENABLED=true
   OLLAMA_API_BASE_URL=http://10.19.133.84:11434
   EXPOSE_NGINX_PORT=8081
   EXPOSE_NGINX_SSL_PORT=4431

3. docker compose 启动命令
   docker compose -f docker/docker-compose.yaml -p dify up -d

```
