# Inception

This is a functional wordpress site, that runs by using the technology of Docker and docker compose tool.

# Containers

1 - Nginx

2 - Wordpres / PHP

3 - MariaDB

# Basic Docker commands
## **Build An Image**
```bash
# this will give you an image named "none"
$> docker build <Dockerfile_Path_Directory>
```
```bash
# <image_name> will be the name of the image when you run next command
$> docker build -t <image_name> <Dockerfile_Path_Directory>
```

## **List Images**
- `$> docker image ls`

## **List Running Images**
- ` docker ps `
    - ` docker ps -a [including stopped images]`

## **Start An Image**
- `docker run <image_name>`
- `docker run -it <image_name>` (access terminal of container after launching it)

# Ressources
## Docker
-   [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
-   [Docker CLI Interface](https://docs.docker.com/engine/reference/commandline/docker/)
-   [Docker Manuals](https://docs.docker.com/manuals/)
-   [Docker Cleanning Commands](https://www.warp.dev/terminus/docker-remove-stopped-containers#:~:text=Removing%20all%20stopped%20containers%20using,using%20their%20name%20or%20ID.)

## Others
-   [Inception Tutorial](https://tuto.grademe.fr/inception)

## NGINX
-   [PKCS#10 certificate](http://www.pkiglobe.org/pkcs10.html)
-   [NGINX SSL Configuration Step by Step Details](https://ubiq.co/tech-blog/nginx-ssl-configuration-step-step-details/)
-   [Configuring NGINX and NGINX Plus as a Web Server](https://docs.nginx.com/nginx/admin-guide/web-server/web-server/)

## MariaDB
-   [MariaDB Training & Tutorials](https://mariadb.com/kb/en/training-tutorials/)

## php
-   [How To Install PHP 7.4 on Debian 10 / Debian 9](https://computingforgeeks.com/how-to-install-latest-php-on-debian/)

## Wordpress
-   [How to Install WordPress on Debian 10/11 (Step by Step)](https://cloudinfrastructureservices.co.uk/install-wordpress-on-debian-10-11/)
-   [Install and configure WordPress](https://ubuntu.com/tutorials/install-and-configure-wordpress#1-overview)
-   [Install WordPress Using WP-CLI on Debian 10](https://www.linode.com/docs/guides/how-to-install-wordpress-using-wp-cli-on-debian-10/)
-   [Server Environment For Wordpress (Web Server && PHP && Database](https://make.wordpress.org/hosting/handbook/server-environment/#php-extensions)
-   [How To Install WordPress With Docker Compose](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose)

  # Dockerfile

| Instruction | Description                                        |
|-------------|----------------------------------------------------|
| ADD         | Add local or remote files and directories.         |
| ARG         | Use build-time variables.                          |
| CMD         | Specify default commands.                           |
| COPY        | Copy files and directories.                        |
| ENTRYPOINT  | Specify default executable.                        |
| ENV         | Set environment variables.                         |
| EXPOSE      | Describe which ports your application is listening on. |
| FROM        | Create a new build stage from a base image.        |
| HEALTHCHECK | Check a container's health on startup.             |
| LABEL       | Add metadata to an image.                          |
| MAINTAINER  | Specify the author of an image.                    |
| ONBUILD     | Specify instructions for when the image is used in a build. |
| RUN         | Execute build commands.                            |
| SHELL       | Set the default shell of an image.                 |
| STOPSIGNAL  | Specify the system call signal for exiting a container. |
| USER        | Set user and group ID.                             |
| VOLUME      | Create volume mounts.                              |
| WORKDIR     | Change working directory.                          |
