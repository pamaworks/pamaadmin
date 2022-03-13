"c:\windows\system32\nvidia-smi.exe" -i 0,1,2 -lgc 1125
"c:\windows\system32\nvidia-smi.exe" -i 3,4 -lgc 1300

set miner=gminer
@echo Start %miner% ............................................
goto %miner%

:: ------------------ nbminer Start--------------------------------
:nbminer
cd  C:\Users\user\Documents\coin\bin\NBMiner_40.1_Win\NBMiner_Win
set ARG0= --log --log-no-job --api 0.0.0.0:3333 --mclock 1240,1240,1240,850,850 --fan 75,75,75,85,85
nbminer -a ethash -o stratum+ssl://%URL%  -u %USER%.%WORKER% %ARG0%
goto End
:: ------------------ nbminer End --------------------------------

:: ------------------ gminer Start--------------------------------
:gminer
cd C:\Users\user\Documents\coin\bin\gminer_2_83_windows64

set ARG1=  --templimit 80 --tfan 60 --tfan_min 75 75 75 85 85   --tfan_max 99  --mclock +1250 +1250 +1250 +800 +800
set ARG2=  --log_newjob 0  --api 3333

miner.exe --algo ethash --ssl 1 --server %URL% --user %USER%.%WORKER%  %ARG1% %ARG2%
goto End
:: ------------------ gminer End --------------------------------

:End

pause