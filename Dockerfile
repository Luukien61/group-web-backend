#BUILD STAGE
FROM gradle:8.5-jdk17-alpine as build
WORKDIR /app
COPY . .
RUN gradle bootJar

FROM openjdk:17-alpine
MAINTAINER luukien
WORKDIR /app
COPY --from=build /app/build/libs/*.jar /app/app.jar
COPY src/main/resources/static/security.txt /app/security.txt
RUN chmod 0744 -R /app
EXPOSE 8088
CMD java -jar app.jar