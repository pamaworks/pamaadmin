$env:LC_ALL='C.UTF-8'

$hostips = "32","201","202","203","205","206","207","208","99"
foreach ($hostip in $hostips)
{
    echo  "${hostip} ------------------------------------------------------------------------------------------------------------------------------"
    .\miner-deploy.ps1 ${hostip}
}