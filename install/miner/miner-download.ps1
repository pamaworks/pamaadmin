$env:LC_ALL='C.UTF-8'
cd C:\Users\hyokwon.park\IdeaProjects\pamaadmin\install\miner\download



# if( -not( Test-Path -path "NBMiner_40.1_Win.zip") ){
#     wget https://github.com/NebuTech/NBMiner/releases/download/v40.1/NBMiner_40.1_Win.zip -UseBasicParsing -OutFile NBMiner_40.1_Win.zip
# }

# if( -not( Test-Path -path "gminer_2_86_windows64.zip") ){
#     wget https://github.com/develsoftware/GMinerRelease/releases/download/2.86/gminer_2_86_windows64.zip -UseBasicParsing -OutFile gminer_2_86_windows64.zip
# }

# if( -not( Test-Path -path "gminer_2_89_windows64.zip") ){
#     wget https://github.com/develsoftware/GMinerRelease/releases/download/2.89/gminer_2_89_windows64.zip -UseBasicParsing -OutFile gminer_2_89_windows64.zip
# }

# if( -not( Test-Path -path "gminer_2_74_windows64.zip") ){
#     wget https://github.com/develsoftware/GMinerRelease/releases/download/2.74/gminer_2_74_windows64.zip -UseBasicParsing -OutFile gminer_2_74_windows64.zip
# }

# if( -not( Test-Path -path "gminer_2_89_linux64.tar.xz") ){
#     wget https://github.com/develsoftware/GMinerRelease/releases/download/2.89/gminer_2_89_linux64.tar.xz -UseBasicParsing -OutFile gminer_2_89_linux64.tar.xz
# }

# if( -not( Test-Path -path "gminer_2_90_windows64.zip") ){
#     wget https://github.com/develsoftware/GMinerRelease/releases/download/2.90/gminer_2_90_windows64.zip -UseBasicParsing -OutFile gminer_2_90_windows64.zip
# }

# if( -not( Test-Path -path "gminer_2_90_linux64.tar.xz") ){
#     wget https://github.com/develsoftware/GMinerRelease/releases/download/2.90/gminer_2_90_linux64.tar.xz -UseBasicParsing -OutFile gminer_2_90_linux64.tar.xz
# }

# if( -not( Test-Path -path "gminer_2_91_windows64.zip") ){
#     wget https://github.com/develsoftware/GMinerRelease/releases/download/2.91/gminer_2_91_windows64.zip -UseBasicParsing -OutFile gminer_2_91_windows64.zip
# }

# if( -not( Test-Path -path "gminer_2_91_linux64.tar.xz") ){
#     wget https://github.com/develsoftware/GMinerRelease/releases/download/2.91/gminer_2_91_linux64.tar.xz -UseBasicParsing -OutFile gminer_2_91_linux64.tar.xz
# }

# if( -not( Test-Path -path "lolMiner_v1.47_Lin64.tar.gz") ){
#     wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.47/lolMiner_v1.47_Lin64.tar.gz -UseBasicParsing -OutFile lolMiner_v1.47_Lin64.tar.gz
# }

# if( -not( Test-Path -path "lolMiner_v1.48_Lin64.tar.gz") ){
#     wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.48/lolMiner_v1.48_Lin64.tar.gz -UseBasicParsing -OutFile lolMiner_v1.48_Lin64.tar.gz
# }

# if( -not( Test-Path -path "lolMiner_v1.48_Win64.zip") ){
#     wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.48/lolMiner_v1.48_Win64.zip -UseBasicParsing -OutFile lolMiner_v1.48_Win64.zip
# }

# if( -not( Test-Path -path "t-rex-0.25.9-win.zip") ){
#     wget https://github.com/trexminer/T-Rex/releases/download/0.25.9/t-rex-0.25.9-win.zip -UseBasicParsing -OutFile t-rex-0.25.9-win.zip
# }

# if( -not( Test-Path -path "t-rex-0.25.10-win.zip") ){
#     wget https://trex-miner.com/download/test/t-rex-0.25.10-win.zip -UseBasicParsing -OutFile t-rex-0.25.10-win.zip
# }

# if( -not( Test-Path -path "t-rex-0.25.10-linux.tar.gz") ){
#     wget https://trex-miner.com/download/test/t-rex-0.25.10-linux.tar.gz  -UseBasicParsing -OutFile t-rex-0.25.10-linux.tar.gz
# }

if( -not( Test-Path -path "t-rex-0.25.11-win.zip") ){
    wget https://trex-miner.com/download/test/t-rex-0.25.11-fix-win.zip -UseBasicParsing -OutFile t-rex-0.25.11-win.zip
}


if( -not( Test-Path -path "t-rex-0.25.11-linux.tar.gz") ){
    wget https://trex-miner.com/download/test/t-rex-0.25.11-linux.tar.gz  -UseBasicParsing -OutFile t-rex-0.25.11-linux.tar.gz
}

}


if( -not( Test-Path -path "t-rex-0.25.13-win.zip") ){
    wget https://trex-miner.com/download/test/t-rex-0.25.13-win.zip -UseBasicParsing -OutFile t-rex-0.25.13-win.zip
}




cd ..
$hostips = "32","99","201","202","203","205","206","207","208"
foreach ($hostip in $hostips)
{
    $TARGET="192.168.50."+${hostip}
    echo  "${TARGET} upload------------------------------------------------------------------------------------------------------------------------------"
    # scp ".\download\*.exe" ${TARGET}:.\Documents\coin\download\

   #scp "./download/t-rex-0.25.11-win.zip" ${TARGET}:.\Documents\coin\download\
   #scp "./download/t-rex-0.25.12-win.zip" ${TARGET}:.\Documents\coin\download\
   #scp "./download/t-rex-0.25.13-win.zip" ${TARGET}:.\Documents\coin\download\

   ssh ${TARGET} "cd .\Documents\coin\bin;dir;Expand-Archive -Force  -Path ..\..\..\Documents\coin\download\t-rex-0.25.13-win.zip"

}
