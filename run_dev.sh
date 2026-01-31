#!/bin/bash

# Start Infrastructure
echo "🐳 Starting PostgreSQL and Redis..."
docker-compose up -d

# Wait for waiting (optional, but good for logs)
echo "⏳ Waiting for databases to initialize..."
sleep 5

# Check if Maven wrapper exists, if not, verify if mvn exists
if [ -f "./mvnw" ]; then
    echo "🚀 Building and Running Application with mvnw..."
    ./mvnw spring-boot:run
elif command -v mvn &> /dev/null; then
    echo "🚀 Building and Running Application with system maven..."
    mvn spring-boot:run
else
    echo "❌ Maven not found. Please install Maven or use an IDE to run the project."
    echo "ℹ️  Infrastructure is running (Postgres & Redis)."
    echo "👉 You can import this project into IntelliJ IDEA / Eclipse and run AuthServiceApplication.java"
fi
