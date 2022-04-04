PowerShell
ssh 기본 파워셀ㄹ로 변경
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force



https://joonyon.tistory.com/184

초코렛 설치

'''
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
if ( -not ( Test-Path -Path "C:\ProgramData\chocolatey\bin\choco.exe" ) ){
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}
choco install nssm -y
choco uninstall nssm -y

nssm install "sminer" "C:\Users\user\Documents\coin\gminer_2_75_windows64\Start-Miner.bat"

nssm install "sminer" "C:\Users\user\Documents\coin\bin\Start-Miner.bat"

nssm start "sminer"
''''
C:\Users\user\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

nssm stop "sminer"
nssm remove "sminer" confirm








PowerShell에서 프로세스를 종료하는 방법
Advertisement

Powershell은 명령을 제공합니다 Stop-Process 명령 프롬프트에서 프로세스를 종료합니다. 이 명령은 프로세스 ID, 프로세스 이름 등을 가져오고 CMD에서 프로세스를 종료 할 수 있습니다.

Advertisement

이름을 사용하여 프로세스를 종료하는 Powershell 명령
아래는 응용 프로그램 또는 이미지 파일의 이름을 사용하여 프로세스를 종료하는 명령 예입니다.

Stop-Process -Name ApplicationName
예를 들어 powershell을 사용하여 크롬 응용 프로그램을 종료하려면

Stop-process -Name Chrome
이 명령은 요청하지 않습니다확인하고 바로 실행중인 프로세스를 종료하십시오. 응용 프로그램이 컴퓨터에서 여러 인스턴스를 실행중인 경우 (예 : 여러 개의 Firefox 창) 각 프로세스가 종료됩니다. 특정 인스턴스를 종료하려면 processId 인수를 Stop-Process 명령.

ID를 사용하여 프로세스를 종료하는 Powershell 명령
Stop-process -Id processId
예:
다음은 특정 CMD 프로세스 중지 프로세스 중지를 표시하는 명령 시퀀스입니다.

PS C:> tasklist | findstr /C:cmd
cmd.exe 7628 Console 1 4,444 K
cmd.exe 9640 Console 1 3,512 K
cmd.exe 9352 Console 1 3,564 K
PS C:> stop-process -Id 7628
PS C:> tasklist | findstr /C:cmd
cmd.exe 9640 Console 1 3,512 K
cmd.exe 9352 Console 1 3,564 K
더 많은 예
컴퓨터에서 실행중인 모든 CMD 프로세스 종료

Stop-Process -name CMD
윈도우 탐색기 죽이기

Stop-Process -name explorer
퍼티 세션 종료

stop-process -name putty



리눅스 채굴