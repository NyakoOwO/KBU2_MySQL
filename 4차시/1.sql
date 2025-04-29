show index from persontbl;
show index from buytbl;
explain select * from persontbl
where name like "유_석";
# 띄어쓰기도 포함
create index idx_name on persontbl(name);

explain select * from persontbl
where name like "%석";

select distinct product_name from buytbl;
select distinct name, telephone1 from persontbl;