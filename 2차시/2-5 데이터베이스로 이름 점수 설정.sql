create database Quest2;
use Quest2;

drop table Q2;
create table Q2(
	user_Ntext char(8), user_name char, user_Stext char, user_score int
);
set user_name= "원더우면";
set user_score= 90;
insert into Q2 values( 
	"이름:", "", "점수:", ""
);

select *from Q2;

/*------------------------------------------------------------------------------*/
drop database Quest2;
create database Quest2;
use Quest2;

-- 한국어는 2~3 Byte 영어는 1Byte
create table mem_score(
	name char(8), score tinyint
);

insert into mem_score values(
	"슈퍼맨", 90
);
insert into mem_score values(
	"원더우면", 80
);
insert into mem_score values(
	"펭수", 97
);

set @text = "이름: ";
set @score = "점수: ";

select @text, name, @score, score from mem_score;

-- 95점 이상인 사람만 출력
set @max= 95;
select @text, name, @score, score FROM mem_score WHERE score > @max;

-- 점수 평균 확인하기
select avg(score) "평균: " from mem_score;


