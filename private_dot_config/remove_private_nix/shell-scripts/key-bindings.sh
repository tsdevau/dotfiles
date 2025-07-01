# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid

bindkey -e

if [[ -n ${terminfo[smkx]} && -n ${terminfo[rmkx]} ]]; then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# Start typing + [Up-Arrow] - fuzzy find history forward
if [[ -n "${terminfo[kcuu1]}" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search

  bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

# Start typing + [Down-Arrow] - fuzzy find history backward
if [[ -n "${terminfo[kcud1]}" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search

  bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# [Home] - Go to beginning of line
if [[ -n "${terminfo[khome]}" ]]; then
  bindkey -M emacs "${terminfo[khome]}" beginning-of-line
  bindkey -M viins "${terminfo[khome]}" beginning-of-line
  bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
fi
bindkey -M emacs "^[[1~" beginning-of-line
bindkey -M emacs "^[[H" beginning-of-line
bindkey -M viins "^[[1~" beginning-of-line
bindkey -M viins "^[[H" beginning-of-line
bindkey -M vicmd "^[[1~" beginning-of-line
bindkey -M vicmd "^[[H" beginning-of-line

# [End] - Go to end of line
if [[ -n "${terminfo[kend]}" ]]; then
  bindkey -M emacs "${terminfo[kend]}" end-of-line
  bindkey -M viins "${terminfo[kend]}" end-of-line
  bindkey -M vicmd "${terminfo[kend]}" end-of-line
fi
bindkey -M emacs "^[[4~" end-of-line
bindkey -M emacs "^[[F" end-of-line
bindkey -M viins "^[[4~" end-of-line
bindkey -M viins "^[[F" end-of-line
bindkey -M vicmd "^[[4~" end-of-line
bindkey -M vicmd "^[[F" end-of-line

# [Backspace] - delete backward
if [[ -n "${terminfo[kbs]}" ]]; then
  bindkey -M emacs "${terminfo[kbs]}" backward-delete-char
  bindkey -M viins "${terminfo[kbs]}" backward-delete-char
  bindkey -M vicmd "${terminfo[kbs]}" backward-delete-char
fi
bindkey -M emacs "^?" backward-delete-char
bindkey -M viins "^?" backward-delete-char
bindkey -M vicmd "^?" backward-delete-char

# [Delete] - delete forward
if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey -M emacs "${terminfo[kdch1]}" delete-char
  bindkey -M viins "${terminfo[kdch1]}" delete-char
  bindkey -M vicmd "${terminfo[kdch1]}" delete-char
fi
bindkey -M emacs "^[[3~" delete-char
bindkey -M viins "^[[3~" delete-char
bindkey -M vicmd "^[[3~" delete-char

# [Alt-Delete] - delete whole forward-word
if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey -M emacs "^[[3;${terminfo[kdch1]}" delete-word
  bindkey -M viins "^[[3;${terminfo[kdch1]}" delete-word
  bindkey -M vicmd "^[[3;${terminfo[kdch1]}" delete-word
fi
bindkey -M emacs "^[[3;5~" delete-word
bindkey -M viins "^[[3;5~" delete-word
bindkey -M vicmd "^[[3;5~" delete-word

# [Alt-Backspace] - delete whole backward-word
if [[ -n "${terminfo[kbs]}" ]]; then
  bindkey -M emacs "^[[3;${terminfo[kbs]}" backward-delete-word
  bindkey -M viins "^[[3;${terminfo[kbs]}" backward-delete-word
  bindkey -M vicmd "^[[3;${terminfo[kbs]}" backward-delete-word
fi
bindkey -M emacs "^[[3;3~" backward-delete-word
bindkey -M viins "^[[3;3~" backward-delete-word
bindkey -M vicmd "^[[3;3~" backward-delete-word

# [Cmd-Delete] - kill line from cursor to end of line
if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey -M emacs "^[[1;${terminfo[kdch1]}" kill-line
  bindkey -M viins "^[[1;${terminfo[kdch1]}" kill-line
  bindkey -M vicmd "^[[1;${terminfo[kdch1]}" kill-line
fi
bindkey -M emacs "^[[1;5~" kill-line
bindkey -M viins "^[[1;5~" kill-line
bindkey -M vicmd "^[[1;5~" kill-line

# [Cmd-Backspace] - kill line from cursor to start of line
if [[ -n "${terminfo[kbs]}" ]]; then
  bindkey -M emacs "^[[1;${terminfo[kbs]}" backward-kill-line
  bindkey -M viins "^[[1;${terminfo[kbs]}" backward-kill-line
  bindkey -M vicmd "^[[1;${terminfo[kbs]}" backward-kill-line
fi
bindkey -M emacs "^[[1;3~" backward-kill-line
bindkey -M viins "^[[1;3~" backward-kill-line
bindkey -M vicmd "^[[1;3~" backward-kill-line
bindkey -M emacs "^[[1;^H" backward-kill-line
bindkey -M viins "^[[1;^H" backward-kill-line
bindkey -M vicmd "^[[1;^H" backward-kill-line

# [Cmd-Shift-k] - kill the whole line
bindkey -M emacs "^[[1;[4;k" kill-whole-line
bindkey -M viins "^[[1;[4;k" kill-whole-line
bindkey -M vicmd "^[[1;[4;k" kill-whole-line

# [Alt-RightArrow] - move forward one word
if [[ -n "${terminfo[kcuf1]}" ]]; then
  bindkey -M emacs "^[[3;${terminfo[kcuf1]}" forward-word
  bindkey -M viins "^[[3;${terminfo[kcuf1]}" forward-word
  bindkey -M vicmd "^[[3;${terminfo[kcuf1]}" forward-word
fi
bindkey -M emacs "^[[3;3C" forward-word
bindkey -M viins "^[[3;3C" forward-word
bindkey -M vicmd "^[[3;3C" forward-word

# [Alt-LeftArrow] - move backward one word
if [[ -n "${terminfo[kcub1]}" ]]; then
  bindkey -M emacs "^[[3;${terminfo[kcub1]}" backward-word
  bindkey -M viins "^[[3;${terminfo[kcub1]}" backward-word
  bindkey -M vicmd "^[[3;${terminfo[kcub1]}" backward-word
fi
bindkey -M emacs "^[[3;3D" backward-word
bindkey -M viins "^[[3;3D" backward-word
bindkey -M vicmd "^[[3;3D" backward-word
