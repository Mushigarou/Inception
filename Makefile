all : createV compose

# Compose
createV :
	mkdir -p /home/${USER}/data /home/${USER}/data/wordpress /home/${USER}/data/mariadb

compose :
	docker-compose -f srcs/docker-compose.yml up

# Cleanning
prune :
	docker stop $(shell docker ps -a -q)
	docker rm $(shell docker ps -a -q)

rmimages :
	docker image rm $(shell docker image ls | awk 'NR >= 2 {print $$3}')

rmdir :
	rm -rf /home/${USER}/data/wordpress /home/${USER}/data/mariadb 

rmVolumes :
	docker volume rm $(shell docker volume ls -q)

pruneH :
	$(shell docker container prune -f)

clean : rmVolumes rmimages rmdir

fclean : prune clean

re : clean all

.PHONY: all createV compose prune rmimages rmVolumes pruneH rmdir clean fclean re 
