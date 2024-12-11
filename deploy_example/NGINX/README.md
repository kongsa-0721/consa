### NGINX启动 版本 1.27.1

1. 启动命令

```
NGINX_PATH=/Users/kongsa/Desktop/init/ownProject/CONSA/deploy/NGINX
docker run -d --name custom-nginx \
 -p 8080:80 \
 -v ${NGINX_PATH}/home:/home \
 -v ${NGINX_PATH}/conf:/etc/nginx/conf.d \
 nginx:latest
```

2. 文件路径

```
/etc 配置文件
/etc/nginx/conf.d 配置文件文件夹
/home 用户自己的文件
```
