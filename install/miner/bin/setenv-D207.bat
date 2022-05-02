"c:\windows\system32\nvidia-smi.exe" -lgc 900

set miner=gminer

@echo Start %miner% ............................................
goto %miner%

:: ------------------ nbminer Start--------------------------------
:nbminer

cd  %NBMinerPath%
set ARG0= --log --log-no-job --api 0.0.0.0:3333 --mclock 1200 --fan 80
nbminer -a ethash -o stratum+ssl://%URL%  -u %USER%.%WORKER% %ARG0%
goto End
:: ------------------ nbminer End --------------------------------

:: ------------------ gminer Start--------------------------------
:gminer

cd %GminerPath%

set ARG1=  --tfan 65 --tfan_min 80 --tfan_max 99 --mclock +1100 +1100 +1100 +1100 +1100 +900
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
t-rex.exe -a ethash -o stratum+ssl://%URL% -u %USER% -p x -w %WORKER% --api-bind-http 0.0.0.0:3333 --mclock 1100,1100,1100,1100,1100,900  --lhr-low-power --lock-cv 850 --fan t:65[85-100]  --no-new-block-info --gpu-report-interval 10
pause
goto End
:: ------------------ trexminer End --------------------------------

:End

pause