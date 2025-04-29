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

select s.name, s.major, g.subject, g.score from students s 
inner join grades g on s.student_id = g.student_id;

select s.name, avg(g.score) as subject_count from students s 
join grades g on s.student_id = g.student_id group by s.name;

select s.name, count(g.subject) as subject_count from students s
join grades g on s.student_id = g.student_id group by name having subject_count;

select s.name, g.subject, g.score from grades g 
join students s on g.student_id =s.student_id where(g.subject, g.score) in (
	select subject, max(score) from grades group by subject
);

select s.name, s.major, g.subject, g.score from students s
right join grades g on s.student_id = g.student_id;


select s.name from students s left join grades g on s.student_id = g.student_id
where g.student_id is null;

select s.name from students s left join grades g on s.student_id = g.student_id
group by s.name having count(g.subject) <= 1;

select g.subject, count(s.stdent_id) as student_count from students s 
right join grades g on s.student_id = g.student_id group by g.subject;

select s.name, ifnull(g.subject, '성적 없음') as subject, ifnull(g.score, 0) as score from students s
left join grades g on s.student_id = g.student_id;

select a.name as 학생1, b.name as 학생2 from students a
join students b on a.student_id = b.student_id;

select b.name, b.major from students s
join students b on a.student_id;

select g1.student_id, g2.student_id from grades g1
join grades g2 on g1.subject = g2.subject where g1.subject = 'DB' and g1.student_id < g2.student_id;	

select g1.student_id, g2.student_id, g1.subject from grades g1
join grades g2 on g1.subject = g2.subject where g1.score <> g2.score and g1.student_id < g2.student_id;