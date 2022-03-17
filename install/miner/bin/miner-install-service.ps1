$env:LC_ALL='C.UTF-8'
$arg1=$args[0]
$arg2=$args[1]
$minername=$arg1

if ( $minername ){
    echo "${minername} install start ...."
}else{
    echo "Miner name is not invalid"
    Exit
}

$COINBINPATH="${env:HOMEPATH}\Documents\coin\bin"
cd ${COINBINPATH}

#choco install
if ( -not ( Test-Path -Path "C:\ProgramData\chocolatey\bin\choco.exe" ) ){
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

#nssm install
if ( -not ( Test-Path -Path "C:\ProgramData\chocolatey\bin\nssm.exe" ) ){
    choco install nssm -y
}


$isService=Get-Service | findstr sminer
if($isService){

    nssm stop "sminer"
    nssm remove "sminer" confirm

}

nssm install "sminer" "C:\Users\user\Documents\coin\bin\Start-Miner.bat"
timeout 3
nssm start "sminer"


dir
Get-Service | findstr sminer
echo "${minername} install complete ...."