all : maria

nginx : ./srcs/requirements/nginx
	docker build -t nginx ./srcs/requirements/nginx
	docker run -it -p 443:443 --name nginx_we nginx

maria : ./srcs/requirements/mariadb
	docker build -t mariadb ./srcs/requirements/mariadb
	docker run -it mariadb

# Removes all stopped containers
prune :
	docker container prune -f
	cclean

rmimages :
	docker image rm $(docker image ls | awk 'NR >= 2 {print $3}')

restartDockerDesktop :
	pkill -9 docker
	rm -rf ~/Library/Containers/com.docker.*
	sed -i '' 's/"filesharingDirectories": \[[^]]*\]/"filesharingDirectories": []/' ~/Library/Group\ Containers/group.com.docker/settings.json

clean : prune rmimages

re : clean all

.PHONY: clean re maria nginx all prune rmimages