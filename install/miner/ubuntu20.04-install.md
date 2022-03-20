


실력이 많이 부족하지만 여름 대비 장비 정리 전에 저와 같은 생각을 가지고 계신 분들을 위하여 글을 남겨 봅니다. 

현재 채굴장비는 3070 4way 1대, 3070 5way 1대 운영하고 있습니다. 

사양은 다음과 같습니다. 

1. 4way 

    CPU : G3930

    MB : Gigabyte GA-H110-D3A BTC 

    RAM : 삼성 DDR4 4G PC4-19200 

    HDD : 120G 860

    VGA : 3070 4대

    POWER : PNC PARTNER EVEREST 1600AP 88+ 

    CASE : 밀폐형 6U (6Way/ 8Way) 아틱팬으로 교체 

2. 5way

    CPU : 라이젠 3500 

    MB : MSI x470 Gaming Plus

    HDD : 120G 860

    VGA : 3070 5대 

    POWER : 잘만 1200W 풀모듈러 ZM1200-ARX 80PLUS PLATINUM

    CASE : 밀폐형 4U 아틱팬 교체



============================================================

바이오스 설정부분은 

PCI 구동부 X1 설정 

above 4g decoding 활성화

내장그래픽 비활성화(설정해서 사용도 가능하지만 그래픽 카드 인식 등의 여러가지 이슈로 끄는 걸 추천드립니다)

정도가 중요하고 나머지 세부사항은 스킵하도록 하겠습니다. 

============================================================

우분투의 설치 

https://ubuntu.com/#download 에서 20.04 LTS를 받아서 balenaEtcher과 같은 프로그램을 사용하여 부팅 가능한 USB를 만들어 설치를 진행합니다. 자세한 설치 과정은 온라인에도 많이 있는 관계로 생략하겠습니다. 

한글 설치도 가능하지만 한글 깨짐 등의 현상을 우려하여 원천 배제차원에서 영문으로 설치 하였으며 

Updates and Other Software 화면에서 Normal installation이 아닌 minimal installation을 선택하여 설치를 진행하였습니다. locale은 그냥 서울로 하였습니다. 

============================================================

외부텔넷 접속 

우분투 설치 이후 telnet을 통한 접속(putty를 활용한 접속)이 가능하도록 하기 위하여 터미널을 실행하고(단축키 Ctrl + Alt + T) 다음과 같은 명령어를 순차적으로 실행합니다. 

sudo apt update 

sudo apt upgrade

sudo apt install openssh-server

apt update와 apt upgrade를 실행하여 우선 업데이트를 진행하고 

sudo apt install openssh-server 명령어 실행을 통해 ssh 서버를 설치 합니다. 



해당 설치가 완료되면 다른 PC에서 putty 등의 텔넷 프로그램을 이용하여 22번 포트의 ssh접근이 가능해 집니다.

 퀘이사존

putty 실행 화면 (빨간색 부분에 우분투가 설치된 채굴기의 IP주소를 넣으면 됩니다.)

퀘이사존

우분투 설치시 입력한 아이디와 비밀번호를 통해 로그인이 가능합니다. 

=============================================================

콘솔모드로 변경 

우분투 20.04 LTS를 설치 하시면 그래픽 화면으로 출력이 되는데 이것을 텍스트라인만 보이는 콘솔모드로 변경하였습니다. 

sudo cp -n /etc/default/grub /etc/default/grub.backup

해당 명령어를 실행하여 우선 grub파일을 백업해주고 

sudo nano /etc/default/grub

위의 명령어를 실행하여 grub파일을 편집해 줍니다. 

퀘이사존

GRUB_CMDLINE_LINUX_DEFAULT="quiet splash" 라인 앞에 #을 붙여주어 주석처리 합니다.(지워도 무방하지만 향후 복구를 위해 주석 처리 하는 것이 좋습니다.)

GRUB_CMDLINE_LINUX="" 를 GRUB_CMDLINE_LINUX="text" 로 변경합니다. 

#GRUB_TERMINAL="console" 라인 앞에있는 #을 제거하여 위와 같이 활성화 시켜 줍니다. 

ctrl + x를 눌러 종료하며 저장합니다. 

sudo update-grub

명령어를 실행하여 변경한 grub를 적용합니다. 

sudo systemctl set-default multi-user.target

명령어를 실행합니다. 

sudo reboot 

명령어를 실행하여 재부팅하면 그래픽이 아닌 콘솔모드로 부팅이 됩니다. 

=========================================================

이후 진행부터는 텔넷접속을 통해 모두 진행합니다. 

=========================================================

SWAP 용량 변경 

sudo swapoff -v /swapfile

명령을 실행하여 스왑을 끄고 

sudo fallocate -l 60G /swapfile

명령을 실행하여 60기가로 변경

sudo chmod 600 /swapfile

명령을 실행하여 권한변경

sudo mkswap /swapfile

명령을 실행하여 Swap파일을 만듭니다. 

sudo swapon /swapfile

명령을 실행하여 Swap파일을 활성화 합니다. 

free -m을 실행하면 현재 스왑 용량을 확인할 수 있습니다. 

==========================================================

nvidia 드라이버 설치 

ubuntu-drivers devices

명령어를 실행하시면 설치 가능한 드라이버 확인이 가능합니다. 

lspci | grep -i nvidia

명령어를 실행하시면 사용가능한(인식이 된) nvidia 그래픽카드 확인이 가능합니다. 

드라이버 설치는 권장 드라이버 자동설치와 원하는 버전의 수동설치가 가능한데 자동 설치로 진행하였습니다. 

3060의 경우 채굴락으로 특정 개발자 버전의 드라이버를 수동설치 해야 하는 것으로 알고 있지만 해당사항은 확인하지 못했습니다. 

sudo ubuntu-drivers autoinstall

명령어를 실행하시면 최신의 권장 드라이버가 자동으로 설치 됩니다. 

sudo reboot 

명령어를 실행하여 재부팅을 진행합니다. 

===========================================================

오버클럭을 위한 준비

sudo nvidia-xconfig --enable-all-gpus

sudo nvidia-xconfig --cool-bits=28

위 두 명령을 각각 실행하여 xorg.conf파일을 생성합니다.

sudo nano /etc/X11/Xwrapper.config

명령어를 실행하여 Xwrapper.config파일을 수정합니다. 

퀘이사존

위 이미지와 같이 allowed_users=anybody로 수정하고 ctrl+x 를 눌러 저장 종료 합니다. 

sudo reboot 

명령어를 실행하여 재시작합니다. 

오버클럭 설정을 위한 배치파일 생성은 ethminer 설치 뒤에 다루도록 하겠습니다. 

=====================================================================

ethminer 설치 준비

ethminer는 오픈소스 기반의 마이닝 소프트웨어로 우분투에서 직접 컴파일하여 사용할 수 있는 무료버전입니다. 최근에 업데이트가 많지 않아서 아쉬움이 있지만 3천번대의 지원은 작업이 되어있는 상황입니다. 

우선 컴파일을 하기 위한 소프트웨어 설치가 필요합니다. 

sudo apt -y install build-essential

sudo apt -y install gcc-8 g++-8 gcc-9 g++-9

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 8 --slave /usr/bin/g++ g++ /usr/bin/g++-8

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 9 --slave /usr/bin/g++ g++ /usr/bin/g++-9

위의 4 명령어를 각각 실행시켜 줍니다. 



==========================================================================

cuda 툴킷 설치

ethminer를 컴파일 하기 위해서 cuda 툴킷의 설치가 필요합니다. 11.1.1위의 버전도 나와 있지만 테스트 된 11.1.1 버전 설치로 진행하겠습니다. 

wget https://developer.download.nvidia.com/compute/cuda/11.1.1/local_installers/cuda_11.1.1_455.32.00_linux.run

명령어를 실행하여 파일을 받아줍니다. 

chmod +x cuda_11.1.1_455.32.00_linux.run

명령어를 실행하여 cuda_11.1.1_455.32.00_linux.run 파일을 실행 가능한 파일로 바꿔줍니다. 

sudo ./cuda_11.1.1_455.32.00_linux.run

명령어를 실행하여 설치를 진행합니다. 실행 자체에 시간이 좀 걸려서 기다리셔야 합니다. 

퀘이사존

이런 식으로 대기가 오래 걸립니다. 

퀘이사존

위와같은 화면이 나오면 continue를 선택하시고 넘어가시면됩니다. 

퀘이사존

여기서 accept 쓰고 엔터 누르시면 

퀘이사존

driver를 꼭 해제 하시고 (이미 설치 했기 때문) Install 버튼을 선택하시면 됩니다. 설치도 시간이 좀 걸립니다. 

sudo reboot

명령어를 실행하여 재부팅합니다. 

====================================================================

오버클럭 

nano init_ethminer.sh

명령어를 실행하여 오버클럭용 배치 파일을 생성합니다. 

sudo nvidia-smi -pm 1

sudo nvidia-smi -i 0 -pl 130

sudo nvidia-smi -i 1 -pl 130

sudo nvidia-smi -i 2 -pl 130

sudo nvidia-smi -i 3 -pl 130

#sudo nvidia-smi -i 4 -pl 123

#sudo nvidia-smi -i 5 -pl 123

xinit /usr/bin/nvidia-settings -a [gpu:0]/GpuPowerMizerMode=1 -a [gpu:0]/GPUGraphicsClockOffset[4]=-500 -a [gpu:0]/GPUMemoryTransferRateOffset[4]=2000 -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=65 -a [fan:1]/GPUTargetFanSpeed=65 \

-a [gpu:1]/GpuPowerMizerMode=1 -a [gpu:1]/GPUGraphicsClockOffset[4]=-500 -a [gpu:1]/GPUMemoryTransferRateOffset[4]=1900 -a [gpu:1]/GPUFanControlState=1 -a [fan:2]/GPUTargetFanSpeed=65 -a [fan:3]/GPUTargetFanSpeed=65 \

-a [gpu:2]/GpuPowerMizerMode=1 -a [gpu:2]/GPUGraphicsClockOffset[4]=-500 -a [gpu:2]/GPUMemoryTransferRateOffset[4]=2000 -a [gpu:2]/GPUFanControlState=1 -a [fan:4]/GPUTargetFanSpeed=55 -a [fan:5]/GPUTargetFanSpeed=55 \

-a [gpu:3]/GpuPowerMizerMode=1 -a [gpu:3]/GPUGraphicsClockOffset[4]=-500 -a [gpu:3]/GPUMemoryTransferRateOffset[4]=2000 -a [gpu:3]/GPUFanControlState=1 -a [fan:6]/GPUTargetFanSpeed=55 -a [fan:7]/GPUTargetFanSpeed=55 -- :1 -once

#-a [gpu:4]/GpuPowerMizerMode=1 -a [gpu:4]/GPUGraphicsClockOffset[4]=-500 -a [gpu:4]/GPUMemoryTransferRateOffset[4]=2050 -a [gpu:4]/GPUFanControlState=1 -a [fan:8]/GPUTargetFanSpeed=50 -a [fan:9]/GPUTargetFanSpeed=50 \

#-a [gpu:5]/GpuPowerMizerMode=1 -a [gpu:5]/GPUGraphicsClockOffset[4]=-500 -a [gpu:5]/GPUMemoryTransferRateOffset[4]=2050 -a [gpu:5]/GPUFanControlState=1 -a [fan:10]/GPUTargetFanSpeed=50 -a [fan:11]/GPUTargetFanSpeed=50 -- :1 -once

위 텍스트를 긁어 붙인 후 수정을 하여야 합니다. 

퀘이사존

수정법을 설명드리겠습니다. 

우선 제일 첫줄의 

sudo nvidia-smi -pm 1 는 그래픽카드의 퍼포먼스 모드 설정명령입니다. 해당 설정을 통해 오버/언더 클럭이 가능하도록 합니다. 

sudo nvidia-smi -i 0 -pl 130 이거는 1번쨰 그래픽카드의 전력 설정입니다. 0의 숫자를 바꿔가며 그래픽카드별로 전력 설정을 바꿀 수 있습니다. 저는 일단 튜닝이 귀찮아 130으로 맞췄습니다. 

해당 장비에 그래픽카드가 총 4장이 있어서 

sudo nvidia-smi -pm 1

sudo nvidia-smi -i 0 -pl 130

sudo nvidia-smi -i 1 -pl 130

sudo nvidia-smi -i 2 -pl 130

sudo nvidia-smi -i 3 -pl 130

로 설정하였습니다. 

xinit 부분부터 설명을 드리겠습니다. xinit명령은 xorg를 통해 원격으로 그래픽 카드의 코어클럭 및 메모리 클럭의 제어가 가능하도록합니다. 

xinit /usr/bin/nvidia-settings -a [gpu:0]/GpuPowerMizerMode=1 -a [gpu:0]/GPUGraphicsClockOffset[4]=-500 -a [gpu:0]/GPUMemoryTransferRateOffset[4]=2000 -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=65 -a [fan:1]/GPUTargetFanSpeed=65

/usr/bin/nvidia-settings 이 프로그램으로 실질적인 제어를 합니다. -a는 항목을 뜻하는 옵션입니다. 

[gpu:0]/GpuPowerMizerMode=1 gpu0번의 파워마이저모드를 활성화 한다. 

 [gpu:0]/GPUGraphicsClockOffset[4]=-500 gpu0번의 코어클럭을 -500으로 한다. [4]는 그래픽 카드의 종류마다 숫자가 다른데 3천번대는 4번을 사용합니다. 

[gpu:0]/GPUMemoryTransferRateOffset[4]=2000 gpu0번의 메모리 클럭을 +2000으로 한다.(에프터버너의 1000MH) 

[gpu:0]/GPUFanControlState=1 gpu 0번의 팬 컨트롤 모드를 활성화 한다. 

[fan:0]/GPUTargetFanSpeed=65 fan0 번의 속도를 65%로 한다.

팬은 0번부터 쭉 올라가는 방식이며 GPU 1개당 2개(3팬이어도) 있다고 보시면 됩니다. 따라서 0번 GPU는 0 , 1 / 1번GPU는 2, 3 이런 방식입니다. 

[fan:1]/GPUTargetFanSpeed=65  fan1번의 속도를 65%로 한다. 

해당 줄 맨 뒤에 나오는  \ 는 편집을 용이하게 하기 위해 명령어가 줄바꿈 되었다는 표시입니다. 

GPU 갯수에 맞춰 편집하시고 마지막에  -- :1 -once 를 붙여주시고 저장하시면 됩니다. 

편집이 완료 되셨다면 

chmod 755 init_ethminer.sh

명령어를 실행하여 실행가능한 배치 파일로 바꿔주시고 

sudo ./init_ethminer.sh

를 실행하여 위 설정값을 적용하시면 됩니다. 

ethminer 구동전에 꼭 해주셔야 합니다. 전력 부족방지 및 오버클럭을 위해. 

 

====================================================================

ethminer 컴파일을 위한 과정

sudo apt-get install git mesa-common-dev cmake

위 명령어를 실행하여 필요한 소프트웨어를 설치합니다.

mkdir ethminer && cd ethminer

ethminer 소스를 받기위한 폴더를 생성하고 해당폴더로 이동합니다.

git clone https://github.com/ethereum-mining/ethminer .

명령어를 실행하여 소스코드를 받습니다. 

git submodule update --init --recursive

서브모듈 소스코드도 다 받습니다. 3천번대 패치가 있음으로 필수적으로 받아야 합니다. 

mkdir build && cd build

컴파일 결과물을 만들 폴더를 만들고 해당폴더로 이동합니다.

cmake .. -DETHASHCUDA=ON -DETHASHCL=OFF

cmake --build .

위 두 명령어를 각각 실행합니다. 각각 시간이 좀 걸립니다. 

sudo make install

이제 최종 설치를 진행합니다. /usr/bin에 ethminer 실행파일이 들어가기 때문에 그냥 실행이 가능합니다. 

cd

위 명령어를 실행하여 유저 최상위 폴더로 이동합시다. 

nohup ethminer -U -P stratum1+tcp://지갑주소.워커명@asia1.ethermine.org:14444 &

위의 명령어를 실행하면 ethermine.org의 풀을 사용하여 실행이 됩니다. 

(워커명은 채굴기별로 구분짓기 위한것 임으로 아무거나 넣어도 됩니다만 채굴기별로 다르게 설정해 주셔야 하고 지갑의 경우 이더마인풀에서 일정양 이상 채굴 후 이동시키는 자기 지갑주소 입니다. 저같은 경우 거래소 지갑주소를 사용합니다.)

ethminer가 백그라운드에서 실행하도록 하는 명령어 입니다. 

퀘이사존

위 이미지에서 처럼 nohup.out에 실행 결과가 출력됩니다. 

tail -f nohup.out 

명령어를 실행하여 모니터링 할 수 있습니다. 

퀘이사존

==========================================================

위의 모든 과정을 진행하셨다면 장비가 켜진 후에 

sudo ./init_ethminer.sh

nohup ethminer -U -P stratum1+tcp://지갑주소.워커명@asia1.ethermine.org:14444 &

두 명령만 순차적으로 실행하시면 오버클럭과 채굴을 시작하실 수 있습니다. 

==============================================================

두서없이 쓰다보니 이해가 어려우실 것 같아서 좀 걱정이네요. 조금이나마 도움이 됐으면 합니다. 

퀘이사존 언제나즐겁게
퀘이사존
행성: 명왕성

포인트: 5,050 exp

작성물 댓글

6700xt 기가바이트 어로스 엘리트 써멀패드 교체 및 구리스 재도포
12-26
마이닝풀허브 최근 채굴 추이
08-14
1기가 찍고 싶네요
06-14
케이블 온도도 조심하셔요.
05-13
모든회원 자기소개 펼치기

댓글: 14개


과거 순
퀘이사존퀘이토끼
2021.05.03 20:36:03
와 지식이 대단하십니다.
전혀 이해 못 했지만 내용 공유 감사합니다..ㅎㅎ
프로필 이미지
퀘이사존퀘변띠
2021.05.03 20:55:40
정성글에 추천 박고갑니다!
프로필 이미지
퀘이사존핸썸잭💘Sandbox
2021.05.03 21:54:03
음..음...다 이해 했어요!(전혀 모르겠...)
퀘이사존언제나즐겁게
2021.05.03 22:30:16
ㅎㅎㅎ.. 역시 설명이 너무 어설프죠.. 기회되면 영상을... 하이브 OS 수수료나 피닉스 마이너 수수료가 아까워 한 짓이라 ㅋㅋㅋㅋㅋ 
퀘이사존졸업은또다른시작
2021.05.03 22:38:03
무...문송합니다..ㅜㅜ
프로필 이미지
퀘이사존곰젤리
2021.05.03 22:38:25
피닉스나 티렉스 등의 마이너 데브피로 인한 손실보다 이더마이너 해쉬가 더 낮게 나오지 안나요?
퀘이사존언제나즐겁게
2021.05.03 22:53:05
@해마류

찾아본 정보에서는 유사한 것으로 알고 있습니다만. 저도 ethminer는 최근에 적용해 본거라 더 돌려봐야 알 것 같아요. 해당 설정에서도 피닉스 마이너 받아서 돌리는데 문제는 없습니다. 
퀘이사존언제나즐겁게
2021.05.03 22:55:42
@해마류

땡X 사이트에 나온 글로 보면 쉐어 찾은값은 ethminer가 더 많네요. 
퀘이사존JS2theoneLs
2021.05.04 19:18:02
오우.. 윈도우가 아닌 우분투로 ㄷㄷ
프로필 이미지
퀘이사존이쇼라스
2021.05.04 20:07:40
무슨말하는거지? 어떻게해야 이해할수있을까?
퀘이사존user_519291
2021.06.01 02:11:32
정말 좋은글 감사합니다~ 나중에 참고하여 저도 구성해보겠습니다.
제가 가지고있는 그래픽카드가 AMD 베가 64 라 삽질을 해야 할듯 싶습니다~ ㅎㅎ




퀘이사존뎨호황
2021.06.25 00:10:36
우와 정성글 정말 최고십니다-!!!
저도 같은 방법으로 리눅스 세팅하고 돌리다가 정션온도 확인이 안돼서 피닉스로 넘어왔네요 ㅠ
일단 이더마이너 깃헙에서 땡겨와서 
소스코드 편집해서 RTX30xx랑 CUDA 11.2 까지 되게 수정해서 쓰다가 지금은 윈도우에서 돌리네요 ㅠㅠ
언더볼팅 매력때문에 윈도우에 빠져 나갈수가 없어요 ㅠ
퀘이사존언제나즐겁게
2021.06.26 13:51:54
@뎨호황

저는 채굴량과 안정성 때문에 gminer로 바꿨습니다. 언더볼팅은 위에 써놓은 스크립트 활용하시면 리눅스에서도 클럭 전압 팬속 제어 가능하셔요 
퀘이사존user_652442
2021.10.21 17:58:45
이거 cmake.config 안에 Hunter Boost 경로가 더이상 사용되지 않아서, config 수정하셔야 하네요, 

기존 hunter_config(Boost VERSION 1.66.0) 이건 주석처리 하시고 

hunter_config(

    Boost

    VERSION 1.66.0_new_url

    SHA1 f0b20d2d9f64041e8e7450600de0267244649766

    URL https://boostorg.jfrog.io/artifactory/main/release/1.66.0/source/boost_1_66_0.tar.gz

)

추가 하셔야 빌드파일 올라옵니다!

작성하시느라 고생하셨어요 
암호화폐/채굴(임시)
공지
퀘이사존 전체 게시판 공통 규정(22.03.17)
퀘이사존 퀘이사존
2k

11-08

 
전체 질문 잡담 정보
추천
분류
제목
닉네임
조회수
날짜
0	정보	
게임.채굴컴 타스-이더-듀얼 채굴 벤치 테스트. ㅋ 2

퀘이사존 godrepus
292	03-19
0	사이다	
채굴 3일차 채린이 고수형님들 답변좀요!!!! 13

퀘이사존 윤석열화이팅
403	03-19
2	잡담	
스와이프 대박 엎어버릴 개미 모집중인듯

퀘이사존 Riverside
364	03-19
0	사이다	
이더마인에 나오는 해쉬 수치와 실제 마이너의 수치가 다른 경우... 3

퀘이사존 skyBike
277	03-19
0	사이다	
3080 tuf lhr 서멀작업 안하고 몇 해시정도 나오나요? 7

퀘이사존 김인텔
380	03-19
0	잡담	
아이스마이닝풀 출금시간 랜덤으로 변경

퀘이사존 네페르타리
157	03-19
0	질문	
3060ti non 70만원이면? 4

퀘이사존 쿵푸팬덜
611	03-19
0	질문	
pcie 확장+ 카드 구매 추천좀요 1

퀘이사존 user_678957
198	03-19
4	잡담	
아이스마이닝 풀 해킹당했다고 합니다 10

퀘이사존 네페르타리
666	03-19
2	잡담	
타임지 표지에 두번째로 유명한 러시안 3

퀘이사존 카드캡터30
555	03-19
0	질문	
갑자기 gpu 3개를 4개로 인식할 수 있나요? 1

퀘이사존 그래픽카드제발
300	03-19
3	잡담	
POS가 직면한 이시국에 증설을 하는 미친놈이 있다? ㅋㅋ 7

퀘이사존 땅파는고양이
1.2k	03-18
4	잡담	
2개월짜리 수렴의 끝은 과연? 4

퀘이사존 슈넬치킨
695	03-18
0	질문	
레이븐 채굴 카드 추천부탁드립니다 ! 4

퀘이사존 youngberry
331	03-18
2	잡담	
지난주 tuf 3080 99만, 오늘 3080oc 112만 7

퀘이사존 쿵푸팬덜
878	03-18
0	잡담	
남아도는 듀얼파워커넥터보다가 잡생각.. 2

퀘이사존 고민하면님꺼아님
391	03-18
1	잡담	
비트코인, 장기적으로 100만달러 도달할 것 6

퀘이사존 Riverside
977	03-18
0	사이다	
3080 LHR 듀얼채굴인데 해쉬가...... 도와주세요ㅠㅠ 7

퀘이사존 skyBike
465	03-18
1	정보	
어제 오늘 이더마인 열일 하네요. 7

퀘이사존 godrepus
930	03-18
1	정보	
이더 테스트넷에서 에러가 났다는 기사가 나왔네요.. 6

퀘이사존 user_462522
1.1k	03-18
2	잡담	
이더마인 블럭보상이 살짝터진것같습니다 ㅎㅎ 8

퀘이사존 youngberry
886	03-17
0	잡담	
역프가 1프로가 넘네요.

퀘이사존 우나어
556	03-17
5	잡담	
여기는 채굴게인가요 코인게인가요? 13

퀘이사존 유저1365
1.1k	03-17
1	잡담	
셀로 업비트 상장 16:00 2

퀘이사존 Riverside
584	03-17
0	질문	
3080 팬 고장 증상일까요? 1

퀘이사존 우리똘
299	03-17
0	정보	
테스트넷에서 성공했나보네요 11

퀘이사존 쿠킹덤
1.5k	03-17
2	잡담	
금리인상 불확실성 해소 굿굿 2

퀘이사존 코노스바
835	03-17
4	정보	
써멀 패드 대신 구리 패드? 12

퀘이사존 황혼의전도사
1.1k	03-16
2	잡담	
푸틴 찌발넘 아! 1

퀘이사존 쇼티
959	03-16
0	질문	
이더채굴중 팅기더니 채굴이 안되네요 3

퀘이사존 콜뱅이
716	03-16
1 2 3 4 5 6 7 8 9 다음

제목 + 내용
검색어를 입력하세요.
검색

등록일 순
퀘이사존-전 우주급 커뮤니티: 우주의 시작부터 끝까지

퀘이사존 로그인
아이디·비밀번호 찾기회원가입
토론/질문
조립 및 견적

PC조립/견적
게임 및 모바일

스팀게임/PC게임
플스/엑박/스위치
모바일/스마트폰
노트북/태블릿PC
가전

가전제품/TV
PC 컴포넌트

CPU/메인보드/램
그래픽카드
오버클러킹
케이스
커스텀수랭/튜닝
공랭/수랭쿨러
SSD/HDD/USB
파워서플라이
키보드/마우스
사운드기기
모니터
네트워크/인터넷
OS/소프트웨어
기타/주변기기
암호화폐/채굴
암호화폐/채굴 BEST(추천순)
1스와이프 대박 엎어버릴 개미 모집중인듯 0
23060ti non 70만원이면? 4
3채굴 3일차 채린이 고수형님들 답변좀요!!!! 13
43080 tuf lhr 서멀작업 안하고 몇 해시정도 나오나요? 7
5게임.채굴컴 타스-이더-듀얼 채굴 벤치 테스트. ㅋ 2
6이더마인에 나오는 해쉬 수치와 실제 마이너의 수치가 다른 경우... 3
7아이스마이닝풀 출금시간 랜덤으로 변경 0
출석체크
퀘이사존을 다양한 미디어에서 만나보세요

Youtube Facebook Naver post Naver blog Instargram
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
Previous
Next
+Point퀘이사존

퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존
퀘이사존

퀘이사존 소개 이용약관 개인정보취급방침 이메일무단수집거부 문의하기 공지사항 버그제보 모바일 버전

주식회사 퀘이사존
서울특별시 금천구 가산디지털1로 IT캐슬2차 137 13층
대표 : 김현석 사업자등록번호 : 527-81-01065 통신판매업신고번호 : 2018-서울금천-1600 개인정보관리자 : 김현석
광고문의 : ad@quasar.kr
유튜브 페이스북 네이버포스트 네이버블로그 인스타그램
퀘이사존 2016~ⓒ All Rights Reserved.