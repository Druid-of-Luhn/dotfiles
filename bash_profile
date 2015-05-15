for file in ~/Developer/dotfiles/colours ~/Developer/dotfiles/aliases ~/Developer/dotfiles/functions ~/Developer/dotfiles/inputrc; do
    if [ -f $file ]; then
        . $file
    fi
done

# EXPORTS
# Export coloured prompt
export PS1="$CYAN\u$END@\h:$GREEN\W$END\$(prompt_git \" ${PURPLE}\")$END $ "
# Export path
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH
# Set editor to nvim
export EDITOR="nvim"
# Using coloured xterm terminal
export TERM=xterm-256color
# Colour ls output
export CLICOLOR=1
# Colour grep output
export GREP_OPTIONS="--color=auto"

# UTF-8 Locale
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Java
export CLASSPATH=".:bin:lib:src"
export JLIBS_HOME="/usr/share/java"
export CLASSPATH="$CLASSPATH:$JLIBS_HOME/junit-4.11.jar:JDBC.jar"
# Allows us to run JUnit tests
alias junit="java -cp .:$JLIBS_HOME/junit-4.11.jar:$JLIBS_HOME/hamcrest-core-1.3.jar org.junit.runner.JUnitCore"

# Haskell
export PATH=~/Library/Haskell/bin:$PATH

# rbenv
[ ! -f "$HOME/.rbenv/bin/rbenv" ] || eval "$(~/.rbenv/bin/rbenv init -)"

# BitchX
alias BitchX="BitchX -A"
export IRCNICK="DruidofLuhn"
export IRCUSER="druid"
export IRCHOST="druidofluhn"
export IRCNAME="Druid of Luhn"
export IRCSERVER="chat.freenode.net"
