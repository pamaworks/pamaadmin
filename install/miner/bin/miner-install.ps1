$env:LC_ALL='C.UTF-8'

$COINBINPATH="${env:HOMEPATH}\Documents\coin\bin"
$DOWNLOADPATH="${env:HOMEPATH}\Documents\coin\download"
cd ${COINBINPATH}

if ( -not (Test-Path -Path "NBMiner_40.1_Win") )  {
    Expand-Archive -Force  -Path ${DOWNLOADPATH}\NBMiner_40.1_Win.zip
}

if ( -not (Test-Path -Path "gminer_2_86_windows64") )  {
    Expand-Archive -Force  -Path ${DOWNLOADPATH}\gminer_2_86_windows64.zip
}

if ( -not (Test-Path -Path "gminer_2_89_windows64"))  {
    Expand-Archive -Force  -Path ${DOWNLOADPATH}\gminer_2_89_windows64.zip
}

if ( -not (Test-Path -Path "gminer_2_74_windows64"))  {
    Expand-Archive -Force  -Path ${DOWNLOADPATH}\gminer_2_74_windows64.zip
}

echo "${minername} install complete ...."
