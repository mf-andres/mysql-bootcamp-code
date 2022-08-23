select title, author_lname, 
    case 
        when title like %stories% then "Short Stories"
        when title in ("Just Kids", "A Heartbreaking Work") then "Memoir"
        else "Novel"
    end as type
from books;