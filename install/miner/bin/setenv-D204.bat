$VER="40.1"

rem ------------------ start --------------------------------
cd ${VER}\NBMiner_Win
set ARG0= --log --log-no-job --api 0.0.0.0:3333 --cclock @1120,@1120,@1120,@1350,@1350,@1350 --mclock 1240,1240,1240,850,850,850 --fan 75,75,75,85,85,85
nbminer -a ethash -o stratum+ssl://%URL%  -u %USER%.%WORKER% %ARG0%
rem ------------------ start --------------------------------

pause