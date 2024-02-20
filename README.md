# Docker

# Containers
- Each container must be build before launching it

# Dockerfile

<code style="color : Gold">**A dockerfile is simply a file that contains a bunch of instructions that will be read by Docker to assemble an image**</code>.
Those commands are the same that you can run on your terminal one by one to build an image.

- Every Dockerfile **"MUST START"** with the keyword. i.e "***FROM*** debian:buster" or "alpine:X.XX" (the penultimate stable
version of Alpine or Debian.)
- **"FROM" specifies which OS we want to use for the image**

- **RUN** tells Docker what command to run after creation of the container

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

# Basic Docker commands
## **Build An Image**
- `$> docker build < dockerFilePathDirectory > `
    - this will give you an image named "none"
- `$> docker build -t < image_name > < dockerFilePathDirectory >`
    - < image_name > will be the name of the image when you run next command

## **List Images**
- `$> docker image ls`

## **List Running Images**
- ` docker ps `
    - ` docker ps -a [including stopped images]`

## **Start An Image**
- `docker run <image_name>`
- `docker run -it <image_name>` (access terminal of container after launching it)

## Quit A Container's Terminal
- `exit`

---
---
---
---
# NGINX & SSL/TLS

### 1 - Installation
- `$> apt install nginx -y`
- `$> apt install openssl -y`
### 2 - Create a directory for storing cerificate and key
- `mkdir -p /etc/nginx/ssl`
### 3 - Generate the certificate and key
- `openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=CA/L=Mar/O=1337/OU=1337/CN=login.42.fr/UID=login"`

***PKCS#10 is a standard format for requesting X.509 certificates from the certification authorities.***

- **req** creates and treats certificate of format PKCS#10
- **-x509** certificate type
- **-nodes** creates the private key without a password
- **-out** specifies where to store the certificate
- **-keyout** specifies where to store the certificate key
- **-subj** to fill the required information for the certificate (see below)
    - Country Name (2 letter code) [AU]:
    - State or Province Name (full name) [Some-State]:
    - Locality Name (eg, city) []:
    - Organization Name (eg, company) [Internet Widgits Pty Ltd]:
    - Organizational Unit Name (eg, section) []:
    - Common Name (e.g. server FQDN or YOUR name) []:
    - Email Address []:


# More Commands:

**All docker commands starts with "docker"**

| Command     | Description                                                                   |
|-------------|-------------------------------------------------------------------------------|
| attach      | Attach local standard input, output, and error streams to a running container |
| build       | Build an image from a Dockerfile                                              |
| commit      | Create a new image from a container's changes                                 |
| cp          | Copy files/folders between a container and the local filesystem               |
| create      | Create a new container                                                        |
| diff        | Inspect changes to files or directories on a container's filesystem          |
| events      | Get real time events from the server                                          |
| exec        | Run a command in a running container                                          |
| export      | Export a container's filesystem as a tar archive                              |
| history     | Show the history of an image                                                  |
| images      | List images                                                                   |
| import      | Import the contents from a tarball to create a filesystem image               |
| info        | Display system-wide information                                               |
| inspect     | Return low-level information on Docker objects                                 |
| kill        | Kill one or more running containers                                           |
| load        | Load an image from a tar archive or STDIN                                      |
| login       | Log in to a Docker registry                                                    |
| logout      | Log out from a Docker registry                                                 |
| logs        | Fetch the logs of a container                                                  |
| pause       | Pause all processes within one or more containers                              |
| port        | List port mappings or a specific mapping for the container                    |
| ps          | List containers                                                               |
| pull        | Pull an image or a repository from a registry                                  |
| push        | Push an image or a repository to a registry                                    |
| rename      | Rename a container                                                            |
| restart     | Restart one or more containers                                                 |
| rm          | Remove one or more containers                                                  |
| rmi         | Remove one or more images                                                      |
| run         | Run a command in a new container                                               |
| save        | Save one or more images to a tar archive (streamed to STDOUT by default)      |
| search      | Search the Docker Hub for images                                               |
| start       | Start one or more stopped containers                                           |
| stats       | Display a live stream of container(s) resource usage statistics                |
| stop        | Stop one or more running containers                                            |
| tag         | Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE                         |
| top         | Display the running processes of a container                                   |
| unpause     | Unpause all processes within one or more containers                            |
| update      | Update configuration of one or more containers                                 |
| version     | Show the Docker version information                                            |
| wait        | Block until one or more containers stop, then print their exit codes            |


Run 'docker COMMAND --help' for more information on a command.

# Ressources
-   [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
-   [Docker CLI Interface](https://docs.docker.com/engine/reference/commandline/docker/)
-   [Docker Manuals](https://docs.docker.com/manuals/)
-   [Inception Tutorial](https://tuto.grademe.fr/inception)
-   [PKCS#10 certificate](http://www.pkiglobe.org/pkcs10.html)
-   [NGINX SSL Configuration Step by Step Details](https://ubiq.co/tech-blog/nginx-ssl-configuration-step-step-details/)