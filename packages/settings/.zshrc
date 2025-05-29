# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
# ZSH_THEME_GIT_PROMPT_DIRTY=")%F{#FFADD2} ✗ %{$reset_color%}"


# nvm config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export NVM_NODEJS_ORG_MIRROR=https://npmmirror.com/mirrors/node/
# export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node/
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# git commit 中文乱码问题
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

#设置mysql 否则mysql not found 
source ~/.bash_profile
#应该是 webstorm的配置
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

#设置brew bottles 的镜像地址
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles

#设置maven环境
export M2_HOME=/usr/local/apache-maven-3.9.3
export PATH=${PATH}:${M2_HOME}/bin

# 分享历史 在每一次使用之后立即加入到历史中
#setopt share_history
#setopt inc_append_history

# postgresql 的地址配置
export PATH="/opt/homebrew/opt/postgresql@14/bin:$PATH"

#-----source active when change work-directory && has venv directory ---
set_python_venv() {
    MYVENV=./venv
    # 检查是否已经激活
    if [[ -d $MYVENV && "$VIRTUAL_ENV" != "$MYVENV" ]]; then
        source $MYVENV/bin/activate > /dev/null 2>&1
    elif [[ ! -d $MYVENV && -n "$VIRTUAL_ENV" ]]; then
        deactivate > /dev/null 2>&1
    fi
}

set_python_venv

# 服务器相关的一些别名
alias jozai='ssh root@124.221.125.79'
# git相关的别名
alias g='git'
alias gf='git fetch origin'
alias gl='git pull --rebase'
alias gs='git stash'
alias gsp='git stash pop'
alias np='pnpm'
alias ioa='sudo ifconfig en0 down && sudo ifconfig en1 down && sudo ifconfig en2 down && sudo ifconfig en0 up && sudo ifconfig en1 up && sudo ifconfig en2 up'
alias mount='docker inspect --format "{{ range .Mounts }}{{ println .Source \"->\" .Destination }}{{ end }}"'
alias dlog='docker logs --tail 1000 -f'
alias smb='netstat -an | grep -E "\.445|\.139"'

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


OLLAMA_HOST=0.0.0.0:11234
OLLAMA_MODELS=/Users/kongsa/Desktop/init/models
