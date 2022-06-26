$env:LC_ALL='C.UTF-8'

$hostips = 25,32,99,201,202,203,204,205,206,208
#
foreach ($hostip in $hostips)
{
    .\miner-deploy.ps1 ${hostip}
}