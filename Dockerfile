FROM eclipse-temurin:17-jdk-alpine

WORKDIR /velocity

# Создаём папку для плагинов
RUN mkdir -p plugins

# Копируем Velocity и конфиги
COPY velocity-3.3.0-SNAPSHOT-436.jar ./velocity.jar
COPY velocity.toml ./velocity.toml
COPY forwarding.secret ./forwarding.secret

# Копируем плагины из папки plugins
COPY plugins/*.jar ./plugins/

# Открываем порт Minecraft
EXPOSE 25565

# Запускаем Velocity
CMD ["java", "-Xmx512M", "-Xms512M", "-XX:+UseG1GC", "-jar", "velocity.jar"]
