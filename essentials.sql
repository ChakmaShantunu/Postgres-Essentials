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