FROM nginx:latest
MAINTAINER "nidhikashyap168@gmail.com"
RUN apt-get update && apt-get upgrade -y && apt-get install -y git
RUN apt-get update && apt-get upgrade -y && apt-get install -y openssh-server
RUN apt-get install -y net-tools
COPY src/main/webapp/WEB-INF/web.xml /usr/share/nginx/html/
RUN chmod 644 /usr/share/nginx/html/web.xml
EXPOSE 8000
ENTRYPOINT service nginx start && bash

