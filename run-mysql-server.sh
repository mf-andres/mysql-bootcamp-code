docker run \
    --name udemy-course-mysql \
    --mount type=volume,source=udemy-course-mysql-volume,target=/var/lib/mysql \
    -p 13306:3306 \
    -e MYSQL_ROOT_PASSWORD=root \
    -d mysql
