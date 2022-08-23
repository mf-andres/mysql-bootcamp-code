select author_lname, count(*) as count,
    case 
        when count = 1 then concat(count, " book") 
        when count > 1 then concat(count, " books") 
        else ""
    end as second_count
from books 
group by author_fname, author_lname;
