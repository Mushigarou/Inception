# Dockerfile

- Every Dockerfile starts with the command 'FROM ....'
    - Build
        - $> docker build path_to_dockerfile
        - $> docker build -t <image_name> path_to_dockerfile [<image_name> will be the name of the image when you run next command]
    - List images
        - $> docker image ls
    - Running images
        - docker ps
        - docker ps -a [including stopped images]
    - Start an image
        docker run <image_name>