$arg1=$args[0]
$arg2=$args[1]

if ( $arg1 ){
    echo "${arg1}"
    echo "${arg2} install"
}else{
    Exit
}

$key=$arg1
$TARGET="192.168.50."+${key}

scp -r .\bin\  ${TARGET}:C:\Users\user\Documents\coin\
scp nbminer-deploy.ps1  ${TARGET}:C:\Users\user\Documents\coin\

if( $arg2 -eq "nbminer" ){
    ssh ${TARGET} C:\Users\user\Documents\coin\nbminer-deploy.ps1
}