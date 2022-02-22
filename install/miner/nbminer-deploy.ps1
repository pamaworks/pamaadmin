$DOWNURL="https://github.com/NebuTech/NBMiner/releases/download/v40.1/NBMiner_40.1_Win.zip"

$COINPATH="${env:HOMEPATH}\Documents\coin\"
cd ${COINPATH}
wget ${DOWNURL} -UseBasicParsing -OutFile NBMiner.zip
Expand-Archive -Force .\NBMiner.zip -DestinationPath '.\bin'