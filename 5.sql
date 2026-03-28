create table students(
    student_id serial primary key ,
    full_name varchar(100),
    major varchar(50)
);

create table courses(
    course_id serial primary key ,
    course_name varchar(100),
    credit int
);

create table enrollments(
    student_id int references students(student_id),
    course_id int references courses(course_id),
    score numeric(5,2)
);

--insert
INSERT INTO students (full_name, major) VALUES
    ('Nguyễn Khắc Thịnh', 'Information Technology'),
    ('Alice O''Connor', 'Data Science'),
    ('Trần Văn A', 'Mathematics'),
    ('Lê Thị B', 'Physics'),
    ('Cyber-Physicist @2026', 'Robotics'),
    ('Sinh Viên Chưa Có Ngành', NULL);

INSERT INTO courses (course_name, credit) VALUES
  ('Cấu trúc dữ liệu và Giải thuật', 3),
  ('Cơ sở dữ liệu', 3),
  ('Xác suất thống kê', 2),
  ('Lập trình nhúng', 4),
  ('Môn học cực khó 101', 1),
  ('Môn học dự phòng', 0);

INSERT INTO enrollments (student_id, course_id, score) VALUES
    (1, 1, 9.50),
    (1, 2, 8.80),
    (2, 1, 10.00),
    (3, 2, 0.00),
    (4, 3, 5.50),
    (1, 4, 7.25),
    (5, 4, 3.50),
    (2, 5, 1.00),
    (3, 1, 4.99);

--1: alias
select s.full_name "Tên sinh viên",c.course_name "Môn học",e.score "Điểm"
from courses c join enrollments e on c.course_id = e.course_id
join students s on s.student_id = e.student_id;
--2
--lọc theo id sinh viên trong enrollment
select student_id,avg(e.score) avg_score, max(e.score) max_score, min(e.score) min_score
from enrollments e
group by student_id;
--3:
select s.major, avg(e.score)
from enrollments e join students s on s.student_id = e.student_id
group by s.major
having avg(e.score) >7.5;
--4
select full_name,major,credit,score
from students join enrollments on students.student_id = enrollments.student_id
join courses on enrollments.course_id = courses.course_id;
--5
select full_name
from students join enrollments on students.student_id = enrollments.student_id
group by students.student_id,full_name
having avg(score) >
    (select avg(score)
    from enrollments);