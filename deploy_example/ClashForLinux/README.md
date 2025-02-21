## 基于Debian搭建一个clash托管服务

#### 目的：

1. 自定义rules

#### 过程

1. 登录全新的腾讯云服务器遇到报错
   bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
   bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)

解决方法：

```
sudo apt update
sudo apt install -y locales
vi /etc/locale.gen 把其中一行改成如下
en_US.UTF-8 UTF-8
sudo locale-gen
locale -a
```

2. 安装vi git
   apt install -y vim git

3. 配置git global
   git config --global user.name "Sa Kong"
   git config --global user.email "kongsacn@gmail.com"
   git config --global --list

4. 生成一个ssh密钥
   ssh-keygen -t rsa -b 4096 -C "tencent@server-20250109.com"
   ssh密钥放到github上 id_ras.pub， 连接到github
   git clone git@github.com:kongsa-0721/ClashExport.git

5. Debian安装Docker

```
1.更新并安装一些必要系统工具。
   sudo apt update
   sudo apt upgrade

    sudo apt install \
     apt-transport-https \
     software-properties-common \
     ca-certificates \
     curl \
     gnupg \
     lsb-release

2.安装GPG证书。
curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/debian/gpg | apt-key add -

3.写入软件源信息。
add-apt-repository "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian $(lsb_release -cs) stable"

4.更新并安装社区版Docker-ce
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin

5.开机自启动 启动docker
sudo systemctl enable docker
sudo systemctl start docker
```

6. 安装clash

```
1. 获取到clash linux内核，传到服务器上
2. 解压
3. 移动到可执行文件夹下
4. 传mmdb文件
5. 移动mmdb文件到clash配置文件下
6. 后台执行clash 检查进程 查看日志

    scp /Users/kongsa/Downloads/clash-linux-amd64-v1.18.0.gz root@124.221.125.79:/root
    gzip -d clash-linux-amd64-v1.18.0.gz
    mv clash-linux-amd64-v1.18.0.gz /usr/local/bin/clash
    scp /Users/kongsa/Downloads/GeoLite2-Country.mmdb root@124.221.125.79:/root
    mv GeoLite2-Country.mmdb /root/.config/clash/
    nohup clash > clash.log 2>&1 &
    ps -ef | grep clash
    tail -f clash.log
```

7. docker换源与添加代理

```
- 换源
   vi /etc/docker/daemon.json
   =>
   {
     "registry-mirrors": [
     "https://hub-mirror.c.163.com",
     "https://ustc-edu-cn.mirror.aliyuncs.com",
     "https://ghcr.io",
     "https://mirror.baidubce.com"
     ]
   }
   sudo systemctl restart docker

- 终端代理
   export http_proxy=http://127.0.0.1:7890; export https_proxy=$http_proxy;
- docker代理
   vi /etc/systemd/system/docker.service.d/http-proxy.conf
   =>
   [Service]
   Environment="HTTP_PROXY=http://127.0.0.1:7890"
   Environment="HTTPS_PROXY=http://127.0.0.1:7890"

重新加载 Systemd 配置：
sudo systemctl daemon-reload
重启 Docker 服务：
sudo systemctl restart docker
检查 Docker 服务状态：
systemctl status docker
```

8. 服务器放行端口

在服务器管理界面放行外部需要使用的端口 类似7890 5000

9. 使用systemctl管理clash.service

```
1. 进入/etc/systemd/system文件夹，创建clash.service文件
2. 写入内容
[Unit]
Description=Proxy Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/clash -f /root/.config/clash/config.yaml
StandardOutput=append:/root/clash.log
StandardError=append:/root/clash.log

[Install]
WantedBy=multi-user.target
3. 重新加载 Systemd 配置
sudo systemctl daemon-reload
4. 启动服务
sudo systemctl start clash
5. 查看服务状态：
sudo systemctl status clash
6. 设置服务开机自启（可选）：
sudo systemctl enable clash
7. 安装clash可视化界面 yacd
- wget https://github.com/haishanh/yacd/releases/download/v0.3.8/yacd.tar.xz
- tar -xJf yacd.tar.xz
- 移动到 /root/.config/clash/
- mv public dashboard
- 修改config.yaml => external-ui: /root/.config/clash/dashboard
- 访问127.0.0.1:9090/ui

```
