create database int_test;

/* 정수는 이렇게 4가지 보유 */
drop table int_table;
drop table int_table2;

create table int_table( /*테이블 생성*/
	t_i tinyint, s_i smallint, i int,  b_i bigint
);
select *from int_table;
insert into int_table values(127, 32767, 217432367, 9000000000000000);
insert into int_table2 values(127, 32767, 217132367, 9000000000000000); /* create table2 를 안만들었기 때문에 에러 발생 */
create table int_table2(
	t_i tinyint, s_i smallint, i int, b_i bigint
);
select *from int_table2; /*테이블 속성 확인*/

/* 고정 소숫점 */
drop table c_tbl;

create table c_tbl( one decimal( 65,3 ), tow float, three double);
insert into c_tbl values( 3.2, 5.915, 5.915);
select *from c_tbl;
