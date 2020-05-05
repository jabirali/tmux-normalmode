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

| Keybinding                                   | Description            |
| -------------------------------------------- | ---------------------- |
| <kbd>Esc</kbd>                               | Enter "normal mode"    |
| <kbd>i</kbd> or <kbd>a</kbd>                 | Enter "insert mode"    |
| <kbd>y</kbd>                                 | Yank selection         |
| <kbd>v</kbd>                                 | Select characters      |
| <kbd>Ctrl</kbd>+<kbd>v</kbd>                 | Select rectangle       |
| <kbd>Ctrl</kbd>+<kbd>p</kbd> or <kbd>[</kbd> | Previous shell prompt  |
| <kbd>Ctrl</kbd>+<kbd>n</kbd> or <kbd>]</kbd> | Next shell prompt      |

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
The binding is disabled by default, since people that use `vi` bindings in
their shell may not want it enabled. To enable it, you have to specify a
whole-line regexp that matches your shell. For instance, to match any
command like `bash` or `fish` that end in `sh`, set this regexp to:

	set -g @normalmode-regexp '[a-z]*sh.*'

If you want to enter normal mode in a app that does not match the pattern above,
you can either use the default <kbd>Ctrl</kbd>+<kbd>b</kbd> <kbd>[</kbd>, or you can
map your own in `tmux.conf`. For instance, I like <kbd>Alt</kbd>+<kbd>y</kbd>:

	bind -n 'M-y' copy-mode

As a bonus feature, if you have a distinctive set of characters in your shell
prompt like `❯` or `>>>`, you can get keybindings to navigate between them.
To enable these, add a setting to your `tmux.conf` describing your prompt:

     set -g @normalmode-prompt '❯'

[1]: https://github.com/tmux-plugins/tpm
[2]: https://github.com/tmux/tmux/wiki
