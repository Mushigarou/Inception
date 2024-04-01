include srcs/.env

all : clean createV compose

createV :
	mkdir ~/Desktop/data/wordpress ~/Desktop/data/mariadb 
up :
	make clean
	docker-compose -f srcs/docker-compose.yml up

nginx : ./srcs/requirements/nginx
	docker build -t nginx ./srcs/requirements/nginx
	docker run -p 443:443 nginx

maria : ./srcs/requirements/mariadb
	docker build -t mariadb ./srcs/requirements/mariadb
	docker run mariadb

wordpress : ./srcs/requirements/wordpress
	docker build -t wordpress ./srcs/requirements/wordpress
	docker run -it wordpress

compose :
	docker-compose -f srcs/docker-compose.yml up

# Removes all stopped containers
prune :
	docker stop $(shell docker ps -a -q)
	docker rm $(shell docker ps -a -q)
# docker container prune -f

rmimages :
	docker image rm $(shell docker image ls | awk 'NR >= 2 {print $$3}')
	rm -rf ~/Desktop/data/wordpress ~/Desktop/data/mariadb 

restartDockerDesktop :
# pkill -9 docker
	rm -rf ~/Library/Containers/com.docker.*
	sed -i '' 's/"filesharingDirectories": \[[^]]*\]/"filesharingDirectories": []/' ~/Library/Group\ Containers/group.com.docker/settings.json

clean : prune rmimages

re : clean all

.PHONY: clean re maria nginx all prune rmimages up compose