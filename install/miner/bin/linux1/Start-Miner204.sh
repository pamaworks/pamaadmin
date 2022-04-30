#!/bin/bash

### BEGIN INIT INFO
# Provides:             startmine
# Required-Start:       $remote_fs $syslog
# Required-Stop:        $remote_fs $syslog
# Default-Start:        2 3 4 5
# Default-Stop:
# Short-Description:    minerserver
### END INIT INF

#USER=0x8d1f3496a1f267c4b486ad6520a4729ef1ef04b5 #upbit
#export USERETH=0x4A7eA146e484AD37Df41E6eC1104c5E5E29e9403 #metamask L2 Polygon
export USERETH=0x598405Aaca51850710f15d30336b33194F0Cd528 #metamask 
export URLETH=asia2.ethermine.org:5555

#USERETC=0x4b949174f00c179c93ffa8e31635e383520d6ea4
#export USERETC=0x4A7eA146e484AD37Df41E6eC1104c5E5E29e9403 #metamask L2 Polygon
export USERETC=0x598405Aaca51850710f15d30336b33194F0Cd528 #metamask 
export URLETC=asia1-etc.ethermine.org:5555

export WORKER=D204

gminer(){
    export DAEMONPATH=/home/ubuntu/coin/bin/gminer_2_91_linux64
    export DAEMON=miner
    export DAEMONOPT=" --algo ethash --ssl 1 --server $URLETH  --user $USERETH.$WORKER   --log_newjob 0  --api 3333 --logfile gminer.log" 
}

lolminer(){
 export DAEMONPATH=/home/ubuntu/coin/bin/lolMiner_v1.48_Lin64/1.48
 export DAEMON=lolMiner
 export DAEMONOPT=" --algo ETHASH --pool stratum+ssl://$URLETH --user  $USERETH.$WORKER --apiport 3333 --apihost 0.0.0.0  " 
}

trexminer(){
 export DAEMONPATH=/home/ubuntu/coin/bin/t-rex-0.25.10-linux
 export DAEMON=t-rex
 export DAEMONOPT=" -d 0,1,2,3 -a ethash -o stratum+ssl://$URLETH -u $USERETH -p x -w $WORKER --api-bind-http 0.0.0.0:3333 --log-path  /home/ubuntu/coin/bin/t-rex-0.25.10-linux/t-rex.log  " 
}


nvs() {
    sudo nvidia-xconfig --enable-all-gpus
    sudo nvidia-xconfig --cool-bits=28

    sudo nvidia-smi -pm 1
    sudo nvidia-smi -i 0,1,2,3 -lgc 1125
    sudo nvidia-smi -i 4,5 -lgc 1200

    sudo xinit /usr/bin/nvidia-settings \
    -a  [gpu:0]/GpuPowerMizerMode=1 -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=75   -a [fan:1]/GPUTargetFanSpeed=75   -a [gpu:0]/GPUMemoryTransferRateOffset[4]=2480 \
    -a  [gpu:1]/GpuPowerMizerMode=1 -a [gpu:1]/GPUFanControlState=1 -a [fan:2]/GPUTargetFanSpeed=75   -a [fan:3]/GPUTargetFanSpeed=75   -a [gpu:1]/GPUMemoryTransferRateOffset[4]=2480 \
    -a  [gpu:2]/GpuPowerMizerMode=1 -a [gpu:2]/GPUFanControlState=1 -a [fan:4]/GPUTargetFanSpeed=75   -a [fan:5]/GPUTargetFanSpeed=75   -a [gpu:2]/GPUMemoryTransferRateOffset[4]=2480 \
    -a  [gpu:3]/GpuPowerMizerMode=1 -a [gpu:3]/GPUFanControlState=1 -a [fan:6]/GPUTargetFanSpeed=75   -a [fan:7]/GPUTargetFanSpeed=75   -a [gpu:3]/GPUMemoryTransferRateOffset[4]=2480 \
    -a  [gpu:4]/GpuPowerMizerMode=1 -a [gpu:4]/GPUFanControlState=1 -a [fan:8]/GPUTargetFanSpeed=92   -a [fan:9]/GPUTargetFanSpeed=92   -a [gpu:4]/GPUMemoryTransferRateOffset[4]=1000 \
    -a  [gpu:5]/GpuPowerMizerMode=1 -a [gpu:5]/GPUFanControlState=1 -a [fan:10]/GPUTargetFanSpeed=92  -a [fan:11]/GPUTargetFanSpeed=92  -a [gpu:5]/GPUMemoryTransferRateOffset[4]=1000

}

nvs
trexminer 
sleep 10
cd $DAEMONPATH 
sudo -u ubuntu $DAEMONPATH/$DAEMON $DAEMONOPT &



