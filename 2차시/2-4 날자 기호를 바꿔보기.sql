create database Quest3;
use Quest3;

create table To_Date (
	date char(6)
);


/*------------------------------------------------------------------------------*/
drop database Quest3;
create database Quest3;
use Quest3;

select cast(
	"2012.3.4" as date
) "날짜";

