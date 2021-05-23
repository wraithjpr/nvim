# My Neovim Config

I use Neovim configured using lua.

## Plugins

| Name                      | Purpose                   | Configuration             |
| ------------------------- | ------------------------- | ------------------------- |
| Item1                     | Item1                     | Item1                     |

---

## Dependencies

| Name | Purpose | Configuration | Repository |
| ---- | ------- | ------------- | ---------- |
| [Fira Code Nerd Font](#Fonts) | Font supporting web devicons | `~/.Xresources` | <https://github.com/ryanoasis/nerd-fonts> |
| [Universal Ctags](#ctags) | Tags generation | `~/.git_template/hooks/ctags` | <https://github.com/universal-ctags/ctags> |

```bash
$ pacman -Q
efm-langserver-git r303.0e684cd-1
fd 8.2.1-1
jdtls 1.0.0-1
lua-language-server 1.21.2-1
luarocks 3.5.0-1
neovim-git 0.4.0.r3627.gabf2ffd1e-1
nerd-fonts-dejavu-complete 2.1.0-3
nerd-fonts-fira-code 2.1.0-2
nerd-fonts-mononoki 2.1.0-1
nerd-fonts-noto 2.1.0-2
nerd-fonts-source-code-pro 2.1.0-2
nodejs 15.14.0-1
npm 7.10.0-1
pandoc 2.13-7
python 3.9.3-1
ripgrep 12.1.1-1
shellcheck 0.7.1-360
tree-sitter 0.19.4-1
xclip 0.13-3
yaml-language-server 0.19.1-1
$
```

```bash
$ fd -t d -d 1 '' ./AUR
AUR/efm-langserver-git
AUR/jdtls
AUR/lua-language-server
AUR/neovim-git
AUR/nerd-fonts-mononoki
AUR/uctags-git
AUR/yaml-language-server
$
```

---

## Linters

| Name | Purpose | Configuration | Repository |
| ---- | ------- | ------------- | ---------- |
| [markdownlint](#markdownlint) | Checking markdown files | ○ [jw-lspconfig](lua/jw-lspconfig/init.lua)<BR>○ `~/.markdownlintrc` or [.markdownlint.yaml](.markdownlint.yaml)<BR>○ [lint rules](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md) | <https://github.com/igorshubovych/markdownlint-cli> |

```bash
$ npm --global ls
/usr/lib
├── eslint@7.25.0
├── markdownlint-cli@0.27.1
├── prettier@2.2.1
```

```bash
$ pip3 list
Package            Version
------------------ -----------
flake8             3.9.1
isort              5.8.0
pynvim             0.4.3
yapf               0.31.0
$
```

---

## Language Servers

```bash
$ npm --global ls
/usr/lib
├── bash-language-server@1.17.0
├── pyright@1.1.136
└── yaml-language-server@0.19.1
```

---

## Install

### Fonts

To get the full effect of web devicons, a patched nerd font is needed. I use Fira Code Nerd Font:

```bash
$ pacman -Qi nerd-fonts-fira-code
Name            : nerd-fonts-fira-code
Version         : 2.1.0-2
Description     : Patched font Fira (Fura) Code from the nerd-fonts library
Architecture    : any
URL             : https://github.com/ryanoasis/nerd-fonts
Licenses        : MIT
Groups          : nerd-fonts
Provides        : nerd-fonts-fira-code
Depends On      : fontconfig
Optional Deps   : None
Required By     : None
Optional For    : None
Conflicts With  : nerd-fonts-git  nerd-fonts-complete  otf-nerd-fonts-fira-code
Replaces        : None
Installed Size  : 75.81 MiB
Packager        : Unknown Packager
Build Date      : Sat 17 Apr 2021 13:22:30 BST
Install Date    : Sat 17 Apr 2021 13:22:34 BST
Install Reason  : Explicitly installed
Install Script  : No
Validated By    : None

$
$ grep 'Fira Code Nerd Font' ~/.Xresources
*faceName: Fira Code Nerd Font
$
```

To install:

1. Install the font package:

   ```bash
   pacman -S nerd-fonts-fira-code
   ```

2. Configure xterm by editing `~/.Xresources`:

   ```text
   *faceName: Fira Code Nerd Font
   ```

   After editing, merge with xterm resources database with:

   ```bash
   xrdb -merge ~/.Xresources
   ```

### markdownlint

//TODO document markdownlint

### ctags

**Arch Linux**  
Install `Universal Ctags` from the AUR package, [uctags-git](https://aur.archlinux.org/uctags-git.git).

See Tim Pope's post, [Effortless Ctags With Git](https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html).  
The script and hooks to automate ctags generation in Git are in `~/.git_template/hooks/`.  

```sh
git config --global init.templatedir '~/.git_template'
mkdir -p ~/.git_template/hooks
```

The five scripts to go in `~/.git_template/hooks`, and which should be set executable with `chmod a+x`, are:  
`ctags`  
`post-checkout`  
`post-commit`  
`post-merge`  
`post-rewrite`

`~/.git_template/hooks/ctags`

```sh
#!/bin/sh
set -e
trap 'rm -f "$$.tags"' EXIT

git ls-files | uctags --tag-relative -L - -f"$$.tags"

mv "$$.tags" "tags"
```

`~/.git_template/hooks/post-checkout`  
`~/.git_template/hooks/post-commit`  
`~/.git_template/hooks/post-merge`

```sh
#!/bin/sh
.git/hooks/ctags >/dev/null 2>&1 &
```

`~/.git_template/hooks/post-rewrite`

```sh
#!/bin/sh
case "$1" in
  rebase) exec .git/hooks/post-merge ;;
esac
```

I set an alias in Git, so `git ctags` will generate the `tags` file for a repository.

```sh
git config --global alias.ctags '!.git/hooks/ctags
```

---

