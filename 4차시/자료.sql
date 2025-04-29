DROP DATABASE IF EXISTS shop; 
CREATE DATABASE shop; 
USE shop;
CREATE TABLE persontbl
( id INT PRIMARY KEY AUTO_INCREMENT, 
  name VARCHAR(10) NOT NULL,
  birth INT ,
  address CHAR(20) DEFAULT "none",
  telephone1 CHAR(3) NOT NULL CHECK(telephone1 IN ('010','011')),
  telephone2 CHAR(8) NOT NULL UNIQUE,
  mdate DATE);
INSERT INTO persontbl values (1,'김종민',1973,'경기', '010', '11111111','2000-1-1');
INSERT INTO persontbl (name,telephone1, telephone2) VALUES('유재석','011',  '22222222');
INSERT INTO persontbl (name,address,telephone1,  telephone2, mdate) VALUES('이영자','서울','011', '33333333', '1999-12-12'),
('이말자','서울','010','44444444','2011-1-10'), ('박종민','충청','011','55555555','2010-1-1');
INSERT INTO persontbl (name,address,telephone1, telephone2)  VALUES('강호동',DEFAULT,'011', '66666666');
INSERT INTO persontbl (name, telephone1, telephone2) VALUES("유말자", '010','77777777'),("BBB",'011','88888888'); 

INSERT INTO persontbl (name, birth, address, telephone1, telephone2,mdate)VALUES('정글맨',1973,'경기', '010', '99999999','2000-1-1'),
('이정재',1973,'경기', '010', '11112222','2000-1-1');
INSERT INTO persontbl (name, birth, address, telephone1, telephone2,mdate)VALUES('정글맨',1973,'경기', '010', '11113333','2000-1-1'),
('이정재',1973,'경기', '010', '11114444','2000-1-1');

DROP TABLE IF EXISTS buytbl;
CREATE TABLE buytbl (
    buy_id INT PRIMARY KEY AUTO_INCREMENT,  -- 구매 ID (각 구매 건의 식별자)
    user_id INT NOT NULL,  -- 구매자 ID (persontbl의 id 참조)
    product_name VARCHAR(50) NOT NULL,  -- 제품명 (더 다양한 이름 허용)
    price INT NOT NULL CHECK (price > 0),  -- 가격 (0보다 큰 값만 허용)
    amount INT NOT NULL CHECK (amount > 0),  -- 수량 (1 이상)
       -- Foreign Key 설정 (persontbl의 id를 참조)
    CONSTRAINT fk_buytbl_user FOREIGN KEY (user_id) 
    REFERENCES persontbl(id) 
    ON DELETE CASCADE ON UPDATE CASCADE
);
insert into buytbl (user_id, product_name,price,amount) values(1, '노트북',1000,1);
insert into buytbl (user_id, product_name,price,amount) values(2, '컴퓨터',1480,2);
insert into buytbl (user_id, product_name,price,amount) values(4, '노트북',1000,1);
insert into buytbl (user_id, product_name,price,amount) values(2,'핸드폰',580,2);
insert into buytbl (user_id, product_name,price,amount) values(7,'노트북',1000,1);
insert into buytbl (user_id, product_name,price,amount) values(5,'컴퓨터',2400,3);
insert into buytbl (user_id, product_name,price,amount) values(2, '모니터',200,1);
insert into buytbl (user_id, product_name,price,amount) values(4,'컴퓨터',1800,3);
insert into buytbl (user_id, product_name,price,amount) values(2,'컴퓨터',1500,2);
insert into buytbl (user_id, product_name,price,amount) values(1,'핸드폰',300,1);
insert into buytbl (user_id, product_name,price,amount) values(5,'컴퓨터',3500,5);
insert into buytbl (user_id, product_name,price,amount) values(2,'모니터',200,1);
insert into buytbl (user_id, product_name,price,amount) values(4,'핸드폰',300,1);
insert into buytbl (user_id, product_name,price,amount) values(7,'LG컴퓨터1',300,1);
insert into buytbl (user_id, product_name,price,amount) values(8,'삼성컴퓨터1',300,1);
insert into buytbl (user_id, product_name,price,amount) values(2,'LG컴퓨터1',300,1);
insert into buytbl (user_id, product_name,price,amount) values(1,'삼성컴퓨터2',300,1);
SELECT *FROM bUYTBL;
SELECT *FROM persontbl;
