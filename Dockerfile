FROM maven:3.8

RUN mkdir /app
COPY pom.xml /app
COPY src /app/src

WORKDIR /app
RUN mvn package

CMD ["java", "-jar", "target/myproject-1.0-SNAPSHOT.jar"]
