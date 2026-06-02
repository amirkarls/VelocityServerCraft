FROM eclipse-temurin:17-jdk-alpine

WORKDIR /velocity

RUN apk add --no-cache wget curl

# Скачиваем Velocity с официального источника (ССЫЛКА ИСПРАВЛЕНА)
RUN wget -O velocity.jar https://versions.velocitypowered.com/download/3.3.0.jar

# Создаём папку для плагинов
RUN mkdir -p plugins

# Копируем конфиги и плагины
COPY velocity.toml ./velocity.toml
COPY forwarding.secret ./forwarding.secret
COPY plugins/*.jar ./plugins/

EXPOSE 25565

CMD ["java", "-Xmx512M", "-Xms512M", "-XX:+UseG1GC", "-jar", "velocity.jar"]
