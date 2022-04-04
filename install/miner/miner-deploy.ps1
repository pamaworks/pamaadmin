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

#초기 세팅

cd download

if( -not( Test-Path -path "NBMiner_40.1_Win.zip") ){
    wget https://github.com/NebuTech/NBMiner/releases/download/v40.1/NBMiner_40.1_Win.zip -UseBasicParsing -OutFile NBMiner_40.1_Win.zip
}

if( -not( Test-Path -path "gminer_2_86_windows64.zip") ){
    wget https://github.com/develsoftware/GMinerRelease/releases/download/2.86/gminer_2_86_windows64.zip -UseBasicParsing -OutFile gminer_2_86_windows64.zip
}

if( -not( Test-Path -path "gminer_2_89_windows64.zip") ){
    wget https://github.com/develsoftware/GMinerRelease/releases/download/2.89/gminer_2_89_windows64.zip -UseBasicParsing -OutFile gminer_2_89_windows64.zip
}

if( -not( Test-Path -path "gminer_2_74_windows64.zip") ){
    wget https://github.com/develsoftware/GMinerRelease/releases/download/2.74/gminer_2_74_windows64.zip -UseBasicParsing -OutFile gminer_2_74_windows64.zip
}

if( -not( Test-Path -path "gminer_2_89_linux64.tar.xz") ){
    wget https://github.com/develsoftware/GMinerRelease/releases/download/2.89/gminer_2_89_linux64.tar.xz -UseBasicParsing -OutFile gminer_2_89_linux64.tar.xz
}

if( -not( Test-Path -path "gminer_2_90_windows64.zip") ){
    wget https://github.com/develsoftware/GMinerRelease/releases/download/2.90/gminer_2_90_windows64.zip -UseBasicParsing -OutFile gminer_2_90_windows64.zip
}

if( -not( Test-Path -path "gminer_2_90_linux64.tar.xz") ){
    wget https://github.com/develsoftware/GMinerRelease/releases/download/2.90/gminer_2_90_linux64.tar.xz -UseBasicParsing -OutFile gminer_2_90_linux64.tar.xz
}

if( -not( Test-Path -path "gminer_2_91_windows64.zip") ){
    wget https://github.com/develsoftware/GMinerRelease/releases/download/2.91/gminer_2_91_windows64.zip -UseBasicParsing -OutFile gminer_2_91_windows64.zip
}

if( -not( Test-Path -path "gminer_2_91_linux64.tar.xz") ){
    wget https://github.com/develsoftware/GMinerRelease/releases/download/2.91/gminer_2_91_linux64.tar.xz -UseBasicParsing -OutFile gminer_2_91_linux64.tar.xz
}

if( -not( Test-Path -path "lolMiner_v1.47_Lin64.tar.gz") ){
    wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.47/lolMiner_v1.47_Lin64.tar.gz -UseBasicParsing -OutFile lolMiner_v1.47_Lin64.tar.gz
}

if( -not( Test-Path -path "lolMiner_v1.48_Lin64.tar.gz") ){
    wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.48/lolMiner_v1.48_Lin64.tar.gz -UseBasicParsing -OutFile lolMiner_v1.48_Lin64.tar.gz
}

if( -not( Test-Path -path "lolMiner_v1.48_Win64.zip") ){
    wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.48/lolMiner_v1.48_Win64.zip -UseBasicParsing -OutFile lolMiner_v1.48_Win64.zip
}

cd ..

if ( $hostno -eq "204" ){
    
    ssh ${TARGET} "if [ ! -d ~/Downloads/ ]; then mkdir -p ~/Downloads; fi "
    ssh ${TARGET} "if [ ! -d ~/coin/bin/ ]; then mkdir -p ~/coin/bin/; fi "

    scp -r ".\bin\Start-Miner204.sh"  ${TARGET}:~/coin/bin/
    

    # ssh ${TARGET} "if [ ! -d ~/coin/bin/gminer_2_89_linux64 ]; then mkdir -p ~/coin/bin/gminer_2_89_linux64; fi "
    # ssh ${TARGET} "if [ ! -d ~/coin/bin/lolMiner_v1.47_Lin64 ]; then mkdir -p ~/coin/bin/lolMiner_v1.47_Lin64; fi "
    # ssh ${TARGET} "if [ ! -d ~/coin/bin/gminer_2_90_linux64 ]; then mkdir -p ~/coin/bin/gminer_2_90_linux64; fi "
    ssh ${TARGET} "if [ ! -d ~/coin/bin/gminer_2_91_linux64 ]; then mkdir -p ~/coin/bin/gminer_2_91_linux64; fi "
    ssh ${TARGET} "if [ ! -d ~/coin/bin/lolMiner_v1.48_Lin64 ]; then mkdir -p ~/coin/bin/lolMiner_v1.48_Lin64; fi "


    # scp ".\download\gminer_2_91_linux64.tar.xz" ${TARGET}:~/Downloads/
    # scp ".\download\lolMiner_v1.48_Lin64.tar.gz" ${TARGET}:~/Downloads/
    ssh ${TARGET} "if [ ! -e ~/coin/bin/gminer_2_91_linux64/miner ]; then tar xvf ~/Downloads/gminer_2_91_linux64.tar.xz -C ~/coin/bin/gminer_2_91_linux64; fi "
    ssh ${TARGET} "if [ ! -e ~/coin/bin/lolMiner_v1.48_Lin64/1.48/lolMiner ]; then tar xvfz ~/Downloads/lolMiner_v1.48_Lin64.tar.gz -C ~/coin/bin/lolMiner_v1.48_Lin64; fi "

    ssh ${TARGET} "sed -i -e 's/\r$//' ~/coin/bin/*.sh;chmod +x ~/coin/bin/*.sh;"




}else{
    ssh ${TARGET} "New-Item -Force -Path .\Documents\coin\download  -ItemType Directory"
    scp ".\download\*.zip" ${TARGET}:.\Documents\coin\download\
    scp ".\download\*.exe" ${TARGET}:.\Documents\coin\download\


    ssh ${TARGET} "New-Item -Force -Path .\Documents\coin\bin  -ItemType Directory"
    scp -r ".\bin\Start-Miner.bat" ".\bin\setenv-D${hostno}.bat" ".\bin\miner-install.ps1"  ${TARGET}:.\Documents\coin\bin\

    ssh ${TARGET} .\Documents\coin\bin\miner-install.ps1
}