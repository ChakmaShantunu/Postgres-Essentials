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