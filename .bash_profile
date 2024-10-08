[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# declare -x=

eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
