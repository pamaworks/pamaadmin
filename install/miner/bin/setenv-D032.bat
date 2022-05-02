
"c:\windows\system32\nvidia-smi.exe" -i 0,2 -lgc 1300

set miner=trexminer
@echo Start %miner% ............................................
goto %miner%

:: ------------------ nbminer Start--------------------------------
:nbminer
cd  %NBMinerPath%
set ARG0= --log --log-no-job --api 0.0.0.0:3333 --mclock 1240 --fan 75
nbminer -a ethash -o stratum+ssl://%URL%  -u %USER%.%WORKER% %ARG0%
goto End
:: ------------------ nbminer End --------------------------------

:: ------------------ gminer Start--------------------------------
:gminer
cd %GminerPath%

set ARG1=  --templimit 80 --tfan 65 --tfan_min 65 --tfan_max 99  --mclock +1250
set ARG2=  --log_newjob 0  --api 3333

miner.exe --algo ethash --ssl 1 --server %URL% --user %USER%.%WORKER%  %ARG1% %ARG2%
goto End
:: ------------------ gminer End --------------------------------

:: ------------------ lolminer Start--------------------------------
:lolminer
cd %LolMinerPath%

lolMiner.exe --algo ETHASH --pool stratum+ssl://%URL% --user  %USER%.%WORKER%  --apiport 3333 --apihost 0.0.0.0 
goto End
:: ------------------ lolminer End --------------------------------

:: ------------------ trexminer Start--------------------------------
:trexminer
cd %TrexminerPath%

t-rex.exe -d 0,2 -a ethash -o stratum+ssl://%URL% -u %USER% -p x -w %WORKER% --lhr-low-power --api-bind-http 0.0.0.0:3333 --mclock 750 --lock-cv 750 --fan t:65[85-100]
pause
goto End
:: ------------------ trexminer End --------------------------------

:End

pause