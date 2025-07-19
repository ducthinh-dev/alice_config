# Reset cursor to vertical bar when returning to shell (after tmux detach)
if [[ $TERM != screen* ]]; then
    PROMPT_COMMAND='echo -ne "\e[6 q"'
fi

# Auto-start or reattach tmux session on shell start
if command -v tmux >/dev/null && [ -z "$TMUX" ]; then
    # If there is any existing session, attach to the first
    existing_session=$(tmux ls 2>/dev/null | head -n 1 | cut -d: -f1)
    if [ -n "$existing_session" ]; then
        tmux attach-session -t "$existing_session"
    else
        tmux new-session -s default
    fi
fi

# phpactor
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# nvim lua config
export XDG_CONFIG_HOME=~/alice_config/nvim
