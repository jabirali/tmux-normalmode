#!/bin/sh

# Make sure we use the built-in `vi` keys.
set-window-option -g mode-keys vi

# Map Esc to activate `tmux` copy mode, but only for shells.  Shell detection
# is currently quite simple; it assumes that any shells follow the convention
# of names that end in `sh`, such as `bash`, `dash`, `zsh`, `fish`, and `tcsh`.
tmux bind -n 'Escape' \
	if-shell "[ -z '#{s/^[a-z]*sh.*//:pane_current_command}' ]" \
		'copy-mode' \
		'send-keys Escape'

# When in copy mode, use keybindings more similar to `vim` normal mode.
tmux bind -T copy-mode-vi 'y'   send -X copy-selection-no-clear
tmux bind -T copy-mode-vi 'v'   send -X begin-selection
tmux bind -T copy-mode-vi 'V'   send -X select-line
tmux bind -T copy-mode-vi 'C-v' send -X rectangle-toggle
tmux bind -T copy-mode-vi 'i'   send -X cancel
tmux bind -T copy-mode-vi 'a'   send -X cancel
