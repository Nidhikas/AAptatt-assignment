FROM nginx:latest
MAINTAINER "nidhikashyap168@gmail.com"
RUN apt-get update && apt-get upgrade -y && apt-get install -y git
RUN apt-get update && apt-get upgrade -y && apt-get install -y openssh-server
RUN apt-get install -y net-tools
COPY target/sparkjava-hello-world-1.0.war /usr/share/nginx/html/
RUN chmod 777 /usr/share/nginx/html/sparkjava-hello-world-1.0.war
EXPOSE 80
ENTRYPOINT service nginx start && bash

