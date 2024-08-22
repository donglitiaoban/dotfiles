# dotfiles
configurations

## usage

execute symlink.py to create symbolic link for these configurations:

```
python ./symlink.py
```

## memo

Using [scoop](https://scoop.sh/) package manager on windows

Add 3rd party bucket [scoop-it](https://github.com/younger-1/scoop-it) for [im-select](https://github.com/daipeihust/im-select)

```
scoop bucket add scoop-it https://github.com/younger-1/scoop-it
```

Using [`luarocks` bundled with `lua5.1`](https://github.com/nvim-neorocks/rocks-scoop) on windows
```
scoop bucket add neorocks-scoop https://github.com/nvim-neorocks/rocks-scoop.git
```

```
scoop install neorocks-scoop/luarocks
```

Using [paru](https://github.com/Morganamilo/paru) for AUR helper

Use `aur/git-credential-manager-core-bin` in archlinux
