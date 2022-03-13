


rem ------------------ start -------------------------------- AMD  6way
cd  NBMiner_40.1_Win\NBMiner_Win
set ARG0= --log --log-no-job --api 0.0.0.0:3333 --platform AMD --strict-ssl
nbminer -a ethash -o stratum+ssl://%URL%  -u %USER%.%WORKER% %ARG0%
rem ------------------ start --------------------------------

pause