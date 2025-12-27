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