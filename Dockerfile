FROM openjdk:8-jdk-alpine
RUN addgroup -S devops && adduser -S jetcheverry193 -G devops
USER jetcheverry193:devops
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","controller.Application"]