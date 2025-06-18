# Stage 1: Build the JAR
FROM maven:3.8.1-openjdk-8 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the JAR
FROM adoptopenjdk/openjdk11:alpine-jre
WORKDIR /app
COPY --from=build /app/thymeleafExample/target/work-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8086
CMD ["java", "-jar", "app.jar"]
