# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/usr/local/google/home/ronish/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="half-life"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
plugins=(
  git tmux zsh-256color zsh-completions zsh-syntax-highlighting fzf
)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias acloudw='/google/src/head/depot/google3/wireless/android/test_tools/asuite/acloud/acloudw.sh'
alias adbremount='adb root && adb disable-verity && adb reboot && adb wait-for-device && adb root && adb remount'
alias cdim='cd ~/android/internal-master'
alias cda='cd ~/android'
alias adbupdate="m; adb root; adb remount; adb sync; adb reboot"
alias adbupdated="m; adb root; adb remount && adb shell stop && adb sync && adb shell start"
alias updaterb="git add --all; git commit --amend --no-edit; repo upload ."

DISABLE_AUTO_TITLE="false"
setopt noincappendhistory
setopt nosharehistory
source /usr/local/google/home/ronish/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /etc/bash_completion.d/g4d

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)
ZSH_HIGHLIGHT_STYLES[default]='fg=231'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=204'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=226'
ZSH_HIGHLIGHT_STYLES[alias]='fg=87'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=87'
ZSH_HIGHLIGHT_STYLES[function]='fg=87'
ZSH_HIGHLIGHT_STYLES[command]='fg=87'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=231'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=231'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=87'
ZSH_HIGHLIGHT_STYLES[path]='fg=231'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=226'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=77'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=77'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=105'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=204'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=231'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=226'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=226'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[assign]='fg=204'