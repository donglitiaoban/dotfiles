import os
import shutil
from pathlib import Path
from datetime import datetime

# source是repo已有的文件（夹），target是要建立符号链接的路径
def backup_replace(source: Path, target: Path) -> None:
    if target.exists(follow_symlinks=False):
        timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
        newname = target.stem + timestamp + target.suffix
        target.rename(target.parent.joinpath(newname))
    target.symlink_to(source, target_is_directory=source.is_dir())


def command_exists(command: str) -> bool:
    return shutil.which(command) != None


def add_dot(name: str) -> str:
    return "." + name


if __name__ == "__main__":

    repo = Path(__file__).parent
    home = Path.home()

    is_windows = os.name == "nt"

    # wezterm
    if command_exists("wezterm"):
        directory = "wezterm"
        source = repo.joinpath(directory)
        target = home.joinpath(".config", directory)
        backup_replace(source, target)

    # nvim
    if command_exists("vim"):
        winpath = home.joinpath("vimfiles")
        unixpath = home.joinpath(".vim")
        target = winpath if is_windows else unixpath
        backup_replace(repo.joinpath("vim"), target)


    # nvim
    if command_exists("nvim"):
        winpath = home.joinpath("AppData", "Local", "nvim")
        unixpath = home.joinpath(".config", "nvim")
        target = winpath if is_windows else unixpath
        backup_replace(repo.joinpath("nvim"), target)

    # pwsh or powershell
    if command_exists("pwsh"):
        winpath = home.joinpath("Documents", "PowerShell")
        unixpath = home.joinpath(".config", "powershell")
        target = winpath if is_windows else unixpath
        backup_replace(repo.joinpath("pwsh"), target)

    # gitconfig
    if command_exists("git"):
        target = home.joinpath(".gitconfig")
        repofile = "gitconfig.windows" if is_windows else "gitconfig.linux"
        backup_replace(repo.joinpath(repofile), target)

    # zsh
    if command_exists("zsh"):
        filename = "zshrc"
        source = repo.joinpath("zshrc")
        target = home.joinpath(add_dot(filename))
        backup_replace(source, home.joinpath(".zshrc"))
    
    # 因为python未识别导致脚本未运行，没有输出看上去就像正常执行
    # 加一句print，看到就代表脚本已运行
    print("script executed")
