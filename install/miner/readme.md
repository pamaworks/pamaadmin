PowerShell

초코렛 설치

'''
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install nssm -y
choco uninstall nssm -y

nssm install "sminer" "C:\Users\user\Documents\coin\gminer_2_75_windows64\Start-Miner.bat"

nssm install "sminer" "C:\Users\user\Documents\coin\Start-Miner.bat"

nssm start "sminer"
''''
C:\Users\user\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

nssm stop "sminer"
nssm remove "sminer" confirm
