for file in ~/Developer/dotfiles/colours ~/Developer/dotfiles/aliases ~/Developer/dotfiles/functions ~/Developer/dotfiles/inputrc ~/.aliases; do
    if [ -f $file ]; then
        . $file
    fi
done

# Homebrew autocompletion
completion_loc=$(brew --prefix)/etc/bash_completion
if [ -f $completion_loc ]; then
    . $completion_loc
fi

# EXPORTS
# Export coloured prompt
export PS1="\[$CYAN\]\u\[$END\]@\h:\[$YELLOW\]\W\[$END\]\$(prompt_git \" \[${RED}\]\")\[$END\] ⟫ "
# Export path
export PATH=~/usr/bin:~/.bin:~/bin:/usr/local/bin:/usr/local/sbin:$PATH
# Set editor to vim
export EDITOR="vim"
# Using coloured xterm terminal
export TERM=xterm-256color
# Use UTF-8
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
# Colour ls output
export CLICOLOR=1
# Colour grep output
alias grep="grep --color=auto"

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;
# Allow extended globbing
shopt -s extglob

# IRC
export IRCNICK="druidofluhn"
export IRCUSER="druidofluhn"
export IRCHOST="druidofluhn"
export IRCNAME="Druid of Luhn"

# Stop Homebrew from sending analytics data back
HOMEBREW_NO_ANALYTICS=1
