
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export DEFAULT_USER=$USER

ZSH_THEME="agnoster"

plugins=(git macos)

source $ZSH/oh-my-zsh.sh

# FUNCTIONS

function hl (){
    highlight -O rtf "$1" | pbcopy
    echo "code is copied to clipboard"
}

# Create a new directory and enter it
function md() {
	mkdir -p "$@" && cd "$@"
}

function code {
    open -a '/Volumes/Macintosh HD/Applications/Visual Studio Code.app' "$1"
}

# Go to the root of the current git project, or just go one folder up
function up() {
  export git_dir="$(git rev-parse --show-toplevel 2> /dev/null)"
  if [ -z $git_dir ]
  then
    cd ..
  else
    cd $git_dir
  fi
}
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
