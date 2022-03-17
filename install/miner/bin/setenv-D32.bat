
"c:\windows\system32\nvidia-smi.exe" -lgc 1450

set miner=gminer
@echo Start %miner% ............................................
goto %miner%

:: ------------------ nbminer Start--------------------------------
:nbminer
cd  %HOMEPATH%\Documents\coin\bin\NBMiner_40.1_Win\NBMiner_Win
set ARG0= --log --log-no-job --api 0.0.0.0:3333 --mclock 1240 --fan 75
nbminer -a ethash -o stratum+ssl://%URL%  -u %USER%.%WORKER% %ARG0%
goto End
:: ------------------ nbminer End --------------------------------

:: ------------------ gminer Start--------------------------------
:gminer
cd %HOMEPATH%\Documents\coin\bin\gminer_2_89_windows64

set ARG1=  --templimit 80 --tfan 65 --tfan_min 65 --tfan_max 99  --mclock +850
set ARG2=  --log_newjob 0  --api 3333

miner.exe --algo ethash --ssl 1 --server %URL% --user %USER%.%WORKER%  %ARG1% %ARG2%
goto End
:: ------------------ gminer End --------------------------------

:End

pause