$env:LC_ALL='C.UTF-8'
$hostno=$args[0]
$arg2=$args[1]

if ( $hostno ){
    echo "${hostno} install"
}else{
    echo "ex)miner-install.ps1 serverno"
    Exit
}

$TARGET="192.168.50."+${hostno}





if ( $hostno -eq "linux" ){
    
    ssh ${TARGET} "if [ ! -d ~/Downloads/ ]; then mkdir -p ~/Downloads; fi "
    ssh ${TARGET} "if [ ! -d ~/coin/bin/ ]; then mkdir -p ~/coin/bin/; fi "

    scp -r ".\bin\Start-Miner204.sh"  ${TARGET}:~/coin/bin/
    

    # ssh ${TARGET} "if [ ! -d ~/coin/bin/gminer_2_89_linux64 ]; then mkdir -p ~/coin/bin/gminer_2_89_linux64; fi "
    # ssh ${TARGET} "if [ ! -d ~/coin/bin/lolMiner_v1.47_Lin64 ]; then mkdir -p ~/coin/bin/lolMiner_v1.47_Lin64; fi "
    # ssh ${TARGET} "if [ ! -d ~/coin/bin/gminer_2_90_linux64 ]; then mkdir -p ~/coin/bin/gminer_2_90_linux64; fi "
    #ssh ${TARGET} "if [ ! -d ~/coin/bin/gminer_2_91_linux64 ]; then mkdir -p ~/coin/bin/gminer_2_91_linux64; fi "
    #ssh ${TARGET} "if [ ! -d ~/coin/bin/lolMiner_v1.48_Lin64 ]; then mkdir -p ~/coin/bin/lolMiner_v1.48_Lin64; fi "
    #ssh ${TARGET} "if [ ! -d ~/coin/bin/t-rex-0.25.10-linux ]; then mkdir -p ~/coin/bin/t-rex-0.25.10-linux; fi "

    


    # scp ".\download\gminer_2_91_linux64.tar.xz" ${TARGET}:~/Downloads/
    # scp ".\download\lolMiner_v1.48_Lin64.tar.gz" ${TARGET}:~/Downloads/
    #scp ".\download\t-rex-0.25.10-linux.tar.gz" ${TARGET}:~/Downloads/
    
    #ssh ${TARGET} "if [ ! -e ~/coin/bin/gminer_2_91_linux64/miner ]; then tar xvf ~/Downloads/gminer_2_91_linux64.tar.xz -C ~/coin/bin/gminer_2_91_linux64; fi "
    #ssh ${TARGET} "if [ ! -e ~/coin/bin/lolMiner_v1.48_Lin64/1.48/lolMiner ]; then tar xvfz ~/Downloads/lolMiner_v1.48_Lin64.tar.gz -C ~/coin/bin/lolMiner_v1.48_Lin64; fi "
    #ssh ${TARGET} "if [ ! -e ~/coin/bin/t-rex-0.25.10-linux/t-rex ]; then tar xvfz ~/Downloads/t-rex-0.25.10-linux.tar.gz -C ~/coin/bin/t-rex-0.25.10-linux; fi "

    ssh ${TARGET} "sed -i -e 's/\r$//' ~/coin/bin/*.sh;chmod +x ~/coin/bin/*.sh;"




}else{
    #ssh ${TARGET} "New-Item -Force -Path .\Documents\coin\download  -ItemType Directory"

    $hostnoStr=$hostno
    if ( $hostno -lt 100 ){
        $hostnoStr="0"+$hostno
    }
    echo  " $hostnoStr -------------------------"
    ssh ${TARGET} "New-Item -Force -Path .\Documents\coin\bin  -ItemType Directory"
    scp -r ".\bin\Start-Miner.bat" ".\bin\setenv-D${hostnoStr}.bat" ${TARGET}:.\Documents\coin\bin\
    # ".\bin\miner-install.ps1"
    #ssh ${TARGET} .\Documents\coin\bin\miner-install.ps1
}