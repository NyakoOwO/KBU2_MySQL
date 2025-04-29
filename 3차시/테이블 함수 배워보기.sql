drop database if exists quest32;
create database quest32;
use quest32;

create table testtbl( id char(10), name varchar(10) not null);
alter table testtbl add constraint primary key(id);
select * from testtbl;
describe testtbl;


use test;
drop table if exists test2tbl;
create table test2tbl(
	tb2_id char(10), foreign key(tb2_id) references testtbl(id), 
    age int unique, 
    gender char(2) check(gender in ("F", "M")), 
    math int default 0);
alter table test2tbl add constraint foreign key(tb2_id) references testtbl(id);

select table_name, column_name, contraint_name, contraint_typ
from information_schema.key_column_useage
join information_schema.table_constraints
using(table_schema, table_name, constraint_name)
where table_name = "test2tbl";
select * from test2tbl;