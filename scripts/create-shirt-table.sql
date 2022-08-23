create table shirts (
    shirt_id int not null auto_increment, 
    article varchar(20) not null, 
    color varchar(20) not null, 
    shirt_size varchar(2) not null, 
    last_worn int not null, 
    primary key (shirt_id)
)