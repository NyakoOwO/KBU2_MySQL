create database shop;
use shop;

create table Persontable(
	ID char(10) not null primary key,
    Name varchar(10) not null,
    Birth int not null,
	address char(20) not null,
    Telephone1 char(3),
    Telephone2 char(10),
    Mdate date
);
alter table persontable add constraint primary key(ID);

insert into Persontable values(
	"AAA", "강호동" , 1973, "서울", "010", "22222222", "2010-08-08"
);

select *from persontable;
describe persontable
