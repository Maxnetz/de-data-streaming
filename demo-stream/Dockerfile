# ==========================================
# Stage 1: Build the application
# ==========================================
FROM eclipse-temurin:17-jdk-jammy AS builder
WORKDIR /app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
RUN chmod +x ./mvnw
RUN ./mvnw dependency:go-offline

COPY src src
RUN ./mvnw clean package -DskipTests

# ==========================================
# Stage 2: Production Runtime Environment
# ==========================================
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

# Create a non-root user and group
RUN addgroup --system spring && adduser --system --ingroup spring spring

# Copy the jar and change ownership to the non-root user
COPY --from=builder --chown=spring:spring /app/target/*.jar app.jar

# Run the container as the non-root user
USER spring:spring

EXPOSE 8080

# Use array syntax and add JVM container support flags
ENTRYPOINT ["java", "-XX:MaxRAMPercentage=75.0", "-XX:+UseG1GC", "-jar", "app.jar"]