FROM java:8
VOLUME /tmp
ARG JAR_FILE
COPY shopping_cart.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]