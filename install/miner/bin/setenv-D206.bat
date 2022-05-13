
"c:\windows\system32\nvidia-smi.exe" -i 0,1 -lgc 950
"c:\windows\system32\nvidia-smi.exe" -i 2,3 -lgc 1450

set miner=gminer

@echo Start %miner% ............................................
goto %miner%

:: ------------------ nbminer Start--------------------------------
:nbminer
cd  %NBMinerPath%
set ARG0= --log --log-no-job --api 0.0.0.0:3333 --mclock 650,650,1100,1100 --fan 85,85,75,75
nbminer -a ethash -o stratum+ssl://%URL%  -u %USER%.%WORKER% %ARG0%
goto End
:: ------------------ nbminer End --------------------------------

:: ------------------ gminer Start--------------------------------
:gminer
cd %GminerPath%

set ARG1=  --tfan 65 --tfan_min 85 --tfan_max 99  --mclock +700 +700 +1300 +1300
set ARG2=  --log_newjob 0  --api 3333

miner.exe --algo ethash --ssl 1 --server %URL% --user %USER%.%WORKER%  %ARG1% %ARG2%
goto End
:: ------------------ gminer End --------------------------------


:: ------------------ trexminer Start--------------------------------
:trexminer
cd %TrexminerPath%
::  --lock-cv 850 --lhr-low-power 1 
t-rex.exe -a ethash -o stratum+ssl://%URL% -u %USER% -p x -w %WORKER% --api-bind-http 0.0.0.0:3333 --pl 60,60,65,65 --mclock 700,700,1300,1300  --lhr-low-power 1,1,0,0 --fan t:65[85-100]  --no-new-block-info
pause
goto End
:: ------------------ trexminer End --------------------------------

:End

pause
