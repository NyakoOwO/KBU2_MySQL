drop database Quest4;
create database Quest4;
use Quest4;

create table Q4 (
	Price int, Quantity tinyint
);

insert into Q4 values (
	15000, 9
);
insert into Q4 values (
	9000, 15
);
insert into Q4 values (
	25000, 7
);


select *from Q4;