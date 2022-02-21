### Base Image 지정 :: https://github.com/bc-hwang/TEST/ 참고중
FROM mariadb:10.6.5

### TimeZone 환경 변수 지정
ENV TZ Asia/Seoul

### Mariadb root 비밀번호 설정
ENV MYSQL_ROOT_PASSWORD=root

### Mariadb Database 생성
ENV MYSQL_DATABASE=pamadb

### TimeZone 설정
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

### Mariadb User 및 DB 스키마 설정 스크립
ADD pamadb.sql /docker-entrypoint-initdb.d/pamadb.sql
ADD db_user.sql /docker-entrypoint-initdb.d/db_user.sql

### 홈 디렉토리
WORKDIR /home/dev

### 서비스 포
EXPOSE 3306
