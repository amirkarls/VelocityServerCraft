FROM openjdk:17-jdk-slim

WORKDIR /velocity

RUN apt-get update && apt-get install -y wget && \
    wget -O velocity.jar https://api.papermc.io/v2/projects/velocity/versions/3.3.0-SNAPSHOT/builds/latest/downloads/velocity-3.3.0-SNAPSHOT.jar

COPY velocity.toml ./velocity.toml
COPY forwarding.secret ./forwarding.secret

EXPOSE 25565

CMD ["java", "-Xmx512M", "-Xms512M", "-jar", "velocity.jar"]
