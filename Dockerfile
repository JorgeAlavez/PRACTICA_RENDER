# =======================================================
# FASE 1: BUILD (Compilación y Generación del JAR)
FROM eclipse-temurin:21-jdk-jammy AS build

WORKDIR /app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# *** LÍNEA CRÍTICA A AÑADIR ***
RUN chmod +x mvnw

# Descarga las dependencias
RUN ./mvnw dependency:go-offline -B

# Copia el código fuente
COPY src src

# Compila el proyecto y genera el JAR ejecutable
RUN ./mvnw install -DskipTests
# Compila el proyecto y genera el JAR ejecutable
RUN ./mvnw install -DskipTests

# =======================================================
# FASE 2: RUN (Ejecución del JAR)
FROM eclipse-temurin:21-jre-jammy

EXPOSE 10000 

# ¡CORRECCIÓN! Usar render-api en lugar de PractRender
COPY --from=build /app/target/render-api-0.0.1-SNAPSHOT.jar app.jar 

ENTRYPOINT ["java", "-jar", "app.jar"]