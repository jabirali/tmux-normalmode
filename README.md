# Tmux Normalmode

If you spend a lot of time in a terminal, [`tmux`][2] "copy mode" is useful.
It lets you move around the terminal via `vim`-like keyboard shortcuts,
scrolling and copying terminal contents without reaching for a mouse. 

However, even when you set the `tmux` `mode-keys` to `vi`, many of the keybindings
are quite different from `vim`: you  e.g. activate it with <kbd>Ctrl</kbd>+<kbd>b</kbd>
<kbd>[</kbd>, start selecting with <kbd>Space</kbd>, and yank with <kbd>Enter</kbd>.
In contrast, `vim` enters normal mode with <kbd>Esc</kbd>, starts selecting with
<kbd>v</kbd>, and yanks with <kbd>y</kbd>. There are other minor differences that
can be confusing. This plugin makes `tmux` copy mode more similar to `vim` normal
mode, thus reducing context switching.

## Quickstart

To install this plugin via the [Tmux Plugin Manager][1], just add this to `tmux.conf`:

	set -g @plugin 'jabirali/tmux-normalmode'

## Keybindings

Specifically, these are the keybindings mapped by this plugin:

| Keybinding                   | Description         |
| ---------------------------- | ------------------- |
| <kbd>Esc</kbd>               | Enter "normal mode" |
| <kbd>i</kbd> or <kbd>a</kbd> | Enter "insert mode" |
| <kbd>y</kbd>                 | Yank selection      |
| <kbd>v</kbd>                 | Select characters   |
| <kbd>Ctrl</kbd>+<kbd>v</kbd> | Select rectangle    |

Above, "normal mode" refers to `tmux` copy mode, where `vim`-like keybindings
apply. "Insert mode" is the `tmux` root mode, i.e. the default mode in `tmux`.
Most other relevant `vim` keybindings such as <kbd>Shift</kbd>+<kbd>v</kbd>,
<kbd>Ctrl</kbd>+<kbd>u</kbd>, <kbd>Ctrl</kbd>+<kbd>d</kbd>, are already supported
by `tmux` by default. See `man tmux`, specifically under `WINDOWS AND PANES`.

The <kbd>Esc</kbd> binding tries to be smart: it activates copy mode if the
current command appears to be a shell (e.g. `bash` or `fish`), but passes the
<kbd>Esc</kbd> binding on to the running program if not (e.g. `vim` or `man`).
This is because when you are not in a shell, you will most likely be in an
interactive (e.g. `curses`-based) app, and many of those use <kbd>Esc</kbd>.

If you want to enter normal mode in an interactive terminal app, you can either
use the default binding <kbd>Ctrl</kbd>+<kbd>b</kbd> <kbd>[</kbd>, or you could
map your own in `tmux.conf`. For instance, I like to use <kbd>Alt</kbd>+<kbd>y</kbd>:

	bind -n 'M-y' copy-mode

[1]: https://github.com/tmux-plugins/tpm
[2]: https://github.com/tmux/tmux/wiki
