FROM eclipse-temurin:17-jdk-alpine

WORKDIR /velocity

# Создаём папку для плагинов
RUN mkdir -p plugins

# Копируем Velocity JAR (твой файл)
COPY velocity-3.4.0-SNAPSHOT-563.jar ./velocity.jar

# Копируем конфиги
COPY velocity.toml ./velocity.toml
COPY forwarding.secret ./forwarding.secret

# Копируем плагины
COPY plugins/*.jar ./plugins/

# Открываем порт
EXPOSE 25565

# Запускаем Velocity
CMD ["java", "-Xmx512M", "-Xms512M", "-XX:+UseG1GC", "-jar", "velocity.jar"]
