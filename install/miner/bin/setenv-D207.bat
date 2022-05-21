@REM "c:\windows\system32\nvidia-smi.exe" -i 0,2,3,4 -lgc 900
@REM "c:\windows\system32\nvidia-smi.exe" -i 1,5 -lgc 800
"c:\windows\system32\nvidia-smi.exe" -lgc 700

set miner=gminer

@echo Start %miner% ............................................
goto %miner%

:: ------------------ nbminer Start--------------------------------
:nbminer

cd  %NBMinerPath%
set ARG0= --log --log-no-job --api 0.0.0.0:3333 --mclock 800,800,800,800,800,800 --fan 95,95,95,95,95,95
nbminer -a ethash -o stratum+ssl://%URL%  -u %USER%.%WORKER% %ARG0%
goto End
:: ------------------ nbminer End --------------------------------

:: ------------------ gminer Start--------------------------------
:gminer

cd %GminerPath%

set ARG1=  --tfan 65 --tfan_min 85 --tfan_max 99 --pl 55 --lhr_mode 0 --mclock +900 +800 +900 +900 +900 +500
set ARG2=  --log_newjob 0  --api 3333

miner.exe --algo ethash --ssl 1 --server %URL% --user %USER%.%WORKER%  %ARG1% %ARG2%
goto End
:: ------------------ gminer End --------------------------------

:: ------------------ lolminer Start--------------------------------
:lolminer
cd %LolMinerPath%

lolMiner.exe --algo ETHASH --pool stratum+ssl://%URL% --user  %USER%.%WORKER% --apiport 3333 --apihost 0.0.0.0 
goto End
:: ------------------ lolminer End --------------------------------

:: ------------------ trexminer Start--------------------------------
:trexminer
cd %TrexminerPath%
::  --lock-cv 850
t-rex.exe -a ethash -o stratum+ssl://%URL% -u %USER% -p x -w %WORKER% --api-bind-http 0.0.0.0:3333 --mclock 1050,800,1050,1050,1050,800  --lhr-low-power 0,1,0,0,0,1 --fan t:65[85-100]  --no-new-block-info
pause
goto End
:: ------------------ trexminer End --------------------------------

:End

pause