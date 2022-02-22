rem "c:\windows\system32\nvidia-smi.exe" -lgc 1550

rem ------------------ start -------------------------------- 3070ti 6way
cd NBMiner_Win
set ARG0= --log --log-no-job --api 0.0.0.0:3333 --cclock @1550 --mclock 1250
nbminer -a ethash -o stratum+ssl://%URL%  -u %USER%.%WORKER% %ARG0%
rem ------------------ start --------------------------------

pause