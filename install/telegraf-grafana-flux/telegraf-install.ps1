
if ( $args ){
    echo "${args}"
}else{
    Exit
}


$key=$args
$TARGET="192.168.50."+${key}
scp -r telegraf-deploy.ps1  ${TARGET}:C:\Users\user\Documents\coin\
scp -r telegraf.conf ${TARGET}:C:\Users\user\Documents\coin\

ssh ${TARGET}  "Set-ExecutionPolicy Unrestricted"

ssh ${TARGET} "[Environment]::SetEnvironmentVariable('DEVICEID', 'D${key}', 'Machine')"
ssh ${TARGET} "[Environment]::GetEnvironmentVariable('DEVICEID', 'Machine')"


ssh ${TARGET} "C:\Users\user\Documents\coin\telegraf-deploy.ps1 noinstall"
