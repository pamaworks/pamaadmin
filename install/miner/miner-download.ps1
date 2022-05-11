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

# if( -not( Test-Path -path "t-rex-0.25.11-win.zip") ){
#     wget https://trex-miner.com/download/test/t-rex-0.25.11-fix-win.zip -UseBasicParsing -OutFile t-rex-0.25.11-win.zip
# }


# if( -not( Test-Path -path "t-rex-0.25.11-linux.tar.gz") ){
#     wget https://trex-miner.com/download/test/t-rex-0.25.11-linux.tar.gz  -UseBasicParsing -OutFile t-rex-0.25.11-linux.tar.gz
# }

# if( -not( Test-Path -path "t-rex-0.25.12-win.zip") ){
#     wget https://github.com/trexminer/T-Rex/releases/download/0.25.12/t-rex-0.25.12-win.zip -UseBasicParsing -OutFile t-rex-0.25.12-win.zip
# }


# if( -not( Test-Path -path "t-rex-0.25.13-win.zip") ){
#     wget https://trex-miner.com/download/test/t-rex-0.25.13-win.zip -UseBasicParsing -OutFile t-rex-0.25.13-win.zip
# }

# if( -not( Test-Path -path "t-rex-0.25.14-win.zip") ){
#     wget https://trex-miner.com/download/test/t-rex-0.25.14-win.zip -UseBasicParsing -OutFile t-rex-0.25.14-win.zip
# }

# if( -not( Test-Path -path "t-rex-0.25.15-win.zip") ){
#     wget https://github.com/trexminer/T-Rex/releases/download/0.25.15/t-rex-0.25.15-win.zip -UseBasicParsing -OutFile t-rex-0.25.15-win.zip
# }



function ScpFile {
    param (
        [string]$FileName,
        [string]$TARGET

    )
      
    $invokeCmd = "scp .\download\"+$FileName+" " + $TARGET + ":.\Documents\coin\download\"
    #결과값을 boolean 값으로 변경하자.
    $IsFileExist = ssh $TARGET "Test-Path -path .\Documents\coin\download\$FileName"

    if( $IsFileExist -eq "False" ){
        invoke-expression $invokeCmd
    }

}

function SshExpandArchive {
    param (
        [string]$FileName,
        [string]$TARGET

    )
      
    #결과값을 boolean 값으로 변경하자. NBMiner_41.0_Win.zip
    $PathName = $FileName -creplace ".zip",""
    $IsFileExist = ssh $TARGET "Test-Path -path .\Documents\coin\bin\$PathName"

    $RemoteCmd = "cd .\Documents\coin\bin;dir;Expand-Archive -Force -Path ..\..\..\Documents\coin\download\$FileName"

    
    if( $IsFileExist -eq "False" ){
        
        ssh $TARGET "$RemoteCmd"
    }

}

function Get-TRexDownload {
    param (
        [string]$FileName,
        [boolean]$IsTest
    )
    
    $Version = $FileName -creplace "t-rex-","" -creplace "-win.zip",""
    $invokeCmd = "wget https://github.com/trexminer/T-Rex/releases/download/" + $Version + "/" + $FileName + " -UseBasicParsing -OutFile " + $FileName

    if( -not( Test-Path -path $FileName) ){
        invoke-expression $invokeCmd 
    }
}

function Get-TRexTestDownload {
    param (
        [string]$FileName,
        [boolean]$IsTest
    )
    
    
    $invokeCmd = "wget https://trex-miner.com/download/test/" + $FileName + " -UseBasicParsing -OutFile " + $FileName

    if( -not( Test-Path -path $FileName) ){
        invoke-expression $invokeCmd 
    }
}
function Get-NBMinerDownload {
    param (
        [string]$FileName,
        [boolean]$IsTest
    )
    
    $Version = $FileName -creplace "NBMiner_","" -creplace "_Win.zip",""
    $invokeCmd = "wget https://github.com/NebuTech/NBMiner/releases/download/v" + $Version + "/" + $FileName + " -UseBasicParsing -OutFile " + $FileName

    if( -not( Test-Path -path $FileName) ){
        invoke-expression $invokeCmd 
    }
}

$NBminerVer="NBMiner_41.3_Win.zip"
$TrexmMnerVer="t-rex-0.26.1-win.zip"
$TrexmMnerTestVer="t-rex-0.26.1-win.zip"
# https://trex-miner.com/download/test/t-rex-0.26.1-win.zip
Get-TRexDownload -FileName $TrexmMnerVer
Get-TRexTestDownload -FileName $TrexmMnerTestVer
Get-NBMinerDownload -FileName $NBminerVer

cd ..

$hostips = "32","99","201","202","203","204","205","206","207","208"
$SandFile=$TrexmMnerVer
foreach ($hostip in $hostips) {

   $TARGET="192.168.50."+${hostip}
   echo  "${TARGET} upload------------------------------------------------------------------------------------------------------------------------------"
   # scp ".\download\*.exe" ${TARGET}:.\Documents\coin\download\
   #ssh ${TARGET} "cd .\Documents\coin\bin;dir;Expand-Archive -Force  -Path ..\..\..\Documents\coin\download\t-rex-0.25.15-win.zip"
   
    ScpFile -FileName 512.59-desktop-win10-win11-64bit-international-dch-whql.exe -TARGET $TARGET
#    ScpFile -FileName t-rex-0.25.15-win.zip -TARGET $TARGET
#    SshExpandArchive -PathName t-rex-0.25.15-win -TARGET $TARGET

   ScpFile -FileName $SandFile -TARGET $TARGET
   SshExpandArchive -FileName $SandFile -TARGET $TARGET
   
   

}

