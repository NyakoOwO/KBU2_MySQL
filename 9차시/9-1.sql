create database school;
select *from students;
select *from grades;
alter table students add primary key(student_id);
alter table grades add primary key(grade_id);

alter table grades add constraint fk_grades_student 
foreign key(student_id) references students(student_id)
on delete cascade on update cascade;

show create table students;
show create table grades;

select s.name, s.major, g.subject, g.score 
from students s inner join grades g on s.student_id = g.student_id;

select s.name, avg(g.score) as subject_count 
from students s join grades g on s.student_id = g.student_id group by s.name；



