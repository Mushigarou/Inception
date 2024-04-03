include srcs/.env

all : createV compose

createV :
	mkdir -p /Users/${USER}/Desktop/data /Users/${USER}/Desktop/data/wordpress /Users/${USER}/Desktop/data/mariadb

compose :
	docker-compose -f srcs/docker-compose.yml up

prune :
	docker stop $(shell docker ps -a -q)
	docker rm $(shell docker ps -a -q)

rmimages :
	docker image rm $(shell docker image ls | awk 'NR >= 2 {print $$3}')

rmdir :
	rm -rf /Users/${USER}/Desktop/data/wordpress /Users/${USER}/Desktop/data/mariadb 

rmVolumes :
	docker volume rm $(shell docker volume ls -q)

pruneH :
	$(shell docker container prune -f)

clean : rmVolumes rmimages rmdir

fclean : prune clean

re : clean all

.PHONY: clean re maria nginx all prune rmimages up compose pruneH rmVolumes
