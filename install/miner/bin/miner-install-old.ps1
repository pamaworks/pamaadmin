$env:LC_ALL='C.UTF-8'
$arg1=$args[0]
$arg2=$args[1]
$minername=$arg1

if ( $minername ){
    echo "${minername} install start ...."
}else{
    echo "Miner name is not invalid"
    Exit
}

$COINBINPATH="${env:HOMEPATH}\Documents\coin\bin"
cd ${COINBINPATH}


if( $minername -eq "nbminer" ){
    $VER="40.1"

    $DOWNURL="https://github.com/NebuTech/NBMiner/releases/download/v40.1/NBMiner_40.1_Win.zip"
    wget ${DOWNURL} -UseBasicParsing -OutFile NBMiner_40.1_Win.zip
    Expand-Archive -Force .\NBMiner_40.1_Win.zip

}
elseif( $minername -eq "gminer" ){

    $DOWNURL="https://github.com/develsoftware/GMinerRelease/releases/download/2.89/gminer_2_89_windows64.zip"
    wget ${DOWNURL} -UseBasicParsing -OutFile gminer_2_89_windows64.zip
    Expand-Archive -Force .\gminer_2_89_windows64.zip

}

echo "${minername} install complete ...."