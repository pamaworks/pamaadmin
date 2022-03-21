$env:LC_ALL='C.UTF-8'

$hostips = "201","202","203","204","205","206","207","208"
foreach ($hostip in $hostips)
{
    
    ssh 192.168.50.${hostip} shutdown -r -t 0 
}