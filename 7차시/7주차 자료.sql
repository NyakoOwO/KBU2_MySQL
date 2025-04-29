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

INSERT INTO persontbl (name, birth, address, telephone1, telephone2, mdate) values

('김종민',1973,'경기', '010', '11111111','2000-1-1'),

('유재석','1980',default,'011', '22222222','2025-1-1'),

('이영자','1980','서울','011', '33333333', '1999-12-12'),

('이말자','1980','서울특별시','010','44444444','2011-1-10'),

('박종민','1980','충청','011','55555555','2010-1-1'),('강호동','1980','부산','011', '66666666','2025-1-1'),

("유말자", '1985', default,'010','77777777','2025-1-1'),("BBB",'1980',default,'011','88888888','2025-1-1'),

('정글맨',1973,'경기', '010', '99999999','2000-1-1'),('이정재',1973,'경기', '010', '11112222','2000-1-1'),

('정글맨',1973,'경기', '010', '11113333','2000-1-1'),('이정재',1973,'경기', '010', '11114444','2000-1-1');

CREATE TABLE buytbl (

buy_id INT PRIMARY KEY AUTO_INCREMENT, -- 구매 ID (각 구매 건의 식별자)

user_id INT NOT NULL, -- 구매자 ID (persontbl의 id 참조)

product_name VARCHAR(50) NOT NULL, -- 제품명 (더 다양한 이름 허용)

price INT NOT NULL CHECK (price > 0), -- 가격 (0보다 큰 값만 허용)

amount INT NOT NULL CHECK (amount > 0), -- 수량 (1 이상)

-- Foreign Key 설정 (persontbl의 id를 참조)

CONSTRAINT fk_buytbl_user FOREIGN KEY (user_id)

REFERENCES persontbl(id)

ON DELETE CASCADE ON UPDATE CASCADE

);

insert into buytbl (user_id, product_name,price,amount) values(1, '노트북',1000,1);

insert into buytbl (user_id, product_name,price,amount) values(2, '컴퓨터',1554,2);

insert into buytbl (user_id, product_name,price,amount) values(4, '노트북',1000,1);

insert into buytbl (user_id, product_name,price,amount) values(2,'핸드폰',580,2);

insert into buytbl (user_id, product_name,price,amount) values(7,'노트북',1000,1);

insert into buytbl (user_id, product_name,price,amount) values(5,'컴퓨터',2520,3);

insert into buytbl (user_id, product_name,price,amount) values(2, '모니터',200,1);

insert into buytbl (user_id, product_name,price,amount) values(4,'컴퓨터',1890,3);

insert into buytbl (user_id, product_name,price,amount) values(2,'컴퓨터',1575,2);

insert into buytbl (user_id, product_name,price,amount) values(1,'핸드폰',300,1);

insert into buytbl (user_id, product_name,price,amount) values(5,'컴퓨터',3675,5);

insert into buytbl (user_id, product_name,price,amount) values(2,'모니터',200,1);

insert into buytbl (user_id, product_name,price,amount) values(4,'핸드폰',300,1);

insert into buytbl (user_id, product_name,price,amount) values(7,'LG컴퓨터1',315,1);

insert into buytbl (user_id, product_name,price,amount) values(8,'삼성컴퓨터1',315,1);

insert into buytbl (user_id, product_name,price,amount) values(2,'LG컴퓨터1',315,1);

insert into buytbl (user_id, product_name,price,amount) values(1,'삼성컴퓨터2',315,1);

select *from persontbl;

select *from buytbl;

-- 컴퓨터란 제품을 산 유저 아이디에 대한 조사
SELECT * FROM buytbl
WHERE product_name = '컴퓨터';

SELECT * FROM buytbl
WHERE user_id IN ( 
SELECT user_id 
FROM buytbl 
WHERE product_name = '컴퓨터'
);

-- 중복된 이름조회
SELECT name, COUNT(*), telephone1
FROM persontbl
GROUP BY name , telephone1
HAVING COUNT(*) > 1;

SELECT *
FROM persontbl
WHERE name in (
SELECT name
FROM persontbl
GROUP BY name
HAVING count(*)>1);

SELECT *
FROM bytbl
WHERE user_id = (
SELECT user_id
FROM buytbl
GROUP BY user_id
ORDER BY SUM(price * amount ) DESC LIMIT 1
);

SELECT * FROM persontbl
WHERE id NOT IN (
SELECT DISTINCT user_id FROM buytbl
);

SELECT * FROM buytbl
WHERE persontbl.id = buytbl.user_id NOT IN (
SELECT DISTINCT user_id FROM buytbl
);

SELECT * FROM persontbl P
WHERE name='유재석' AND EXISTS (
SELECT 1 FROM buytbl b
WHERE p.id = b.user_id AND productname LIKE '%컴퓨터%'
);

SELECT persontbl WHERE EXISTS ( 
SELECT 1 FROM (
SELECT buytbl WHERE product_name='노트북'
ORDER BY buy_id DESC LIMIT 1 AS recent
WHERE buytbl.user_id = persontbl.id
);

SELECT * FROM persontbl P
WHERE EXISTS (
SELECT 1 FROM (
SELECT * FROM buytbl
WHERE procuet_name LIKE '%LG%'
));
