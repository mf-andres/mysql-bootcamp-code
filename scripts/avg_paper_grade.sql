select first_name, avg(ifnull(grade, 0)) as average 
from students 
left join papers 
on students.id = papers.student_id
group by first_name
order by average desc;