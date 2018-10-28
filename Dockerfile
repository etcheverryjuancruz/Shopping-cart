FROM java:8
EXPOSE 8080
ADD /target/shopping_cart.jar shopping_cart.jar
ENTRYPOINT ["java","-jar","shopping_cart.jar"]