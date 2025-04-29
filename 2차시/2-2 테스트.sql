create database char_test;

create table ch_table(
	id char(8), make_date date
);
insert into ch_table values( 
	"AAA", "2023-03-11"
);
/* 만약 char_test 라는 데이터베이스가있다면 삭제 */
drop database if exists char_test;
/* 삭제 데이터베이스 만약 있다면 char_test가 */

create database char_test;
use char_test;
set @num1=1;
set @num2=2;
select @num1 + @num2 as result;


