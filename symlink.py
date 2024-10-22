import os
import shutil
from pathlib import Path
from datetime import datetime

def backup_replace(src: Path, dst: Path) -> None:
    if dst.exists(follow_symlinks=False):
        timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
        newname = dst.stem + timestamp + dst.suffix
        dst.rename(dst.parent.joinpath(newname))
    dst.symlink_to(src, target_is_directory=src.is_dir())


def command_exists(command: str) -> bool:
    return shutil.which(command) is not None


def add_dot(name: str) -> str:
    return "." + name


if __name__ == "__main__":

    repo = Path(__file__).parent
    home = Path.home()

    is_windows = os.name == "nt"

    # wezterm
    if command_exists("wezterm"):
        directory = "wezterm"
        src = repo.joinpath(directory)
        dst = home.joinpath(".config", directory)
        backup_replace(src, dst)

    # vim
    if command_exists("vim"):
        windst = home.joinpath("vimfiles")
        unixdst = home.joinpath(".vim")
        dst = windst if is_windows else unixdst
        backup_replace(repo.joinpath("vim"), dst)

    # neovide
    if command_exists("neovide"):
        windst = home.joinpath("AppData", "Roaming", "neovide")
        unixdst = home.joinpath(".config", "neovide")
        dst = windst if is_windows else unixdst 
        src = repo.joinpath("neovide")
        backup_replace(src, dst)

    # nvim
    if command_exists("nvim"):
        windst = home.joinpath("AppData", "Local", "nvim")
        unixdst = home.joinpath(".config", "nvim")
        dst = windst if is_windows else unixdst
        backup_replace(repo.joinpath("nvim"), dst)

    # pwsh or powershell
    if command_exists("pwsh"):
        windst = home.joinpath("Documents", "PowerShell")
        unixdst = home.joinpath(".config", "powershell")
        dst = windst if is_windows else unixdst 
        backup_replace(repo.joinpath("pwsh"), dst)

    # gitconfig
    if command_exists("git"):
        dst = home.joinpath(".gitconfig")
        src_file = "gitconfig.windows" if is_windows else "gitconfig.linux"
        backup_replace(repo.joinpath(src_file), dst)

    # zsh
    if command_exists("zsh"):
        filename = "zshrc"
        src = repo.joinpath("zshrc")
        dst = home.joinpath(add_dot(filename))
        backup_replace(src, dst)

    #ideavim
    if command_exists("pycharm") or command_exists("rustrover"):
        filename = "ideavimrc"
        src = repo.joinpath(filename)
        dst = home.joinpath(add_dot(filename))
        backup_replace(src, dst)

    # nushell
    if command_exists("nu"):
        windst = home.joinpath("AppData", "Roaming", "nushell")
        unixdst = home.joinpath(".config", "nushell")
        dst = windst if is_windows else unixdst
        backup_replace(repo.joinpath("nushell"), dst)

    # 看看
    # 因为python未识别导致脚本未运行，没有输出看上去就像正常执行
    # 加一句print，看到就代表脚本已运行
    print("script executed")
