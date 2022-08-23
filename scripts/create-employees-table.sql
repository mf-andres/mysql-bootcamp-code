create table employees (
    id int not null, 
    last_name varchar(10) not null, 
    first_name varchar(10) not null, 
    middle_name varchar(10) null, 
    age int not null, 
    current_status varchar(10) not null default "employed",
    primary key (id)
)