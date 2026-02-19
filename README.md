Tomcat.
================================


# Image description

Apache Tomcat docker image v8.5.40


# Building the Docker image

You can use the shipped `Makefile` to build the image,
example:

```bash
make all
````
Available arguments:
- build: build the docker image
- tag_latest: tag version to latest version
- all: apply build and tag_latest

Or you can build the docker image by:

```bash
docker build -t bdi/my-tomcat:latest  .
````

# Running as a standalone container

```bash
docker run -ti -p 8080:8080 bdi/my-tomcat
```

- 8080 : HTTP listening port

# Running as part of a Docker Compose application

```lang
tomcat1:
  image: bdi/my-tomcat
  ports:
    - "8080:8080"
```
