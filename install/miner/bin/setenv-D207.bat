"c:\windows\system32\nvidia-smi.exe" -i 0 -lgc 800
"c:\windows\system32\nvidia-smi.exe" -i 1,2 -lgc 1200


set miner=gminer

@echo Start %miner% ............................................
goto %miner%


:: ------------------ gminer Start--------------------------------
:gminer

cd %GminerPath%

set ARG1=  --tfan 65 --tfan_min 85 --tfan_max 99 --mclock +700 +600 +600
set ARG2=  --log_newjob 0  --api 3333

miner.exe --algo ethash --ssl 1 --server %URL% --user %USER%.%WORKER%  %ARG1% %ARG2%
goto End
:: ------------------ gminer End --------------------------------



:End

pause