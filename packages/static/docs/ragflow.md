[RAGFlow](https://github.com/infiniflow/ragflow) 是一款基于深度文档理解构建的开源 RAG（Retrieval-Augmented Generation）引擎。

#### 本地启动ragflow

```
git clone

修改env
RAGFLOW_IMAGE=infiniflow/ragflow:v0.16.0
ragflow 8081:80


可能涉及到docker compose无法启动，需要本地手动拉取相应的镜像
image 架构不兼容 强行拉取
docker pull --platform=linux/amd64 infiniflow/ragflow:v0.16.0
可以拉取轻量版 用 nomic-embed-text / bge-m3 做 embadding

启动
docker compose -p ragflow -f docker/docker-compose.yml up -d
```
