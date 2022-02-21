
$COINPATH="${env:HOMEPATH}\Documents\coin\"
cd ${COINPATH}

if (Test-Path ".\telegraf\telegraf.exe") {
 .\telegraf\telegraf.exe --service stop
 .\telegraf\telegraf.exe --service uninstall
  echo "stop and uninstall"
}



wget https://dl.influxdata.com/telegraf/releases/telegraf-1.21.4_windows_amd64.zip -UseBasicParsing -OutFile telegraf.zip
Expand-Archive -Force .\telegraf.zip -DestinationPath '.\telegraf'
copy -Force '.\telegraf\telegraf-1.21.4\telegraf.exe' '.\telegraf\'
move -Force '.\telegraf.conf' '.\telegraf\'

.\telegraf\telegraf.exe --service install --config "${COINPATH}\telegraf\telegraf.conf"

.\telegraf\telegraf.exe --service start