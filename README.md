# 🔐 Auth Service / API Gateway

A robust, production-ready Authentication and Authorization microservice built with Spring Boot. Designed with a **security-first mindset**, handling identity management, JWT issuance, rate limiting, and audit logging.

## 🚀 Features

- **Authentication**: Secure Login & Registration with BCrypt password hashing.
- **JWT Authorization**: Stateless authentication using JSON Web Tokens (256-bit signature).
- **Role-Based Access Control (RBAC)**: Fine-grained permission management (User/Admin).
- **Rate Limiting**: Redis-backed leaky bucket algorithm (Bucket4j) to prevent DDoS and brute-force attacks.
- **API Key Management**: Secure access for third-party integrations.
- **Audit Logging**: Async processing of security events for compliance and monitoring.
- **Database**: PostgreSQL for reliable data persistence.

## 🛠 Tech Stack

- **Core**: Java 17, Spring Boot 3.2
- **Security**: Spring Security 6, JWT (jjwt)
- **Data**: Spring Data JPA, Hibernate, PostgreSQL
- **Caching/Limiting**: Redis, Bucket4j
- **Build**: Maven

## 🔧 Setup & Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/auth-service.git
   cd auth-service
   ```

2. **Configure Database & Redis**
   Ensure PostgreSQL (port 5432) and Redis (port 6379) are running.
   Update `src/main/resources/application.properties` if credentials differ.

3. **Build and Run**
   ```bash
   mvn clean install
   mvn spring-boot:run
   ```

## 📖 API Endpoints

### Auth
- `POST /api/auth/register` - Create new user account
- `POST /api/auth/login` - Authenticate and receive JWT

### Security
- All other endpoints require `Authorization: Bearer <token>` header.

## 🛡️ Security Measures
- **BCrypt** for password encryption (strength 10).
- **Stateless Session** management.
- **Rate Limiting** applied to public endpoints to mitigate abuse.
