-- find the 5 oldest users
select username, created_at from users order by created_at asc limit 5;

-- what day of the week do most users register on?
select dayname(created_at) as register_day, count(*) as registrations from users group by register_day order by registrations desc;

-- find the users who have never posted a photo
select username from users left join photos on users.id = photos.user_id where photos.id is null;

-- find the most liked photo and its author
select image_url, count(*) as number_of_likes, username as author 
from photos 
join likes on photos.id = likes.photo_id 
join users on photos.user_id = users.id
group by photos.id 
order by number_of_likes desc limit 1;

-- how many times does the average user post
select 
(select count(*) from photos) 
/
(select count(*) from users) 
as avg_photos_per_user; 


-- what are the top 5 most used hashtags
select tag_name, count(tag_id) as tag_freq 
from photo_tags 
join tags on photo_tags.tag_id = tags.id 
group by tag_id 
order by tag_freq desc 
limit 5;

-- find users who have liked every single photo on the site
select user_id, number_of_liked_photos
from (
    select id as user_id, count(*) as number_of_liked_photos
    from users
    join likes on users.id = likes.user_id
    group by users.id
    order by number_of_liked_photos desc
) as users_by_number_of_photos_liked
where number_of_liked_photos = (
    select count(*) 
    from photos 
);

select username, count(*) as number_of_liked_photos
from users
join likes on users.id = likes.user_id
group by users.id
having number_of_liked_photos = (select count(*) from photos);