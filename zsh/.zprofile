eval "$(/opt/homebrew/bin/brew shellenv)"
. ~/.dotfiles/zsh/.zshrc

# Setting PATH for Python 3.10
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# Added by Toolbox App
export PATH="$PATH:/Users/pedro/Library/Application Support/JetBrains/Toolbox/scripts"
