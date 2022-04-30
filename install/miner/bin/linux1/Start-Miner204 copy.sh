#!/bin/bash

#USER=0x8d1f3496a1f267c4b486ad6520a4729ef1ef04b5 #upbit
#export USERETH=0x4A7eA146e484AD37Df41E6eC1104c5E5E29e9403 #metamask L2 Polygon
export USERETH=0x598405Aaca51850710f15d30336b33194F0Cd528 #metamask 
export URLETH=asia2.ethermine.org:5555

#USERETC=0x4b949174f00c179c93ffa8e31635e383520d6ea4
#export USERETC=0x4A7eA146e484AD37Df41E6eC1104c5E5E29e9403 #metamask L2 Polygon
export USERETC=0x598405Aaca51850710f15d30336b33194F0Cd528 #metamask 
export URLETC=asia1-etc.ethermine.org:5555

export WORKER=D204





nvs() {
    sudo nvidia-smi -pm 1
    sudo nvidia-smi -i 0,1,2 -lgc 1125
    sudo nvidia-smi -i 3,4,5 -lgc 1300

    sudo xinit /usr/bin/nvidia-settings -a  [gpu:0]/GpuPowerMizerMode=1 -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=80  -a [fan:1]/GPUTargetFanSpeed=80 -a [gpu:0]/GPUMemoryTransferRateOffset[4]=2500 \
    -a  [gpu:1]/GpuPowerMizerMode=1 -a [gpu:1]/GPUFanControlState=1 -a [fan:2]/GPUTargetFanSpeed=80  -a [fan:3]/GPUTargetFanSpeed=80  -a [gpu:1]/GPUMemoryTransferRateOffset[4]=2500 \
    -a  [gpu:2]/GpuPowerMizerMode=1 -a [gpu:2]/GPUFanControlState=1 -a [fan:4]/GPUTargetFanSpeed=80  -a [fan:5]/GPUTargetFanSpeed=80 -a [gpu:2]/GPUMemoryTransferRateOffset[4]=2500 \
    -a  [gpu:3]/GpuPowerMizerMode=1 -a [gpu:3]/GPUFanControlState=1 -a [fan:6]/GPUTargetFanSpeed=80  -a [fan:7]/GPUTargetFanSpeed=80 -a [gpu:3]/GPUMemoryTransferRateOffset[4]=1600 \
    -a  [gpu:4]/GpuPowerMizerMode=1 -a [gpu:4]/GPUFanControlState=1 -a [fan:8]/GPUTargetFanSpeed=80  -a [fan:9]/GPUTargetFanSpeed=80 -a [gpu:4]/GPUMemoryTransferRateOffset[4]=1600 \
    -a  [gpu:5]/GpuPowerMizerMode=1 -a [gpu:5]/GPUFanControlState=1 -a [fan:10]/GPUTargetFanSpeed=80  -a [fan:11]/GPUTargetFanSpeed=80 -a [gpu:5]/GPUMemoryTransferRateOffset[4]=1600 

}
NAME=Mining
DAEMON=/home/ubuntu/coin/bin/gminer_2_90_linux64/miner
DAEMONOPT=" --algo ethash --ssl 1 --server $URLETH  --user $USERETH.$WORKER   --log_newjob 0  --api 3333 "
PIDDIR=/var/run
USER=ubuntu
GROUP=ubuntu
 


if [ -r /lib/lsb/init-functions ]; then
    source /lib/lsb/init-functions
fi
 
check_root() {
    if [ "$(id -u)" != "0" ]; then
        log_failure_msg "You must be root to start, stop or restart $NAME."
    exit 4
    fi
}


case "$1" in
    start)
        check_root
        nvs
        exitval=0
        log_daemon_msg "Starting $NAME"
        if pidofproc -p $PIDDIR/$NAME.pid $DAEMON > /dev/null; then
            log_progress_msg "$NAME apparently already running"
            log_end_msg 0
            exit 0
        fi
        start-stop-daemon --start --quiet --oknodo  --pidfile $PIDDIR/$NAME.pid \
            --chuid $USER:$GROUP --background --make-pidfile --exec  $DAEMON -- $DAEMONOPT 
        log_progress_msg $NAME
        exitval=$?
        log_end_msg $exitval
        ;;
    stop)
        check_root
        exitval=0
        log_daemon_msg "Stopping $DESC "
        log_progress_msg $NAME
        # stop my service
        if pidofproc -p  $PIDDIR/$NAME.pid $DAEMON  > /dev/null; then
            start-stop-daemon --stop --verbose --oknodo --pidfile $PIDDIR/$NAME.pid --exec $DAEMON 
            exitval=$?
        else
            log_progress_msg "apparently not running"
        fi
        exitval=$?
        log_end_msg $exitval
        ;;
    status)
        PIDFILE=$PIDDIR/$NAME.pid
        if [ -e $PIDFILE ]; then
            PID="$(cat $PIDFILE)"
            if test -n "$PID" && test -d "/proc/$PID" &>/dev/null; then
                log_success_msg "$NAME Process is running"
                exit 0
            else
                log_failure_msg "$NAME Process is not running"
                exit 1
            fi
        else
            log_failure_msg "$NAME Process is not running"
            exit 3
        fi
        ;;
    *)
        N=/etc/init.d/$NAME
        echo "Usage: $N {start|stop|status}" >&2
        exit 1
        ;;
esac
 
exit 0


