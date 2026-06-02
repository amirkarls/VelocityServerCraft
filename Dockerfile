FROM eclipse-temurin:17-jdk-alpine

WORKDIR /velocity

# Устанавливаем wget и скачиваем Velocity
RUN apk add --no-cache wget && \
    wget -O velocity.jar https://api.papermc.io/v2/projects/velocity/versions/3.3.0-SNAPSHOT/builds/latest/downloads/velocity-3.3.0-SNAPSHOT.jar

# Создаём папку для плагинов
RUN mkdir -p plugins

# Копируем конфиги и плагины (если они есть в репозитории)
COPY velocity.toml ./velocity.toml
COPY forwarding.secret ./forwarding.secret
COPY plugins/*.jar ./plugins/

# Открываем порт Minecraft
EXPOSE 25565

# Запускаем Velocity с оптимальными флагами
CMD ["java", "-Xmx512M", "-Xms512M", "-XX:+UseG1GC", "-jar", "velocity.jar"]
