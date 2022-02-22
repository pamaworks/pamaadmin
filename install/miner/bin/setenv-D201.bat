

rem ------------------ start -------------------------------- 3070 6way
cd NBMiner_Win
set ARG0= --log --log-no-job --api 0.0.0.0:3333 --cclock @1120 --mclock 1240
nbminer -a ethash -o stratum+ssl://%URL%  -u %USER%.%WORKER% %ARG0%
rem ------------------ start --------------------------------

pause