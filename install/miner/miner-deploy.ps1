$env:LC_ALL='C.UTF-8'
$hostno=$args[0]
$arg2=$args[1]

if ( $hostno ){
    #echo "${hostno} install"
}else{
    echo "ex)miner-install.ps1 serverno"
    Exit
}

$TARGET="192.168.50."+${hostno}


$hostnoStr=$hostno
if ( $hostno -lt 100 ){
    $hostnoStr="0"+$hostno
}
echo  " $TARGET Transper Files -------------------------"
#ssh ${TARGET} "New-Item -Force -Path .\Documents\coin\bin  -ItemType Directory"
scp -r ".\bin\begin.cmd" ".\bin\Start-Miner.bat" ".\bin\setenv-D${hostnoStr}.bat" ${TARGET}:.\Documents\coin\bin\
