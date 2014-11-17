for file in ~/Developer/dotfiles/aliases ~/Developer/dotfiles/functions ~/Developer/dotfiles/inputrc; do
    if [ -f $file ]; then
        . $file
    fi
done

# Colours
BLACK="\[\e[0;30m\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
BROWN="\[\e[0;31m\]"
BLUE="\[\e[0;34m\]"
PURPLE="\[\e[0;35m\]"
CYAN="\[\e[0;36m\]"
LIGHT_GREY="\[\e[0;37m\]"
DARK_GREY="\[\e[1;30m\]"
LIGHT_RED="\[\e[1;31m\]"
LIGHT_GREEN="\[\e[1;32m\]"
LIGHT_BROWN="\[\e[1;31m\]"
LIGHT_BLUE="\[\e[1;34m\]"
LIGHT_PURPLE="\[\e[1;35m\]"
LIGHT_CYAN="\[\e[1;36m\]"
WHITE="\[\e[0;37m\]"
END="\[\e[0m\]"

export PS1="$CYAN\u$END@\h:$GREEN\W$END\$(prompt_git \" ${PURPLE}\")$END $ "

# Java
export CLASSPATH=".:bin:lib:src"
export JLIBS_HOME="/usr/share/java"
export CLASSPATH="$CLASSPATH:$JLIBS_HOME/junit-4.11.jar:JDBC.jar"
# Allows us to run JUnit tests
alias junit="java -cp .:$JLIBS_HOME/junit-4.11.jar:$JLIBS_HOME/hamcrest-core-1.3.jar org.junit.runner.JUnitCore"

# rbenv
eval "$(rbenv init -)"

# BitchX
alias BitchX="BitchX -A"
export IRCNICK="DruidofLuhn"
export IRCUSER="druid"
export IRCHOST="druidofluhn"
export IRCNAME="Druid of Luhn"
export IRCSERVER="chat.freenode.net"

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Haskell
export PATH=~/Library/Haskell/bin:$PATH

# UTF-8 Locale
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null;

			# Check for uncommitted changes in the index.
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+';
			fi;

			# Check for unstaged changes.
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='!';
			fi;

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?';
			fi;

			# Check for stashed files.
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$';
			fi;

		fi;

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		[ -n "${s}" ] && s=" [${s}]";

		echo -e "${1}${branchName}${blue}${s}";
	else
		return;
	fi;
}
