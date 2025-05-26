# VSCODE 的vim设置 设置 [1,2,4]
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
defaults write com.vscodium ApplePressAndHoldEnabled -bool false                      # For VS Codium
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
defaults delete -g ApplePressAndHoldEnabled                                           # If necessary, reset global default

# 全局的键盘设置
```
# 检查各应用的独立设置    
defaults read -g ApplePressAndHoldEnabled 2>/dev/null || echo "全局未设置，使用系统默认"
for app in com.microsoft.VSCode com.microsoft.VSCodeInsiders com.vscodium com.microsoft.VSCodeExploration; do
    defaults read $app ApplePressAndHoldEnabled 2>/dev/null && echo "$app 已设置" || echo "$app 未设置"
done

# 禁用长按字符选择（强制启用按键重复）
defaults write -g ApplePressAndHoldEnabled -bool false

# 同时调快按键重复速度（可选）
defaults write -g InitialKeyRepeat -int 15  # 初始延迟（毫秒，建议15）
defaults write -g KeyRepeat -int 2          # 重复速度（毫秒，建议1-2）
```

# sublime settings
```
{
	"auto_complete": true,
	"auto_match_enabled": true,
	"color_scheme": "auto",
	"font_size": 20,
	"ignored_packages": [],
	"tab_size": 2,
	"theme": "Adaptive.sublime-theme",
	"dark_color_scheme": "Monokai.sublime-color-scheme",
	"light_color_scheme": "Sixteen.sublime-color-scheme",
	"hot_exit": true,
	"remember_open_files": true,
	"index_files": true,
}

```

# mac docker
```
Docker 桌面版 version 4.37.1
Docker version 27.4.0, build bde2b89
Docker Compose version v2.31.0-desktop.2

restart 不 reload env，down+up 才是重生。
.env / compose.yml 文件有改动，一定要重建容器。

docker compose（空格） > 推荐，集成新特性，未来主流
docker-compose（横线） > 老版，维护期，慢慢弃用
没有 yml/yaml 文件不会启动，可以用 -f 指定
docker compose -f ./docker-compose.yaml -p elk up -d
docker compose -p elk up -d
docker compose -p elk ps
docker compose -p elk down / stop
docker compose -p elk up -d --force-recreate


| 命令                                   | 作用说明                   |
| ------------------------------------ | ---------------------- |
| `docker compose up`                  | 启动并运行所有服务（前台）          |
| `docker compose up -d`               | 启动所有服务（后台运行，常用！）       |
| `docker compose down`                | 停止并删除所有容器、网络、卷         |
| `docker compose stop`                | 停止所有服务                 |
| `docker compose start`               | 启动已存在的已停止服务            |
| `docker compose restart`             | 重启所有服务                 |
| `docker compose ps`                  | 查看服务运行状态               |
| `docker compose logs -f`             | 实时查看所有服务日志             |
| `docker compose logs -f service`     | 实时查看某个服务日志             |
| `docker compose exec service bash`   | 进入某个服务的 shell          |
| `docker compose run service command` | 启动一个新容器并运行指定命令         |
| `docker compose build`               | 构建所有服务镜像（自定义 build 时用） |
| `docker compose pull`                | 拉取所有服务镜像               |
| `docker compose rm`                  | 删除停止的服务容器              |

| 参数                 | 说明                   |
| ------------------ | -------------------- |
| `-f`               | 指定 compose 文件路径      |
| `-p`               | 指定项目名称（project name） |
| `-d`               | 后台运行（detached mode）  |
| `--remove-orphans` | 删除无主容器（compose 文件外的） |
| `--build`          | 启动前先 build 镜像        |


```
