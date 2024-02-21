all : maria

nginx : ./srcs/requirements/nginx
	docker build -t nginx ./srcs/requirements/nginx
	docker run -it -p 443:443 --name nginx_we nginx

maria : ./srcs/requirements/mariadb
	docker build -t mariadb ./srcs/requirements/mariadb
	docker run -it mariadb

clean :
	docker stop nginx_we
	docker stop mariadb
	docker system prune

re : clean all

.PHONY: clean re maria nginx all