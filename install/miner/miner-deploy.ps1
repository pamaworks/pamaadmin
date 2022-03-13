$env:LC_ALL='C.UTF-8'
$arg1=$args[0]
$arg2=$args[1]

if ( $arg1 ){
    echo "${arg2} install"
}else{
    echo "ex)miner-install.ps1 serverno"
    Exit
}

$TARGET="192.168.50."+${arg1}

#초기 세팅
ssh ${TARGET} "New-Item -Force -Path "C:\Users\user\Documents\coin\bin"  -ItemType Directory"

cd bin
scp -r "Start-Miner.bat" "setenv-D${arg1}.bat" "miner-install.ps1"  ${TARGET}:C:\Users\user\Documents\coin\bin\
cd ..


if( $arg2 -eq "nbminer" -or $arg2 -eq "gminer" ){
    ssh ${TARGET} C:\Users\user\Documents\coin\bin\miner-install.ps1 ${arg2}
}