$env:LC_ALL='C.EUC-KR'

$hostips = 25,207,99,201,202,203,204,205,206,208

foreach ($hostip in $hostips) {
   $TARGET="192.168.50."+${hostip}
   if ( $hostip -ne 32 ){
    ssh ${TARGET} "taskkill /F /IM miner.exe /IM cmd.exe;shutdown /r /t 360;"
   }
   TIMEOUT 3 
}

#cmd.exe /C start /realtime C:\Users\user\Documents\coin\bin\Start-Miner.bat
#cmd.exe /c start /realtime dir