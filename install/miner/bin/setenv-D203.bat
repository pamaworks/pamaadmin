
"c:\windows\system32\nvidia-smi.exe" -lgc 1100

set miner=gminer
@echo Start %miner% ............................................
goto %miner%

:: ------------------ nbminer Start--------------------------------
:nbminer
cd  %NBMinerPath%
set ARG0= --log --log-no-job --api 0.0.0.0:3333 --mclock 1250 --fan 75
nbminer -a ethash -o stratum+ssl://%URL%  -u %USER%.%WORKER% %ARG0%
goto End
:: ------------------ nbminer End --------------------------------

:: ------------------ gminer Start--------------------------------
:gminer
cd %GminerPath%

set ARG1=  --tfan 60 --tfan_min 65 --tfan_max 99 --mclock +1200 --lhr_mode 0
set ARG2=  --log_newjob 0  --api 3333

miner.exe  --algo ethash --ssl 1 --server %URL% --user %USER%.%WORKER%  %ARG1% %ARG2%
goto End
:: ------------------ gminer End --------------------------------


:: ------------------ gminer Start--------------------------------
:gminerETC
cd %GminerPath%

set ARG1=  --templimit 80 --tfan 60 --tfan_min 85 --tfan_max 99  --mclock +1250
set ARG2=  --log_newjob 0  --api 3333

miner.exe --algo etchash --ssl 1 --server %URLETC% --user %USERETC%.%WORKER%  %ARG1% %ARG2%
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

t-rex.exe -a ethash -o stratum+ssl://%URL% -u %USER% -p x -w %WORKER% --api-bind-http 0.0.0.0:3333 --mclock 1250  --fan t:65[65-100]

goto End
:: ------------------ trexminer End --------------------------------


:End

exit


