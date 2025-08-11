## Source from conf.d before our fish config
source /usr/share/cachyos-fish-config/conf.d/done.fish


### === === Set Values === === ###

## Run fastfetch as welcome message
function fish_greeting
    fastfetch
end

# Format man pages
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end


### === === Bang-Bang === === ###
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang

function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end


### === === Functions === === ###

function bak --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

function pkgdep --description 'package depedencies'
   command pacman -Qq | fzf --preview 'pactree -lur {} | sort' --layout reverse --bind 'enter:execute(pactree -lu {} | sort | less)';
end

### === === Aliases === === ###

# util
alias pls='sudo'
alias x='exit'
alias c='clear'

# ls -> eza
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -aa --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias lf='eza -bl --color=always --group-directories-first --icons' # tree listing
alias l.='eza -al | grep --color=none -e " \."'                                   # show only dotfiles
alias l= 'ls'

# cd prev dirs
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# system/packages
alias sysupdate='yay -Syu'
alias sysclean='yay -Rns (yay -Qtdq)'
alias bigpkg='expac -H M "%m\t%n" | sort -h | nl'        # Sort installed packages according to size in MB
alias gitpkg='yay -Q | grep -i "\-git" | wc -l'          # List amount of -git packages
alias mirror='sudo cachyos-rate-mirrors'
alias fixpacman='sudo rm /var/lib/pacman/db.lck'
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias rip='expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'

alias dotar='tar -acf'
alias untar='tar -zxvf'
alias wget='wget -c'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias tb='nc termbin.com 9999'
alias jctl='journalctl -p 3 -xb'

alias shebang='echo "#!/usr/bin/env bash"'

starship init fish | source