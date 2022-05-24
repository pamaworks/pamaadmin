$env:LC_ALL='C.UTF-8'
cd C:\Users\hyokwon.park\IdeaProjects\pamaadmin\install\miner\download

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

    $RemoteCmd = "cd .\Documents\coin\bin;Expand-Archive -Force -Path ..\..\..\Documents\coin\download\$FileName"

    
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

function Get-GMinerDownload {
    param (
        [string]$FileName,
        [boolean]$IsTest
    )
    $Version = $FileName -creplace "gminer_","" -creplace "_windows64.zip","" -creplace "_","."
    $invokeCmd = "wget https://github.com/develsoftware/GMinerRelease/releases/download/" + $Version + "/" + $FileName + " -UseBasicParsing -OutFile " + $FileName

    if( -not( Test-Path -path $FileName) ){
        invoke-expression $invokeCmd 
    }
}


$NBminerVer="NBMiner_41.3_Win.zip"
$TrexmMnerVer="t-rex-0.26.1-win.zip"
$TrexmMnerTestVer="t-rex-0.26.1-win.zip"
$GMinerVer="gminer_2_96_windows64.zip"


# https://trex-miner.com/download/test/t-rex-0.26.1-win.zip
Get-TRexDownload -FileName $TrexmMnerVer
Get-TRexTestDownload -FileName $TrexmMnerTestVer
Get-NBMinerDownload -FileName $NBminerVer
Get-GMinerDownload -FileName $GMinerVer

cd ..

$hostips = 25,32,99,201,202,203,204,205,206,207,208
$SandFile=$GMinerVer
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


   $hostnoStr=$hostip
   if ( $hostip -lt 100 ){
       $hostnoStr="0"+$hostip
   }
   echo  " $hostnoStr -------------------------"
   ssh ${TARGET} "New-Item -Force -Path .\Documents\coin\bin  -ItemType Directory"
   scp -r ".\bin\Start-Miner.bat" ".\bin\setenv-D${hostnoStr}.bat" ${TARGET}:.\Documents\coin\bin\

}

