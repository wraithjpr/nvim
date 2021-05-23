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
| [Universal Ctags](#ctags) | Tags generation | | <https://github.com/universal-ctags/ctags> |

---

## Linters

| Name | Purpose | Configuration | Repository |
| ---- | ------- | ------------- | ---------- |
| [markdownlint](#markdownlint) | Checking markdown files | [jw-lspconfig](lua/jw-lspconfig/init.lua)<BR>[.markdownlint.yaml](.markdownlint.yaml)<BR>[lint rules](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md) | <https://github.com/igorshubovych/markdownlint-cli> |

```bash
$ npm --global ls
/usr/lib
├── eslint@7.25.0
├── markdownlint-cli@0.27.1
├── prettier@2.2.1
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

### markdownlint



### ctags

**Arch Linux**  
Install `Universal Ctags` from the AUR package, [uctags-git](https://aur.archlinux.org/uctags-git.git).

See Tim Pope's post, [Effortless Ctags With Git](https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html).  
The script and hooks to automate ctags generation in Git are in `~/.git_template/hooks/`.  

`~/.git_template/hooks/ctags`

```bash
#!/bin/sh
set -e
trap 'rm -f "$$.tags"' EXIT

git ls-files | uctags --tag-relative -L - -f"$$.tags"

mv "$$.tags" "tags"
```

`~/.git_template/hooks/post-checkout`  
`~/.git_template/hooks/post-commit`  
`~/.git_template/hooks/post-merge`

```bash
#!/bin/sh
.git/hooks/ctags >/dev/null 2>&1 &
```

I set an alias in Git, so `git ctags` will generate the `tags` file for a repository.

---

