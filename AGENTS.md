# Repository guide

## Layout

- This is a GNU Stow dotfiles repo, not an application. Each top-level directory is a Stow package; paths inside it mirror `$HOME` (for example, `nvim/.config/nvim` maps to `~/.config/nvim`). Preserve this layout.

## Stow workflow

Run from the repository root. Preview before applying:

```sh
stow --simulate --verbose --target="$HOME" <package>
stow --verbose --target="$HOME" <package>
```

- Check the preview for conflicts; Stow can fold links into an existing target directory rather than replace it.
- `stow --adopt` imports an existing target file into the package and can overwrite the package copy. Inspect both files first and review `git diff` afterward.

## Neovim

- Requires Neovim 0.12+ and uses native `vim.pack`.
- `nvim/.config/nvim/nvim-pack-lock.json` is the plugin lockfile; keep plugin changes consistent with this setup.

## Validation and side effects

- There are no repo-level build, test, lint, or CI workflows. For link changes, Stow's simulation is the focused validation.
- `hypr/.config/hypr/scripts/check-deps.sh` installs missing packages via `paru -S`; it is not a read-only check. Do not run it without authorization.
