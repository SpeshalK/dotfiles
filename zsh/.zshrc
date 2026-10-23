#======= PATHS =======#
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

#======= COMPLETION =======#
autoload -Uz compinit
mkdir -p ~/.cache/zsh
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

zstyle ':completion:*' format '1 %d'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' use-compctl true

# Fuzzy matching: exact, then case-insensitive, then partial-word, then substring
zstyle ':completion:*' matcher-list '' \
  'm:{a-z1-2A-Z}={A-Z1-2a-z}' \
  'r:|[._-]=* r:|=*' \
  'l:|=* r:|=*'

# Group results by category and use a selectable menu
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2

#====== DIR COLORS =====#
LS_COLORS=$LS_COLORS'ex=01;33:';
LS_COLORS=$LS_COLORS'*.sh=0;95:';
LS_COLORS=$LS_COLORS'*.jl=0;35:';
LS_COLORS=$LS_COLORS'*.lua=0;36:';
LS_COLORS=$LS_COLORS'*.csv=0;37:';
LS_COLORS=$LS_COLORS'*.json=0;37:';
LS_COLORS=$LS_COLORS'*.py=0;32:';
LS_COLORS=$LS_COLORS'*.eps=1;98:';
LS_COLORS=$LS_COLORS'*.svg=1;36:';
LS_COLORS=$LS_COLORS'*.pdf=1;31:';
LS_COLORS=$LS_COLORS'di=1;90:';
LS_COLORS=$LS_COLORS'ln=1;38;5;208:';
export LS_COLORS

# Highlight completion menu entries with LS_COLORS
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

#======= GENERAL =======#
setopt extendedglob
setopt autocd

# Directory stack: `cd -<Tab>` lists recent dirs, `cd -3` jumps to one
setopt autopushd pushdignoredups pushdsilent
DIRSTACKSIZE=20

#======= HISTORY =======#
HISTFILE=~/.zshcmdhist
HISTSIZE=10000
SAVEHIST=10000

#======= EDITOR & ENV =======#
export EDITOR='nvim'

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_DBUS_REMOTE=1
    export MOZ_ENABLE_WAYLAND=1
fi

#======= ALIASES =======#
alias vim="nvim"
alias zshrc="source ~/.zshrc"
alias hsrch="history|grep"
alias swayconfig='vim ~/.config/sway/config'
alias ghstyconfig='vim ~/.config/ghostty/config'
alias nvconfig='cd ~/.config/nvim/'
alias please='sudo $(fc -ln -1)'
alias setupV='vault-open'
alias sdownV='vault-close'
alias btrbkconfig='vim /etc/btrbk/btrbk.conf'
alias health='systemctl list-timers cleanup.timer && sudo btrfs filesystem usage /'
alias ssh='TERM=xterm-256color ssh'
alias open='xdg-open'
alias trim='mogrify -trim'

# git add, commit & push: acp "commit message"
function acp() {
  git add .
  git commit -m "$1"
  git push
}

#======= PLUGINS (Fedora packages) =======#
# Autosuggestions (loaded before the keybindings that use it)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#aaf6b3'
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Directory jumping with zoxide: `j <name>` jumps, `ji` = fzf picker
eval "$(zoxide init zsh --cmd j)"

#======= VIM MODE & BINDINGS =======#
bindkey -v
export KEYTIMEOUT=1

# End key accepts the autosuggestion
bindkey '^[[F' autosuggest-accept
bindkey -M viins '^]]F' autosuggest-accept
bindkey -M vicmd '^]]F' autosuggest-accept

# Up/Down search history for commands starting with what's typed
for mode in vicmd viins; do
  bindkey -M $mode '^[[A' history-beginning-search-backward
  bindkey -M $mode '^[[B' history-beginning-search-forward
  bindkey -M $mode '^[OA' history-beginning-search-backward
  bindkey -M $mode '^[OB' history-beginning-search-forward
done

# Backspace in vi insert mode
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# fzf: Ctrl-R history search, working in both vi modes
source /usr/share/fzf/shell/key-bindings.zsh
bindkey -M viins '^R' fzf-history-widget
bindkey -M vicmd '^R' fzf-history-widget
[ -f ~/.fzf-completion.zsh ] && source ~/.fzf-completion.zsh

#======= MACHINE-SPECIFIC (not in git) =======#
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

#======= SYNTAX HIGHLIGHTING (load near the end) =======#
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'

#======= PROMPT (must be last) =======#
eval "$(starship init zsh)"
