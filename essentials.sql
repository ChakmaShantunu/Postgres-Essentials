--Handling NULL With COALESCE
select
    *
from
    students
where
    email is null;

select
    *
from
    students
where
    email is not null;

select
    first_name,
    coalesce(email, 'Not Provided')
from
    students;

select
    *
from
    students
limit
    5;

select
    *
from
    students
offset
    5;

select
    *
from
    students
limit
    5
offset
    0;

select
    *
from
    students
limit
    5
offset
    5;

select
    *
from
    students
limit
    5
offset
    10;

update students
set
    email = 'default@gmail.com'
where
    email is null;

--Update
update students
set
    grade = 'A+'
where
    email = 'labiba.parvin@example.com';

--delete
delete from students
where
    email = 'imran.hasan@example.com';

-- Group by
select
    country,
    count(*)
from
    students
group by
    country;

select
    country
from
    students
group by
    country;

select
    grade,
    sum(age) as students_age
from
    students
group by
    grade;

select
    country,
    avg(age) as students_age
from
    students
group by
    country;

select
    grade,
    count(*)
from
    students
group by
    grade
having
    count(*) >= 2;

-- Group by having
select
    country,
    count(*)
from
    students
group by
    country
having
    count(*) >= 2;

--Foreign Key Explained
create table
    users (id int primary key, name varchar(50));

create table
    orders (
        id int primary key,
        user_id int,
        amount int,
        Foreign key (user_id) references users (id)
    );

-- Adding Foreign Key Constraint
--post table
create table
    post (
        id serial primary key,
        title text not null,
        user_id int references users (id)
    );

--insert users
INSERT INTO
    users (name)
VALUES
    ('rahim'),
    ('karim'),
    ('salma'),
    ('rafi'),
    ('mina');

--insert posts
INSERT INTO
    post (title, user_id)
VALUES
    ('My first post', 1),
    ('Learning SQL', 2),
    ('Foreign Key Explained', 3),
    ('Backend Journey', 1),
    ('PostgreSQL Basics', 4);

--User name + post title
select
    users.name,
    post.title
from
    users
    inner join post on users.id = post.user_id;

select
    title,
    name
from
    post
    join users on post.user_id = users.id;

--User name + orders amount
select
    users.name,
    orders.amount
from
    users
    inner join orders on users.id = orders.user_id;

select
    amount,
    name
from
    orders
    join users on orders.user_id = users.id;

--left join
select
    users.id,
    users.name,
    post.title
from
    users
    left join post on users.id = post.user_id;

--Right join
SELECT
    users.id,
    users.name,
    post.title
FROM
    users
    RIGHT JOIN post ON users.id = post.user_id;

--full join
SELECT
    users.id,
    users.name,
    post.title
FROM
    users
    FULL JOIN post ON users.id = post.user_id;

--right join
SELECT
    users.id,
    users.name,
    post.title
FROM
    users
    RIGHT JOIN post ON users.id = post.user_id;

--full join
SELECT
    users.id,
    users.name,
    post.title
FROM
    users
    FULL JOIN post ON users.id = post.user_id;

-- All Joins Overview (Cross & Natural Too)
create table
    employees (emp_id int, emp_name varchar(50), dept_id int);

create table
    departments (dept_id int, dept_name varchar(50));

INSERT INTO
    employees (emp_id, emp_name, dept_id)
VALUES
    (101, 'Alice Johnson', 1),
    (102, 'Bob Smith', 2),
    (103, 'Charlie Brown', 3),
    (104, 'Diana Prince', 4),
    (105, 'Ethan Hunt', 5),
    (106, 'Fiona Gallagher', 1),
    (107, 'George Martin', 2),
    (108, 'Hannah Baker', 3),
    (109, 'Ian Somerhalder', 4),
    (110, 'Jane Doe', 5);

INSERT INTO
    departments (dept_id, dept_name)
VALUES
    (1, 'Human Resources'),
    (2, 'Finance'),
    (3, 'Marketing'),
    (4, 'IT'),
    (5, 'Sales');

select
    *
from
    employees;

select
    *
from
    departments;

--cross join
select
    *
from
    employees
    cross join departments;

--natural join
select
    *
from
    employees
    natural join departments;

create table
    employees (
        emp_id serial primary key,
        emp_name varchar(50),
        dept_id int references departments (dept_id),
        salary decimal(10, 2),
        hire_date date
    );

create table
    departments (dept_id serial primary key, dept_name varchar(50));

INSERT INTO
    employees (emp_name, dept_id, salary, hire_date)
VALUES
    ('Alice Johnson', 1, 50000.00, '2022-01-10'),
    ('Bob Smith', 2, 60000.50, '2021-12-05'),
    ('Charlie Brown', 3, 45000.75, '2022-03-15'),
    ('Diana Prince', 4, 70000.00, '2021-11-20'),
    ('Ethan Hunt', 5, 48000.25, '2022-02-01'),
    ('Farhan Rahman', 6, 52000.00, '2022-04-10'),
    ('Grace Lee', 7, 40000.50, '2022-05-05'),
    ('Hasan Mahmud', 8, 55000.00, '2021-10-25'),
    ('Ishrat Jahan', 9, 80000.99, '2020-09-30'),
    ('Jahid Hasan', 10, 58000.00, '2021-08-18');

INSERT INTO
    departments (dept_id, dept_name)
VALUES
    (1, 'Human Resources'),
    (2, 'Finance'),
    (3, 'Marketing'),
    (4, 'IT'),
    (5, 'Sales'),
    (6, 'Operations'),
    (7, 'Customer Support'),
    (8, 'Administration'),
    (9, 'Research and Development'),
    (10, 'Quality Assurance');

-- Inner join to retrieve employee and department information"
select
    *
from
    employees as e
    inner join departments as d on e.dept_id = d.dept_id;

--simple and short
select
    *
from
    employees
    join departments using (dept_id);

select
    dept_id,
    dept_name
from
    departments
    left join employees using (dept_id)
where
    emp_id is null;

--Show department name with Avarage Salary
select
    dept_name,
    round(avg(salary))
from
    employees
    inner join departments using (dept_id)
group by
    dept_name;

--count employees in each department
select
    dept_name,
    count(*)
from
    employees
    inner join departments using (dept_id)
group by
    dept_name;

--Find the department name with the highest avarage salary
select
    dept_name,
    round(avg(salary)) as avg_salary
from
    employees
    inner join departments using (dept_id)
group by
    dept_name
order by
    avg_salary desc;

--count employees hired each year
select
    extract(
        year
        from
            hire_date
    ) as hired_year,
    count(*)
from
    employees
group by
    hired_year;

--find which employe gets the highest salary with subquery
select
    *
from
    employees
where
    salary = (
        select
            max(salary)
        from
            employees
    );

--find employees who earn more than the average salary
select
    *
from
    employees
where
    salary > (
        select
            avg(salary)
        from
            employees
    );

--Name of the employee who gets the highest salary in the department id 2
select
    emp_name,
    salary
from
    employees
where
    salary = (
        select
            max(salary)
        from
            employees
        where
            dept_id = 2
    );