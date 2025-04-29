drop database quest32;
create database quest32;
use quest32;
create table persontbl( id int auto_increment,
name varchar(10) not null,
birth int,
address char(20) default "none",
telephone1 char(3) not null check(telephone1 in ("010", "011")),
telephone2 char(8) not null unique,
mdate date);
select * from persontbl;
insert into persontbl values(1, "김종민", 1973, "경기", 010, 12345678);
insert into persontbl (name, telephone1, telephone2)
values("유재석", "011", "22222222");

insert into persontbl(name, address, telephone1, telephone2, mdate