::set USER=0x8d1f3496a1f267c4b486ad6520a4729ef1ef04b5
set USER=0x598405Aaca51850710f15d30336b33194F0Cd528
set URL=asia2.ethermine.org:5555

::set USERETC=0x4b949174f00c179c93ffa8e31635e383520d6ea4
set USERETC=0x598405Aaca51850710f15d30336b33194F0Cd528
set URLETC=asia1-etc.ethermine.org:5555

set WORKER=%DEVICEID%

set NBMinerPath=%HOMEPATH%\Documents\coin\bin\NBMiner_40.1_Win\NBMiner_Win
set GminerPath=%HOMEPATH%\Documents\coin\bin\gminer_2_91_windows64
set LolMinerPath=%HOMEPATH%\Documents\coin\bin\lolMiner_v1.48_Win64\1.48

cd %homepath%\Documents\coin\bin
TIMEOUT 30
.\setenv-D%DEVICEID%.bat