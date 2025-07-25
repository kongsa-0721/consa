# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
. "$HOME/.local/bin/env"

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
plugins=(z git zsh-autosuggestions zsh-syntax-highlighting)
# ZSH_THEME_GIT_PROMPT_DIRTY=")%F{#FFADD2} ✗ %{$reset_color%}"

source ~/.bash_profile
source ~/.bashrc
source $ZSH/oh-my-zsh.sh


# mysql 地址
export PATH=$PATH:/usr/local/mysql/bin
# cwebp 地址
export PATH="/Users/kongsa/Documents/libs/libwebp-1.5.0-rc1-mac-arm64/bin:$PATH"
# postgresql 地址
export PATH="/opt/homebrew/opt/postgresql@14/bin:$PATH"

export OLLAMA_HOST=0.0.0.0:11234
export OLLAMA_MODELS=/Users/kongsa/Desktop/init/models
export UV_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
export DOCKER_BUILDKIT=1

# git commit 中文乱码问题
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#设置brew bottles 的镜像地址
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles

#设置maven环境
export M2_HOME=/usr/local/apache-maven-3.9.3
export PATH=${PATH}:${M2_HOME}/bin

# nvm config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export NVM_NODEJS_ORG_MIRROR=https://npmmirror.com/mirrors/node/
# export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node/
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/kongsa/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# 分享历史 在每一次使用之后立即加入到历史中
#setopt share_history
#setopt inc_append_history
