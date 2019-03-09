FROM java:8
ENV APP_HOME /var/www/html
COPY . $APP_HOME
RUN apt-get update -y && apt-get install maven -y
WORKDIR $APP_HOME
EXPOSE 8080
CMD ["java", "-jar", "/var/www/html/shopping_cart-0.0.1-snapshot.jar"]
