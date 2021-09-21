for file in ~/Developer/dotfiles/colours ~/Developer/dotfiles/aliases ~/Developer/dotfiles/functions ~/.aliases; do
    if [ -f $file ]; then
        . $file
    fi
done

# Homebrew autocompletion
if [ $(hash brew 2>/dev/null) ]; then
    completion_loc=$(brew --prefix)/etc/bash_completion
    if [ -f $completion_loc ]; then
        . $completion_loc
    fi
fi

# EXPORTS
# Export coloured prompt
export PS1="\[$CYAN\]\u\[$END\]@\h:\[$YELLOW\]\W\[$END\]\$(prompt_git ' \\[${RED}\\]')\[$END\] ⟫ "
# Export path
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/usr/opt/gradle/gradle-4.2/bin:$PATH
export PATH=$HOME/bin:$HOME/.bin:$HOME/usr/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/opt/curl/bin:$PATH
# Set editor to vim
export EDITOR="vim"
# Using coloured screen terminal
export TERM=screen-256color
# Use UTF-8
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
# Use ctags backend for gtags
export GTAGSCONF=~/.globalrc
export GTAGSLABEL=ctags
# Colour ls output
export CLICOLOR=1
# Sumo home directory
export SUMO_HOME="/usr/local/opt/sumo/share/sumo"
# Guile
export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

# Activate virtualenv if present
if [ -n "$VIRTUAL_ENV" ]; then
    . "$VIRTUAL_ENV/bin/activate"
fi

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;
# Allow extended globbing
shopt -s extglob

# Stop Homebrew from sending analytics data back
HOMEBREW_NO_ANALYTICS=1

# Includes, Libraries and pkg-config
export C_INCLUDE_PATH=$HOME/usr/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$HOME/usr/include:$CPLUS_INCLUDE_PATH
export LD_LIBRARY_PATH=$HOME/usr/lib:$HOME/usr/lib64:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$HOME/usr/lib/pkgconfig:$PKG_CONFIG_PATH
