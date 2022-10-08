docker run -p 80:80 --name nginx \
-v /mydata/nginx/html:/usr/share/nginx/html \
-v /mydata/nginx/logs:/var/log/nginx  \
-d nginx:alpine

docker cp nginx:/etc/nginx /mydata/nginx
mv /mydata/nginx/nginx /mydata/nginx/conf

docker stop nginx
docker rm nginx

docker run -p 80:80 -p 443:443 --name nginx \
-v /mydata/nginx/html:/usr/share/nginx/html \
-v /mydata/nginx/logs:/var/log/nginx  \
-v /mydata/nginx/conf:/etc/nginx \
-v /mydata/nginx/cert:/etc/nginx/cert \
-d nginx:alpine