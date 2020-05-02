#!/bin/sh

# Make sure we use the built-in `vi` keys.
tmux set-window-option -g mode-keys vi

# Map Esc to activate `tmux` copy mode, but only for shells.  Shell detection
# is currently quite simple; it assumes that any shells follow the convention
# of names that end in `sh`, such as `bash`, `dash`, `zsh`, `fish`, and `tcsh`.
# You can customize the regexp used for shell detection via `@normalmode-regexp`.
regexp="$(tmux show-option -gv @normalmode-regexp 2>/dev/null)"
if [ -z "$regexp" ]
then
	regexp='[a-z]*sh.*'
fi

tmux bind -n 'Escape' \
	if-shell "[ -z '#{s/^$regexp\$//:pane_current_command}' ]" \
		'copy-mode' \
		'send-keys Escape'

# When in copy mode, use keybindings more similar to `vim` normal mode.
tmux bind -T copy-mode-vi 'i'   send -X cancel
tmux bind -T copy-mode-vi 'a'   send -X cancel
tmux bind -T copy-mode-vi 'y'   send -X copy-selection-no-clear
tmux bind -T copy-mode-vi 'v'   send -X begin-selection
tmux bind -T copy-mode-vi 'V'   send -X select-line
tmux bind -T copy-mode-vi 'C-v' send -X rectangle-toggle

# Bonus feature: Prompt navigation commands.
prompt="$(tmux show-option -gv @normalmode-prompt 2>/dev/null)"
if [ -n "$prompt" ]
then
	tmux bind -T copy-mode-vi '[' \
		send -X start-of-line \\\;\
		send -X search-backward "$prompt"
	tmux bind -T copy-mode-vi 'C-p' \
		send -X start-of-line \\\;\
		send -X search-backward "$prompt"
	tmux bind -T copy-mode-vi ']' \
		send -X end-of-line  \\\;\
		send -X search-forward  "$prompt"
	tmux bind -T copy-mode-vi 'C-n' \
		send -X end-of-line  \\\;\
		send -X search-forward  "$prompt"
fi
