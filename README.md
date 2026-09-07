# emacs-config

Personal GNU Emacs configuration for general development, with fast navigation, completion, linting, Git/Magit integration, language support, and a more comfortable graphical interface.

> This repository contains a classic Emacs setup based on `~/.emacs` and a `~/.emacs.d` directory with ELPA packages already included. In the long term, it would be better to move package installation to a declarative setup, but the repository can be used as-is.

## Main features

- **Navigation and search** with Helm, Swiper/Helm, Ido, and custom shortcuts.
- **Completion** with `auto-complete` and mode-specific configuration.
- **Code quality** with Flycheck, whitespace cleanup on save, and `TODO`/`FIXME` highlighting.
- **Git integration** with Magit.
- **Graphical UI enhancements** with a Doom theme, NeoTree, Minimap, Beacon, line numbers, and current-line highlighting.
- **Editing helpers** with `expand-region`, `smartparens`, `undo-tree`, `which-key`, and `aggressive-indent`.
- **Language modes** for C/C++, C#, Python, CMake, Groovy, Markdown, Org, and others.
- **Popup terminal** with `shell-pop`.

## Requirements

- GNU Emacs 27 or newer recommended.
- Git, to clone the repository and use Magit.
- Bash, used by the `shell-pop` configuration.
- Optional: `cscope`, if you want to use the `xcscope` integration.
- Optional: `all-the-icons` fonts, if you want full icon support in graphical Emacs.

On Arch Linux / CachyOS, for example:

```bash
sudo pacman -S emacs git bash cscope
```

## Installation

### 1. Back up your current configuration

Before installing, save any existing Emacs configuration:

```bash
mv ~/.emacs ~/.emacs.backup 2>/dev/null || true
mv ~/.emacs.d ~/.emacs.d.backup 2>/dev/null || true
```

### 2. Clone the repository

```bash
git clone https://github.com/jlmolinero/emacs-config.git ~/emacs-config
```

### 3. Link the configuration files

```bash
ln -s ~/emacs-config/.emacs ~/.emacs
ln -s ~/emacs-config/.emacs.d ~/.emacs.d
```

You can copy the files instead of symlinking them, but symlinks make it easier to keep the configuration updated with Git.

### 4. Start Emacs

```bash
emacs
```

The first startup may take longer than usual if Emacs updates packages or generates caches.

### 5. Install icon fonts

If you use graphical Emacs and see missing icons or square placeholders, run this inside Emacs:

```elisp
M-x all-the-icons-install-fonts
```

Then restart Emacs or refresh your system font cache.

## Repository structure

```text
.
├── .emacs          # Main Emacs configuration
├── .emacs.d/       # Emacs directory with ELPA packages and associated state
├── .gitignore      # Rules to avoid tracking new cache/temporary files
└── README.md       # This documentation
```

## Notable shortcuts

| Shortcut | Action |
| --- | --- |
| `C-c C-g C-l` | Go to a specific line (`goto-line`) |
| `C-=` | Expand selection (`expand-region`) |
| `C-?` | Contract selection (`expand-region`) |
| `C-x C-f` | Open files with Helm |
| `C-x b` | Switch buffers with Helm |
| `M-x` | Run commands with Helm |
| `M-y` | Browse the kill-ring with Helm |
| `C-s` / `C-r` | Search with Swiper/Helm |
| `F6` | Create/show the minimap |
| `F7` | Close the minimap |
| `F8` | Toggle NeoTree |
| `F9` | Open/close the popup terminal (`shell-pop`) |
| `M-g` | Open Magit status |

## Configured packages

The configuration declares, among others, these packages:

- `org`
- `magit`
- `helm`
- `swiper-helm`
- `auto-complete`
- `flycheck`
- `which-key`
- `smartparens`
- `undo-tree`
- `expand-region`
- `aggressive-indent`
- `doom-themes`
- `all-the-icons`
- `neotree`
- `minimap`
- `shell-pop`
- `engine-mode`
- `yasnippet`
- `lsp-jedi`
- `xcscope`

## Quick customization

The main personal settings are near the top of `.emacs`:

```elisp
(setq user-full-name "Name"
      user-mail-address "email@example.com")
(setq calendar-latitude 42.2)
(setq calendar-longitude -71.1)
(setq calendar-location-name "Madrid, ES")
```

Change these values to your name, email address, and location.

You should also review:

- `shell-pop-default-directory`, which currently points to a local machine-specific path.
- `shell-pop-term-shell`, if you do not use `/bin/bash`.
- The theme loaded with `(load-theme 'doom-1337 t)`.
- The window size configured with `(set-frame-size ...)`.

## Reloading the configuration

The configuration includes a helper function to reload `~/.emacs` without restarting Emacs:

```elisp
M-x reload-dotemacs-file
```

## Recommended maintenance

This repository works, but there are several clear improvements for future iterations:

1. **Separate configuration from installed packages**: avoid versioning `.emacs.d/elpa/` and declare packages reproducibly from `.emacs`, `init.el`, or a package manager such as `use-package`, `straight.el`, or `elpaca`.
2. **Move from `~/.emacs` to `~/.emacs.d/init.el`**: this is the most common layout for modern Emacs configurations.
3. **Split the configuration into modules**: for example `lisp/ui.el`, `lisp/completion.el`, `lisp/languages.el`, and `lisp/keybindings.el`.
4. **Move personal data to an untracked local file**: for example `local.el`, loaded only if it exists.
5. **Avoid tracking generated state**: files such as `recentf`, histories, caches, and package data should stay out of the repository.
6. **Validate the configuration in CI**: load Emacs in batch mode to check for startup errors.

## Basic check

You can validate that Emacs loads the main configuration file in batch mode with:

```bash
emacs --batch --load ~/.emacs --eval '(message "Config OK")'
```

If you are inside the repository and have not installed the symlinks yet:

```bash
emacs --batch --load ./.emacs --eval '(message "Config OK")'
```

## License

This repository does not declare an explicit license. If you want other people to be able to reuse it, add a license such as MIT, Apache-2.0, or GPL-3.0.
