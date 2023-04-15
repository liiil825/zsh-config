export NVM_DIR="$HOME/.nvm"
if [[ ! -a ~/.zsh-async ]]; then
    git clone git@github.com:mafredri/zsh-async.git ~/.zsh-async
fi
source ~/.zsh-async/async.zsh

function load_nvm() {
    # [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    # [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

    if [ "$OSTYPE" = linux-gnu ]; then
      return
    fi

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

