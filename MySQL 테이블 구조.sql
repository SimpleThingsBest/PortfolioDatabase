#회원정보 테이블
CREATE TABLE peoples(
	pid VARCHAR(50) PRIMARY KEY,
	ppw VARCHAR(120) NOT NULL,
	pnick VARCHAR(20) NOT NULL,
	pimage VARCHAR(1000),
	updatedate DATETIME,
	logindate DATETIME,
	ip VARCHAR(100)
)DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

#유니크 설정
ALTER TABLE peoples ADD UNIQUE KEY (pnick);

#테이블 없애기
DROP TABLE peoples;

#샘플데이터
INSERT INTO peoples(pid, ppw, pnick, updatedate) values('aisdugo@gmail.com', 'root1234!', '관리자', now());

#전체데이터 조회
SELECT * from peoples;

#데이터삭제
DELETE from peoples where pid = 'aisdugo@gmail.com';

#식약청 보도자료 테이블
#title, link, content, pubdate를 저장.
create table mfds(
numbering INT primary key AUTO_INCREMENT,
title VARCHAR(300),
content VARCHAR(300),
link VARCHAR(300),
pubdate VARCHAR(50)
)DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

#식약청 보도자료 테이블 전체 조회
select * from mfds;

#식약청 보도자료 테이블 삭제
DROP TABLE mfds;

#원본 테이블에 적용
commit
     
#메모 테이블 생성
CREATE TABLE MEMO(
num INT(10) PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(30),
content TEXT,
regdate VARCHAR(30),
imagepath VARCHAR(100)
)DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci

#메모 테이블 삭제
drop table memo

#메모 뷰 생성
CREATE OR replace VIEW MEMOVIEW
AS
SELECT *
FROM memo

#메모 뷰 삭제
drop view memoview

#메모 프로시져 생성
CREATE PROCEDURE INSERT_MEMO(IN vtitle VARCHAR(30),
IN vcontent VARCHAR(999),
IN vregdate VARCHAR(30),
IN vimagepath VARCHAR(100))
BEGIN
	INSERT INTO MEMO(
		title, content, regdate, imagepath)
	values(vtitle, 
		vcontent, vregdate, vimagepath);
END

#메모 프로시져 삭제
drop PROCEDURE insert_memo

#메모 프로시져 호출
CALL insert_memo('2','3','4','5');

#메모 테이블 전체조회
select * from memo;

#메모 뷰 전체 조회
select * from memoview;

#메모 샘플데이터
insert into memo(title, content, regdate, imagepath) values('바트심슨입니다', '바트심슨은 공부를 싫어하고 동생인 리사 심슨과 틈만나면 싸워댄다. 스케이트 보드를 타는 것을 자주 볼 수 있음.', '2018-12-05 17:12:00', 'simpson2.jpg')

#원본테이블에 적용
COMMIT;

#테이블 데이터 초기화
TRUNCATE TABLE MEMO;

#이미지 테스트를 위한 데이터 추가
INSERT INTO MEMO(title, content, regdate, imagepath)
VALUES('이미지가 있는 경우', '이미지가 있으면 파일명이 있습니다.', '2018-01-01 12:00:00', 'blacklogin.png');
INSERT INTO MEMO(title, content, regdate, imagepath) 
VALUES('이미지가 없는 경우', '이미지가 없으면 파일명이 공백 한 칸입니다.', '2018-01-02 12:00:00', ' ');

#원본테이블에 적용
COMMIT;

