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

cd ..


ssh ${TARGET} "New-Item -Force -Path .\Documents\coin\download  -ItemType Directory"
scp ".\download\*.zip" ${TARGET}:.\Documents\coin\download\



ssh ${TARGET} "New-Item -Force -Path .\Documents\coin\bin  -ItemType Directory"
scp -r ".\bin\Start-Miner.bat" ".\bin\setenv-D${arg1}.bat" ".\bin\miner-install.ps1"  ${TARGET}:.\Documents\coin\bin\

ssh ${TARGET} .\Documents\coin\bin\miner-install.ps1
