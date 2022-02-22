ssh 192.168.50.209 ls C:\Users\user\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\


set USER=0x8d1f3496a1f267c4b486ad6520a4729ef1ef04b5
set URL=asia1.ethermine.org:5555
set WORKER=%DEVICEID%

cd C:\Users\user\Documents\coin\gminer_2_75_windows64



::--cclock 900 900 1200 1200
set ARG1=  --tfan 65 --tfan_min 85 --tfan_max 100  --mclock 1900 1900 2200 2200
set ARG2=  --log_newjob 0  --api 3333

miner.exe --algo ethash --ssl 1 --server %URL% --user %USER%.%WORKER%  %ARG1% %ARG2%

