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