all : nginx

nginx : ./srcs/requirements/nginx
	docker build -t nginx ./srcs/requirements/nginx
	docker run -it -p 443:443 --name nginx_we nginx

clean :
	docker stop nginx_we
	docker system prune

re : clean all