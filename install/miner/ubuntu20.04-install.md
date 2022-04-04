1. usb 초기화
diskpart

list disk
DISKPART> list disk
DISKPART> select disk 번호

DISKPART> clean



DISKPART> create partion primary


echo "ubuntu ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ubuntu

mkdir .ssh
cd ~/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2Ue+yEGV/VMR0gtxQ+JACNc22fhJknGdtn+ZK7D4OM+ALKppQtoHRF36wQ05B7yDfTRyLVbJyHJ0vfIMvhQAmTXMa/6yh2EIZkDNTNG9UijHGH5rVSakHwiCNOkc4auhc6Tay9EokzNW0H8+xMO5HAM7F9Mk9JiaaYTzBu1VhOlqBZlsxN3SbFZn6Cc0VvzFTemOn3B5ba4TEJ6c6UwnA3Ox/HP/jpDxvs6JsS7oqUBrlqvw84BLpV3GGSvFHm5KltZXiLpwNJroO1m1E+N22HxTYX6aRFaCAJTsPx7bJ2bID7hys0X6OHJT/B49lbOQ+0xpTe54BQlGTkf5YNFJ9YjuhBqL8IqXfJItBnfC9cI9q7IMQsTAPkXp0KC+HMeXNgVZGPMIOySgGWHmiZgjrCUgPtsDWyhitcmfh6xRlEEAMa445tLN4LjLersoZaNT83zl08Td44ectNT7NmLwOqu1iCSOhVLC21GYYWpCFL5nvBxnhSn+s0YZl1WGgKs8= cci@DESKTOP-6MUMC94" > authorized_keys





sudo apt update 
sudo apt upgrade



sudo dpkg --configure -a
sudo apt install net-tools


sudo apt install ubuntu-drivers-common
sudo ubuntu-drivers devices
sudo ubuntu-drivers autoinstall


sudo cp -n /etc/default/grub /etc/default/grub.backup
sudo vi  /etc/default/grub
```
#GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"

GRUB_CMDLINE_LINUX="text" 로 변경합니다. 

GRUB_TERMINAL="console" 라인 앞에있는 #을 제거하여 위와 같이 활성화 시켜 줍니다. 
```

sudo update-grub


sudo systemctl set-default multi-user.target

sudo reboot 





sudo  swapoff -v /swapfile
sudo fallocate -l 60G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

오버클럭을 위한 준비
sudo nvidia-xconfig --enable-all-gpus
sudo nvidia-xconfig --cool-bits=28

sudo vi /etc/X11/Xwrapper.config
```
allowed_users=anybody
```

sudo reboot 


