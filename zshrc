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
  git tmux zsh-256color zsh-completions zsh-syntax-highlighting fzf z
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

export GMSCORE_CONFIG="gmscore_arm64"
export GMSCORE_VARIANT="prodsc_alldpi_debug"
export ADB_VENDOR_KEYS=~/android/internal-master/vendor/google/security/adb
export EDITOR='subl'
export VISUAL='subl'

alias acloudw='/google/src/head/depot/google3/wireless/android/test_tools/asuite/acloud/acloudw.sh'
alias adbremount='adb root && adb disable-verity && adb reboot && adb wait-for-device && adb root && adb remount'
alias cdim='cd ~/android/internal-master'
alias cdudc='cd ~/android/udc-dev-san'
alias cda='cd ~/android'
alias cdli='cd ~/android/internal-master/vendor/unbundled_google/packages/LauncherIndiaGoogle/'
alias cdhc='cd ~/android/internal-master/packages/modules/HealthConnect/'
alias cdhcu='cd ~/android/udc-dev-san/packages/modules/HealthConnect/'
alias adbupdate="m; adb root; adb remount; adb sync; adb reboot"
alias adbupdated="m; adb root; adb remount && adb shell stop && adb sync && adb shell start"
alias updaterb="git add --all; git commit --amend --no-edit; repo upload ."
alias initrbe="unset USE_GOMA; source build/make/rbesetup.sh; export RBE_CXX_EXEC_STRATEGY=racing;export RBE_JAVAC_EXEC_STRATEGY=racing;export RBE_R8_EXEC_STRATEGY=racing;export RBE_D8_EXEC_STRATEGY=racing"
alias buildgms="blaze build //java/com/google/android/gmscore/integ:GmsCore_$GMSCORE_VARIANT --config $GMSCORE_CONFIG"
alias installgms="g4d; adb install -d -r blaze-bin/java/com/google/android/gmscore/integ/GmsCore_$GMSCORE_VARIANT.apk; cd -"
alias buildwallet="g4d; blaze --blazerc java/com/google/android/gmscore/blaze/blazerc build --config=$GMSCORE_CONFIG //java/com/google/android/gmscore/integ/policy_sets/walletindia:walletindia_prodpi_xhdpi_unwrapped; cd -"
alias installwallet="g4d; adb install -d -r blaze-bin/java/com/google/android/gmscore/integ/policy_sets/walletindia/walletindia_prodpi_xhdpi_unwrapped.apk; cd -"
alias registercard="adb shell am broadcast -a android.intent.action.REGISTER_SCAN_AND_PAY com.google.android.gms"
alias installvision="/google/data/ro/projects/android/override-gservices gms:chimera:module_packages com.google.android.gms.vision,com.google.android.gms.vision.dynamite,vision,com.google.android.gms.vision.barcode; blaze mobile-install --config=$GMSCORE_CONFIG java/com/google/android/gmscore/integ/modules/vision:vision_apk; blaze mobile-install --config=$GMSCORE_CONFIG java/com/google/android/gmscore/integ/modules/vision_dynamite:vision_dynamite_apk; blaze mobile-install --config=$GMSCORE_CONFIG java/com/google/android/gmscore/integ/modules/vision_barcode:vision_barcode_apk"
alias installlauncher="cdim; adb install -d -r out/target/product/sunfish/system_ext/priv-app/LauncherLilyGoogle/LauncherLilyGoogle.apk; cd -"
alias installsettings="cdim; adb install -d -r out/target/product/sunfish/system_ext/priv-app/Settings/Settings.apk; cd -"
alias installsettingsgoogle="cdim; adb install -d -r out/target/product/sunfish/system_ext/priv-app/SettingsGoogle/SettingsGoogle.apk; cd -"
alias launchtiffin="adb shell am start -n com.android.launcher3/.tiffin.TiffinBlocksActivity"
alias buildhctestapp="blaze build //java/com/google/android/apps/healthdata/testing/testapp --config=android_java8_libs"
alias installhctestapp="g4d; adb install -d -r blaze-bin/java/com/google/android/apps/healthdata/testing/testapp/testapp.apk; cd -"
alias exitsetup="adb root; adb shell am start -a com.android.setupwizard.EXIT"
alias formatws=" git diff HEAD^ --name-only  | xargs -t /google/bin/releases/kotlin-google-eng/ktfmt/ktfmt_deploy.jar --dropbox-style ;  git diff HEAD^ --name-only  | xargs -t google-java-format -i --aosp"
alias updatehc="adb install /usr/local/google/home/ronish/android/internal-master/out/target/product/sunfish/system/apex/com.google.android.healthconnect.apex; adb reboot"
alias pullhcdb="adb root; adb pull /data/system_ce/0/healthconnect/healthconnect.db ~/Desktop/healthconnect.db"
alias deletehcdb="adb root; adb shell rm /data/system_ce/0/healthconnect/healthconnect.db"
alias buildhf="m com.google.android.healthfitness"
alias installhf="adb install /usr/local/google/home/ronish/android/udc-dev-san/out/target/product/vsoc_x86_64/system/apex/com.google.android.healthfitness.apex; adb reboot"
alias abtd=/google/bin/releases/atp-dev/tools/forrest-mpm/forrest-mpm/forrest.par

alias tmux="tmx2"
compdef tmx2=tmux

deletehcdbforuser() {
    adb root; adb shell rm /data/system_ce/"$1"/healthconnect/healthconnect.db
}

pullhcdbforuser() {
    adb root; adb pull /data/system_ce/"$1"/healthconnect/healthconnect.db ~/Desktop/healthconnect"$1".db
}

fixup_ssh_auth_sock() {
  if [[ -n ${SSH_AUTH_SOCK} && ! -e ${SSH_AUTH_SOCK} ]]
  then
    local new_sock=$(echo /tmp/ssh-*/agent.*(=UNom[1]))
     if [[ -n ${new_sock} ]]
     then
       export SSH_AUTH_SOCK=${new_sock}
     fi
  fi
}
if [[ -n ${SSH_AUTH_SOCK} ]]
then
  autoload -U add-zsh-hook
  add-zsh-hook preexec fixup_ssh_auth_sock
fi

function phenodb() {
  adb shell sqlite3 /data/data/com.google.android.gms/databases/phenotype.db "'$*'"
}
function gcert() {
  if [[ -n $TMUX ]]; then
    eval $(tmux show-environment -s)
  fi

  command gcert "$@"
}
export PHENOTYPE_PACKAGE_NAME="com.google.android.platform.systemui"

DISABLE_AUTO_TITLE="false"
##############################################################################
# History Configuration
##############################################################################
HISTSIZE=500000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history       #Where to save history to disk
SAVEHIST=5000000              #Number of history entries to save to disk
#HISTDUP=erase                #Erase duplicates in the history file
setopt    appendhistory       #Append history to the history file (no overwriting)
setopt    sharehistory        #Share history across terminals
setopt    incappendhistory    #Immediately append to the history file, not just when a term is killed

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
ZSH_HIGHLIGHT_STYLES[assign]='fg=204'export

RBE_instance="projects/android-dev-builds/instances/default_instance"
export RBE_service="remotebuildexecution.googleapis.com:443"
export RBE_instance="projects/android-dev-builds/instances/default_instance"
export RBE_service="remotebuildexecution.googleapis.com:443"
alias libsculptor='/google/data/ro/teams/gmscore/gmscore_libsculptor/cli/live/cli_deploy.jar --envelope_args=--gfs_user=libsculptor-prod-placer run --environment=prod'
alias libsculptor='/google/data/ro/teams/gmscore/gmscore_libsculptor/cli/live/cli_deploy.jar --envelope_args=--gfs_user=libsculptor-prod-placer run --environment=prod'
export USE_RBE=true
alias acid=/google/bin/releases/mobile-devx-platform/acid/acid

export ADB_VENDOR_KEYS=$(ls -1 /usr/local/google/home/ronish/android/internal-master/vendor/google/security/adb/*.adb_key | paste -sd ":" -)

[[ -s /usr/local/google/home/ronish/.autojump/etc/profile.d/autojump.sh ]] && source /usr/local/google/home/ronish/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
gsettings set org.gnome.mutter overlay-key ""

# abtd test --test_location=remote --v2_test_name=v2/mainline-engprod/apct/mainline/U/mainline_healthfitness_device_boot_test ab::LKGB:mainline_modules_arm64-user:git_udc-release google/src/cloud/ronish/healthfitness/google3/configs/wireless/android/testing/atp/prod/mainline-engprod/config.gcl
