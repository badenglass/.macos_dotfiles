# .bashrc
# adapted/stolen from https://github.com/mrzool/bash-sensible

random-theme() {
    themes=("monokai-pro-classic" "monokai-pro-default" "monokai-pro-machine" "monokai-pro-octagon" "monokai-pro-ristretto" "monokai-pro-spectrum")
    random_theme=${themes[$RANDOM % ${#themes[@]}]}
    echo "$random_theme" > ~/.config/kitty/theme.conf
    kitty @ set-colors -c "$HOME/.config/kitty/$(cat $HOME/.config/kitty/theme.conf).conf"
}

fzf-theme() {
    themes=(
        "monokai-pro-classic"
        "monokai-pro-default"
        "monokai-pro-machine"
        "monokai-pro-octagon"
        "monokai-pro-ristretto"
        "monokai-pro-spectrum"
    )

    selected_theme=$(printf "%s\n" "${themes[@]}" | fzf --prompt="Kitty Theme: ")

    if [ -n "$selected_theme" ]; then
        echo "$selected_theme" > "$HOME/.config/kitty/theme.conf"
        kitty @ set-colors -c "$HOME/.config/kitty/${selected_theme}.conf"
    else
        echo "fuck you"
    fi
}

if [ -z "$TMUX" ]; then
    eval "kitty @ set-colors -c $HOME/.config/kitty/$(cat $HOME/.config/kitty/theme.conf).conf"
fi

[[ $- != *i* ]] && return

alias path='echo -e ${PATH//:/\\n}'
alias bc='bc -l'
alias grep='grep --color=auto'

alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'

alias bare='/opt/homebrew/bin/git --git-dir=$HOME/.mac/ --work-tree=$HOME'

# Update window size after every command
shopt -s checkwinsize

# Append to the history file, don't overwrite it
shopt -s histappend

# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH="."

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars

# Examples:
export viconfig="$HOME/.config/nvim/"
export cs="$HOME/repos/ciss245"
export assignments="$HOME/repos/ciss245/a/"
export quizzes="$HOME/repos/ciss245/q/"
export notes="$HOME/Documents/cccs/notes/"

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

fortune

eval "$(fzf --bash)"
eval "$(starship init bash)"
