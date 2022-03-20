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


cd ..

if ( $hostno -eq "151" ){
    ssh ${TARGET} "mkdir -p ~/Downloads"
    scp -r ".\bin\Start-Miner.sh" ".\bin\setenv-D${hostno}.sh"  ${TARGET}:~/coin/bin/
    
    ssh ${TARGET} "mkdir -p ~/coin/bin/gminer_2_89_linux64;sed -i -e 's/\r$//' ~/coin/bin/*.sh;"

    scp ".\download\*.tar.*" ${TARGET}:~/Downloads/
    ssh ${TARGET} "if [ ! -e ~/coin/bin/gminer_2_89_linux64/miner ]; then tar xvf ~/Downloads/gminer_2_89_linux64.tar.xz -C ~/coin/bin/gminer_2_89_linux64; fi "
    




}else{
    ssh ${TARGET} "New-Item -Force -Path .\Documents\coin\download  -ItemType Directory"
    scp ".\download\*.zip" ${TARGET}:.\Documents\coin\download\

    ssh ${TARGET} "New-Item -Force -Path .\Documents\coin\bin  -ItemType Directory"
    scp -r ".\bin\Start-Miner.bat" ".\bin\setenv-D${hostno}.bat" ".\bin\miner-install.ps1"  ${TARGET}:.\Documents\coin\bin\

    ssh ${TARGET} .\Documents\coin\bin\miner-install.ps1
}