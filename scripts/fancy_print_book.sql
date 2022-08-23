select 
concat(substring(title, 1, 10), "..."), 
concat(author_lname, ",", author_fname), 
concat(stock_quantity, " in stock")
from books;
