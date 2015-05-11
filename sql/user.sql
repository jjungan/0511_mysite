drop table member;
drop sequence member_no_seq;

CREATE TABLE member
( 
no        NUMBER(8),
name      VARCHAR2(30),
email     VARCHAR2(80),
password  VARCHAR2(30),
gender    VARCHAR2(10)
) ;

ALTER TABLE member
ADD ( CONSTRAINT member_no_pk PRIMARY KEY ( no ) );


CREATE SEQUENCE member_no_seq
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       99999999
 NOCACHE
 NOCYCLE;
 
 insert into member values(member_no_seq.nextval, 'LeeJungan', 'jungan.lee@samsung.com', '1234', 'female');
 select * from member;
 select * from member where email = 'jungan.lee@samsung.com' and password = '1234' ;
 commit;
 update member set name='jung', password='1111', gender='female' where email = 'jungan.lee@samsung.com'
 
 
 
 
 