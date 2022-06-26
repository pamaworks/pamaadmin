:: Begin.cmd 마이너 제어 배치 프로그램


 

@ECHO OFF

::현재 시간 및 분 구하기
set /a hour=%time:~0,2%
set /a min=%time:~3,2%

 

::오후 3시라면 현재 분을 체크하기 위해 standBy로 이동해라
echo %hour%
@REM if %hour% EQU 15 goto standBy

 

:loop
cd %homepath%\Documents\coin\bin
cmd.exe /c start /realtime Start-Miner.bat

timeout /T 3300
taskkill /F /IM miner.exe 
timeout /T 10

goto loop

 

@REM :standBy
@REM ::현재 분이 10분 보다 작거나 같다면, 10분 기다려라, 그렇지 않으면 loop로 이동해서 바로 마이닝을 시작하라.
@REM echo %min%
@REM if %min% LEQ 10 timeout /T 600
@REM goto loop