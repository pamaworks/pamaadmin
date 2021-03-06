--
-- Table structure for table `USER_T`
--

DROP TABLE IF EXISTS USER_T;

CREATE TABLE USER_T (
  ID INT(11) NOT NULL AUTO_INCREMENT COMMENT '아이디1',
  USER_ID VARCHAR(50) NOT NULL  COMMENT '아이디2',
  USERNAME VARCHAR(50) NOT NULL COMMENT '유저네임:아이디',
  EMAIL VARCHAR(100) NOT NULL COMMENT '이메일',
  PASSWD VARCHAR(100) NOT NULL COMMENT '비밀번호',
  REGISTER_DATE TIMESTAMP NOT NULL COMMENT '등록일자',
  PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='사용자';

