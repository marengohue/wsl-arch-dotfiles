# My Arch WSL install scripts
Reproducible installation of a WSL machine with all of the stuff I need and use.

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/marengohue/wsl-arch-dotfiles/refs/heads/main/Initialize-Wsl.ps1'))
```