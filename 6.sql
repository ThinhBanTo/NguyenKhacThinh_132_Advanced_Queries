create table departments(
    dept_id serial primary key ,
    dept_name varchar(100)
);

create table employees(
    emp_id serial primary key ,
    emp_name varchar(100),
    dept_id int references departments(dept_id),
    salary numeric(10,2),
    hire_date date
);

create table projects(
    project_id serial primary key ,
    project_name varchar(100),
    dept_id int references departments(dept_id)
);

--insert du lieu
INSERT INTO departments (dept_name) VALUES
            ('Phòng Kỹ Thuật'),
            ('Phòng Nhân Sự'),
            ('Phòng Marketing'),
            ('Ban Giám Đốc'),
            ('R&D - Nghiên cứu và Phát triển'),
            ('A');

INSERT INTO employees (emp_name, dept_id, salary, hire_date) VALUES
     ('Nguyễn Văn An', 1, 15000000.00, '2020-01-15'),
     ('Trần Thị Bình', 2, 12500.50, '2021-05-20'),
     ('Lê Văn Cường', 1, 99999999.99, '2019-12-31'),
     ('Phạm Minh Đức', NULL, 8000000.00, '2023-10-10'),
     ('O''Connor', 3, 20000000.00, '2022-02-28'),
     ('Lý Tiểu Long', 5, 0.00, '2024-01-01'),
     ('Hoàng Xuân Vinh', 4, 50000000.00, '1990-01-01');

INSERT INTO projects (project_name, dept_id) VALUES
     ('Hệ thống ERP nội bộ', 1),
     ('Chiến dịch tuyển dụng 2024', 2),
     ('Nâng cấp hạ tầng mạng', 1),
     ('Tái cấu trúc bộ máy', 4),
     ('Dự án Bí Mật X', 5),
     ('Website Công Ty v2.0', 3);
--1: alias
select e.emp_name,d.dept_name,e.salary
from employees e join departments d on e.dept_id = d.dept_id;
--2: aggregate function
select sum(salary),avg(salary),max(salary),min(salary),count(*) from employees;
--3: GROUP BY / HAVING
select d.dept_name ,avg(e.salary)
from employees e right join departments d on e.dept_id = d.dept_id
group by d.dept_name
having avg(e.salary)>15000000;
--4: join (3 bảng)
select p.project_name,d.dept_name, e.emp_name
from departments d
join employees e on d.dept_id = e.dept_id
join projects p on d.dept_id = p.dept_id;
--5: subquery
--lay id phong ban va luong cao nhat
--lay nhan vien thuoc (id phong ban va luong cao nhat ay)
select e.emp_name,d.dept_name,e.salary
from employees e join departments d on e.dept_id=d.dept_id
where (e.salary,d.dept_id) in
    (
        select max(e.salary),e.dept_id
        from employees e
        group by e.dept_id
    );


