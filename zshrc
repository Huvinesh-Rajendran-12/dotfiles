# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cl=clear
alias lg=lazygit

# Enhanced file listing with eza
alias ls="eza --color=always --group-directories-first"
alias ll="eza -la --icons --octal-permissions --group-directories-first"
alias tree="eza --tree"

# Smart cd with zoxide
eval "$(zoxide init zsh)"

# Additional git aliases
alias g="git"
alias gs="git status"
alias gd="git diff"
alias gl="git log --oneline --graph"

# github aliases
alias gha="gh auth switch -u huvinesh-axium && git as-work"
alias ghp="gh auth switch -u Huvinesh-Rajendran-12 && git as-personal"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/Users/huvinesh/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# Everforest colors for zsh-syntax-highlighting
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=#a7c080,bold
ZSH_HIGHLIGHT_STYLES[alias]=fg=#83c092
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=#83c092
ZSH_HIGHLIGHT_STYLES[builtin]=fg=#7fbbb3
ZSH_HIGHLIGHT_STYLES[function]=fg=#83c092
ZSH_HIGHLIGHT_STYLES[command]=fg=#83c092
ZSH_HIGHLIGHT_STYLES[precommand]=fg=#83c092
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=#d3c6aa
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=#83c092
ZSH_HIGHLIGHT_STYLES[path]=fg=#d3c6aa
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=fg=#859289
ZSH_HIGHLIGHT_STYLES[globbing]=fg=#dbbc7f
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=#d699b6
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=#dbbc7f
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=#dbbc7f
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=#d699b6
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=#a7c080
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=#a7c080
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=#a7c080
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=#d699b6
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=#d699b6
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=#d699b6
ZSH_HIGHLIGHT_STYLES[assign]=fg=#d3c6aa
ZSH_HIGHLIGHT_STYLES[redirection]=fg=#859289
ZSH_HIGHLIGHT_STYLES[comment]=fg=#859289
ZSH_HIGHLIGHT_STYLES[arg0]=fg=#83c092

# starship shell init
eval "$(starship init zsh)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/huvinesh/.lmstudio/bin"
# End of LM Studio CLI section

export PATH="$HOME/.local/bin:$PATH"

# bun completions
[ -s "/Users/huvinesh/.bun/_bun" ] && source "/Users/huvinesh/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/Users/huvinesh/.pixi/bin:$PATH"

# Added by Windsurf
export PATH="/Users/huvinesh/.codeium/windsurf/bin:$PATH"

# set editor
export EDITOR="nvim"

# setting up carapace
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# Added by Windsurf
export PATH="/Users/huvinesh/.codeium/windsurf/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"

# Added by Antigravity
export PATH="/Users/huvinesh/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity
export PATH="/Users/huvinesh/.antigravity/antigravity/bin:$PATH"

# opencode
export PATH=/Users/huvinesh/.opencode/bin:$PATH
