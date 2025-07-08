# Étape 1 : Builder Maven multi-module
FROM maven:3.9.6-eclipse-temurin-21 AS builder

WORKDIR /build

# Copier les pom.xml pour téléchargement des dépendances
COPY pom.xml ./
COPY core/pom.xml core/
COPY persistence/pom.xml persistence/
COPY service/pom.xml service/
COPY webapp/pom.xml webapp/
COPY cli/pom.xml cli/

RUN mvn -B dependency:go-offline

# Copier le reste des sources
COPY . .

# Compiler le module webapp et ses dépendances
RUN mvn -pl webapp -am clean package -DskipTests

# Étape 2 : Image finale avec Tomcat
FROM tomcat:10.1-jdk21-temurin

# Supprimer les apps par défaut
RUN rm -rf /usr/local/tomcat/webapps/*

# Copier le WAR nommé "qlf.war" en tant que ROOT.war
COPY --from=builder /build/webapp/target/qlf.war /usr/local/tomcat/webapps/ROOT.war

# Exposer le port 8080
EXPOSE 8080

# Lancer Tomcat
CMD ["catalina.sh", "run"]
