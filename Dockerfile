FROM openjdk:8-jdk-alpine

#RUN echo http://download.nus.edu.sg/mirror/alpine/v3.8/main > /etc/apk/repositories; \
   # echo http://download.nus.edu.sg/mirror/alpine/v3.8/community >> /etc/apk/repositories
    
# Required for starting application up.
#RUN apk update && apk add --no-cache
#RUN apk update && apk add /bin/sh
RUN apk add --no-cache bash

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/spring-boot-mongo-1.0.jar $PROJECT_HOME/spring-boot-mongo.jar

WORKDIR $PROJECT_HOME

CMD ["java", "-Dspring.data.mongodb.uri=mongodb://mongo:27017/spring-mongo","-Djava.security.egd=file:/dev/./urandom","-jar","./spring-boot-mongo.jar"]
