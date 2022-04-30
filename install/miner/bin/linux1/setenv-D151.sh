#!/bin/bash

sudo nvidia-smi -pm 1
sudo nvidia-smi -i 0,1,2 -lgc 1350


sudo xinit /usr/bin/nvidia-settings -a  [gpu:0]/GpuPowerMizerMode=1 -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=80  -a [fan:1]/GPUTargetFanSpeed=80 -a [gpu:0]/GPUMemoryTransferRateOffset[4]=1600
sudo xinit /usr/bin/nvidia-settings -a  [gpu:1]/GpuPowerMizerMode=1 -a [gpu:1]/GPUFanControlState=1 -a [fan:2]/GPUTargetFanSpeed=80  -a [fan:3]/GPUTargetFanSpeed=80 -a [gpu:1]/GPUMemoryTransferRateOffset[4]=1600
sudo xinit /usr/bin/nvidia-settings -a  [gpu:2]/GpuPowerMizerMode=1 -a [gpu:2]/GPUFanControlState=1 -a [fan:4]/GPUTargetFanSpeed=80  -a [fan:5]/GPUTargetFanSpeed=80 -a [gpu:2]/GPUMemoryTransferRateOffset[4]=1600
# sudo xinit /usr/bin/nvidia-settings -a  [gpu:3]/GpuPowerMizerMode=1 -a [gpu:3]/GPUFanControlState=1 -a [fan:6]/GPUTargetFanSpeed=80  -a [fan:7]/GPUTargetFanSpeed=80  -a [gpu:3]/GPUMemoryTransferRateOffset[4]=2500
# sudo xinit /usr/bin/nvidia-settings -a  [gpu:4]/GpuPowerMizerMode=1 -a [gpu:4]/GPUFanControlState=1 -a [fan:8]/GPUTargetFanSpeed=80  -a [fan:9]/GPUTargetFanSpeed=80  -a [gpu:4]/GPUMemoryTransferRateOffset[4]=2500
# sudo xinit /usr/bin/nvidia-settings -a  [gpu:5]/GpuPowerMizerMode=1 -a [gpu:5]/GPUFanControlState=1 -a [fan:10]/GPUTargetFanSpeed=80  -a [fan:11]/GPUTargetFanSpeed=80  -a [gpu:5]/GPUMemoryTransferRateOffset[4]=2500



cd /home/ubuntu/coin/bin/gminer_2_90_linux64
./miner  --algo ethash --ssl 1 --server $URLETH  --user $USERETH.$WORKER   --log_newjob 0  --api 3333 
#> nohup  /dev/null 2>&1 & 

# cd /home/ubuntu/coin/bin/lolMiner_v1.47_Lin64/1.47
#nohup ./miner  --algo etchash --ssl 1 --server asia1-etc.ethermine.org:5555 --user 0x4b949174f00c179c93ffa8e31635e383520d6ea4.D151  --log_newjob 0  --api 3333 > /dev/null 2>&1 & 
#sudo -u ubuntu nohup ./lolMiner --algo ETHASH --pool stratum+ssl://$URLETH --user  $USERETH.$WORKER --apiport 3333 --apihost 0.0.0.0 > /dev/null 2>&1 & 

# ./lolMiner --algo ETHASH --pool stratum+ssl://$URLETH --user  $USERETH.$WORKER --apiport 3333 --apihost 0.0.0.0 
# sudo xinit /usr/bin/nvidia-settings -a  [gpu:0]/GpuPowerMizerMode=1 -a [gpu:0]/GPUFanControlState=1 
# sudo xinit /usr/bin/nvidia-settings -a  [gpu:1]/GpuPowerMizerMode=1 -a [gpu:1]/GPUFanControlState=1 
# sudo xinit /usr/bin/nvidia-settings -a  [gpu:2]/GpuPowerMizerMode=1 -a [gpu:2]/GPUFanControlState=1 
# sudo xinit /usr/bin/nvidia-settings -a  [gpu:3]/GpuPowerMizerMode=1 -a [gpu:3]/GPUFanControlState=1 
# sudo xinit /usr/bin/nvidia-settings -a  [gpu:4]/GpuPowerMizerMode=1 -a [gpu:4]/GPUFanControlState=1 
# sudo xinit /usr/bin/nvidia-settings -a  [gpu:5]/GpuPowerMizerMode=1 -a [gpu:5]/GPUFanControlState=1 


# sudo xinit /usr/bin/nvidia-settings -a [fan:0]/GPUTargetFanSpeed=80 -a  [fan:1]/GPUTargetFanSpeed=80
# sudo xinit /usr/bin/nvidia-settings -a [fan:2]/GPUTargetFanSpeed=80 -a  [fan:3]/GPUTargetFanSpeed=80
# sudo xinit /usr/bin/nvidia-settings -a [fan:4]/GPUTargetFanSpeed=80 -a  [fan:5]/GPUTargetFanSpeed=80
# sudo xinit /usr/bin/nvidia-settings -a [fan:6]/GPUTargetFanSpeed=70 -a  [fan:7]/GPUTargetFanSpeed=60
# sudo xinit /usr/bin/nvidia-settings -a [fan:8]/GPUTargetFanSpeed=70 -a  [fan:9]/GPUTargetFanSpeed=70 
# sudo xinit /usr/bin/nvidia-settings -a [fan:10]/GPUTargetFanSpeed=0 -a [fan:11]/GPUTargetFanSpeed=70 