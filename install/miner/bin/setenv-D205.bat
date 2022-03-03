
cd  NBMiner_40.1_Win\NBMiner_Win

rem ------------------ start -------------------------------- 3060ti 6way
set ARG0= --log --log-no-job --api 0.0.0.0:3333 --cclock @1450 --mclock 1280 --strict-ssl --fan 80
nbminer -a ethash -o stratum+ssl://%URL%  -u %USER%.%WORKER% %ARG0%
rem ------------------ start --------------------------------

pause