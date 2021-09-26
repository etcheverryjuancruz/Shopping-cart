FROM openjdk:8-jdk-alpine
RUN addgroup -S devops && adduser -S jetcheverry193 -G devops
USER jetcheverry193:devops
COPY target/shopping_cart.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]