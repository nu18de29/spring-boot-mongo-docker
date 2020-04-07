FROM openjdk:8u181-jdk-alpine AS build

# Required for starting application up.
#RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app
WORKDIR $PROJECT_HOME

#RUN cp /build/libs/spring-boot-mongo-1.0.jar $PROJECT_HOME/spring-boot-mongo.jar
#COPY *.jar $PROJECT_HOME/spring-boot-mongo.jar
COPY ./build/libs/spring-boot-mongo-1.0.jar $PROJECT_HOME/spring-boot-mongo.jar


#CMD ["java", "-Dspring.data.mongodb.uri=mongodb://mongo:27017/spring-mongo","-Djava.security.egd=file:/dev/./urandom","-jar","./spring-boot-mongo.jar"]
ENTRYPOINT ["java", "-Dspring.data.mongodb.uri=mongodb://mongo:27017/spring-mongo","-Djava.security.egd=file:/dev/./urandom","-jar","./spring-boot-mongo.jar"]

