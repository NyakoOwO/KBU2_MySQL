create database Quest1;
use Quest1;

drop table Q1;
create table Q1 ( 
	num1 int, num2 decimal(10, 2)
);
insert into Q1 values( 2, 2.5 );
select num1 * num2 as result;