FROM eclipse-temurin:21-jdk-alpine

WORKDIR /velocity

# Создаём папку для плагинов
RUN mkdir -p plugins

# Копируем Velocity JAR из репозитория
COPY velocity-3.5.0-SNAPSHOT-600.jar ./velocity.jar

# Копируем конфиги и плагины
COPY velocity.toml ./velocity.toml
COPY forwarding.secret ./forwarding.secret
COPY plugins/*.jar ./plugins/

# Открываем порт Minecraft
EXPOSE 25565

# Запускаем Velocity
CMD ["java", "-Xmx512M", "-Xms512M", "-XX:+UseG1GC", "-jar", "velocity.jar"]
