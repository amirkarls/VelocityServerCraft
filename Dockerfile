FROM eclipse-temurin:17-jdk-alpine

WORKDIR /velocity

# Устанавливаем wget и curl
RUN apk add --no-cache wget curl

# Скачиваем последнюю стабильную версию Velocity 3.3.0
RUN wget -O velocity.jar https://repo.papermc.io/repository/maven-public/com/velocitypowered/velocity-proxy/3.3.0/velocity-proxy-3.3.0.jar

# Создаём папку для плагинов
RUN mkdir -p plugins

# Копируем конфиги и плагины
COPY velocity.toml ./velocity.toml
COPY forwarding.secret ./forwarding.secret
COPY plugins/*.jar ./plugins/

# Открываем порт Minecraft
EXPOSE 25565

# Запускаем Velocity
CMD ["java", "-Xmx512M", "-Xms512M", "-XX:+UseG1GC", "-jar", "velocity.jar"]
