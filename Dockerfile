FROM eclipse-temurin:17-jdk-alpine

WORKDIR /velocity

RUN mkdir -p plugins

# Копируем Velocity JAR (твой файл velocity.jar)
COPY velocity.jar ./velocity.jar

# Копируем конфиги
COPY velocity.toml ./velocity.toml
COPY forwarding.secret ./forwarding.secret

# Копируем плагины
COPY plugins/*.jar ./plugins/

EXPOSE 25565

CMD ["java", "-Xmx512M", "-Xms512M", "-XX:+UseG1GC", "-jar", "velocity.jar"]
