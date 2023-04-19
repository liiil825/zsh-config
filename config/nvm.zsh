if [[ $(uname -n) == *"-opencloudos" ]]; then
    return
fi

if [[ $(uname) == "Linux" ]]; then
    export NVM_DIR=$HOME/.nvm
elif [[ $(uname) == "Darwin" ]]; then
    export NVM_DIR=/usr/local/opt/nvm
fi

if [[ ! -a ~/.zsh-async ]]; then
    git clone git@github.com:mafredri/zsh-async.git ~/.zsh-async
fi
source ~/.zsh-async/async.zsh

function load_nvm() {
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

    autoload -U add-zsh-hook
    add-zsh-hook chpwd load-nvmrc
}
# Initialize a new worker
async_start_worker nvm_worker -n
async_register_callback nvm_worker load_nvm
async_job nvm_worker sleep 0.1

load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

        if [ "$nvmrc_node_version" = "N/A" ]; then
            nvm install
        elif [ "$nvmrc_node_version" != "$node_version" ]; then
            nvm use
        fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
        echo "Reverting to nvm default version"
        nvm use default
    fi
}

