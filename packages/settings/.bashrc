# Use docker exec -it container bash
dexec() {
  CONTAINER="$1"
  if [ -z "$CONTAINER" ]; then
    echo "用法: dexec <容器名>"
    return 1
  fi
  docker exec -it "$CONTAINER" bash 2>/dev/null || docker exec -it "$CONTAINER" sh
}

# Open proxy
proxy_on() {
    export https_proxy="http://127.0.0.1:7890"
    export http_proxy="http://127.0.0.1:7890"
    echo -e "\033[32m[√] HTTP/HTTPS Proxy on 已开启代理\033[0m"
}
# Close proxy
proxy_off() {
    unset http_proxy
    unset https_proxy
    echo -e "\033[31m[×] HTTP/HTTPS Proxy off 已关闭代理\033[0m"
}

#-----source active when change work-directory && has venv directory ---
set_python_venv() {
    local MYVENV=""
    if [[ -d .venv ]]; then
        MYVENV=".venv"
    elif [[ -d venv ]]; then
        MYVENV="venv"
    fi

    if [[ -n "$MYVENV" && "$VIRTUAL_ENV" != "$(realpath "$MYVENV")" ]]; then
        source "$MYVENV/bin/activate" > /dev/null 2>&1 && \
        echo "✅ 已自动激活虚拟环境: $MYVENV"
    elif [[ -z "$MYVENV" && -n "$VIRTUAL_ENV" ]]; then
        deactivate > /dev/null 2>&1 && \
        echo "🔻 已退出虚拟环境"
    fi
}

# Rewrite cd command
cd() {
    builtin cd "$@" && set_python_venv
}

# git 相关
alias g='rm -rf .husky/_/pre-push && git'
alias gf='git fetch origin'
alias gl='git pull --rebase'
alias gs='git stash'
alias gsp='git stash pop'
alias gclean='git clean -fd && git remote prune origin && git gc --aggressive --prune=now && git status'

# 项目/网络相关
alias np='pnpm'
alias ioa='sudo ifconfig en0 down && sudo ifconfig en1 down && sudo ifconfig en2 down && sudo ifconfig en0 up && sudo ifconfig en1 up && sudo ifconfig en2 up'
alias server='npm run server-start'
alias client='npm run client-start-host'
alias py='sh /Users/kongsa/Desktop/dipeak/ask-python/tmp/load_python_service.sh'

# docker / 网络调试
alias mount='docker inspect --format "{{ range .Mounts }}{{ println .Source \"->\" .Destination }}{{ end }}"'
alias dlog='docker logs --tail 1000 -f'
alias smb='netstat -an | grep -E "\.445|\.139"'

# 一次性加载所有配置
alias sourceall='source ~/.zshrc ~/.bashrc ~/.bash_profile'
