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