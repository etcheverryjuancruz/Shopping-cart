FROM java:8
EXPOSE 8080
ADD /target/shopping_cart.jar shopping_cart.jar
ENV APP_HOME /var/www/html
COPY . APP_HOME
RUN apt-get update -y && apt-get install maven -y
RUN cd APP_HOME && mvn clean install
