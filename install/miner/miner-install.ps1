$env:LC_ALL='C.UTF-8'

$COINBINPATH="${env:HOMEPATH}\Documents\coin\bin"
$DOWNLOADPATH="${env:HOMEPATH}\Documents\coin\download"
cd ${COINBINPATH}

if ( -not (Test-Path -Path "NBMiner_40.1_Win") )  {
    Expand-Archive -Force  -Path ${DOWNLOADPATH}\NBMiner_40.1_Win.zip
}

# if ( -not (Test-Path -Path "gminer_2_86_windows64") )  {
#     Expand-Archive -Force  -Path ${DOWNLOADPATH}\gminer_2_86_windows64.zip
# }

# if ( -not (Test-Path -Path "gminer_2_74_windows64"))  {
#     Expand-Archive -Force  -Path ${DOWNLOADPATH}\gminer_2_74_windows64.zip
# }

# if ( -not (Test-Path -Path "gminer_2_89_windows64"))  {
#     Expand-Archive -Force  -Path ${DOWNLOADPATH}\gminer_2_89_windows64.zip
# }

# if ( -not (Test-Path -Path "gminer_2_90_windows64"))  {
#     Expand-Archive -Force  -Path ${DOWNLOADPATH}\gminer_2_90_windows64.zip
# }

if ( -not (Test-Path -Path "gminer_2_91_windows64"))  {
    Expand-Archive -Force  -Path ${DOWNLOADPATH}\gminer_2_91_windows64.zip
}

if ( -not (Test-Path -Path "lolMiner_v1.48_Win64"))  {
    Expand-Archive -Force  -Path ${DOWNLOADPATH}\lolMiner_v1.48_Win64.zip
}

if ( -not (Test-Path -Path "t-rex-0.25.10-win"))  {
    Expand-Archive -Force  -Path ${DOWNLOADPATH}\t-rex-0.25.10-win.zip
}

if ( -not (Test-Path -Path "t-rex-0.25.11-win"))  {
    Expand-Archive -Force  -Path ${DOWNLOADPATH}\t-rex-0.25.11-win.zip
}

if ( -not (Test-Path -Path "t-rex-0.25.12-win"))  {
    Expand-Archive -Force  -Path ${DOWNLOADPATH}\t-rex-0.25.12-win.zip
}

echo "${minername} install complete ...."
