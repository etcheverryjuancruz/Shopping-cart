FROM openjdk:8-jdk-alpine
RUN addgroup -S devops && adduser -S jetcheverry193 -G devops
USER jetcheverry193:devops
ARG JAR_FILE=target/shopping_cart.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]