
rem ------------------ start -------------------------------- --mclock 1900 1900 2200 2200
cd NBMiner_Win
set ARG0= --log --log-no-job --api 0.0.0.0:3333 
nbminer -a ethash -o stratum+ssl://%URL%  -u %USER%.%WORKER% %ARG0%
rem ------------------ start --------------------------------

pause