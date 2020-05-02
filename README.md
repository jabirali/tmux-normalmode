# Tmux Normalmode

If you spend a lot of time in a terminal, then `tmux` "copy mode" is very useful.
If you set `mode-keys` to `vi`, it lets you move around the terminal output using
`vim`-like keyboard shortcuts, paging or copying content without a mouse. 

However, even in `vi` mode, many of the keybindings are quite different from `vim`:
you enter the mode with <kbd>Ctrl</kbd>+<kbd>b</kbd> <kbd>[</kbd>, start selecting
with <kbd>Space</kbd>, and yank with <kbd>Enter</kbd>. In contrast, `vim` would
enter normal mode with <kbd>Esc</kbd>, start selecting with <kbd>v</kbd>, and
yank with <kbd>y</kbd>. There are other minor differences like this that can
easily confuse you. This plugin makes `tmux` copy mode more similar to `vim`.

## Keybindings

Specifically, these are the keybindings mapped by this plugin:

| Keybinding                   | Description         |
| ---------------------------- | ------------------- |
| <kbd>Esc</kbd>               | Enter "normal mode" |
| <kbd>i</kbd>                 | Enter "insert mode" |
| <kbd>a</kbd>                 | Enter "insert mode" |
| <kbd>y</kbd>                 | Yank selection      |
| <kbd>v</kbd>                 | Select characters   |
| <kbd>V</kbd>                 | Select lines        |
| <kbd>Ctrl</kbd>+<kbd>v</kbd> | Select rectangle    |

Here, "normal mode" refers to `tmux` copy mode, where `vim`-like keybindings
apply. "Insert mode" is the `tmux` root mode, i.e. the default mode in `tmux`.
The <kbd>Esc</kbd> binding tries to be smart: it activates copy mode if the
current command appears to be a shell (e.g. `bash` or `fish`), but passes the
<kbd>Esc</kbd> binding on to the running program if not (e.g. `vim` or `man`).
This is because when you are not in a shell, you will most likely be in an
interactive (e.g. `curses`-based) app, and many of those use <kbd>Esc</kbd>.

If you want to enter normal mode in an interactive terminal app, you can either
use the default binding <kbd>Ctrl</kbd>+<kbd>b</kbd> <kbd>[</kbd>, or you could
map your own in `tmux.conf`, e.g. I like <kbd>Alt</kbd>+<kbd>y</kbd>:

	bind -n 'M-y' copy-mode

## Quickstart

To install this plugin via the [Tmux Plugin Manager][1], just add this to `tmux.conf`:

	set -g @plugin 'jabirali/tmux-normalmode'

[1]: https://github.com/tmux-plugins/tpm
