"c:\windows\system32\nvidia-smi.exe" -lgc 1450

rem ------------------ start -------------------------------- 3070ti 6way
cd NBMiner_Win
set ARG0= --log --log-no-job --api 0.0.0.0:3333
nbminer -a ethash -o stratum+ssl://%URL%  -u %USER%.%WORKER% %ARG0%
rem ------------------ start --------------------------------

pause