FROM eclipse-temurin:21-jdk-alpine

WORKDIR /velocity

# Устанавливаем wget и curl
RUN apk add --no-cache wget curl

# Скачиваем последнюю версию Velocity 3.5.0-SNAPSHOT
RUN wget -O velocity.jar https://api.papermc.io/v2/projects/velocity/versions/3.5.0-SNAPSHOT/builds/latest/downloads/velocity-3.5.0-SNAPSHOT.jar

# Создаём папку для плагинов
RUN mkdir -p plugins

# Копируем конфиги и плагины из репозитория
COPY velocity.toml ./velocity.toml
COPY forwarding.secret ./forwarding.secret
COPY plugins/*.jar ./plugins/

# Открываем порт Minecraft
EXPOSE 25565

# Запускаем Velocity
CMD ["java", "-Xmx512M", "-Xms512M", "-XX:+UseG1GC", "-jar", "velocity.jar"]
