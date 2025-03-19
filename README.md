# SchedU

SchedU is a scheduling web application built using **PHP Laravel**. It provides a structured way to manage and organize schedules efficiently.

## Technologies Used
- 🚀 **PHP 8.x** (Laravel Framework)
- 🌐 **Apache** (Web Server)
- 🛢 **MySQL** (Database)
- 📦 **Docker & Docker Compose** (Containerization)

## Project Structure
```
SchedU/
├── docker/
│   ├── php/
│   │   ├── Dockerfile  
│   │   └── php.ini
│   └── apache/
│       └── 000-default.conf
├── docker-compose.yml
├── .env
```

## Setting Up the Project with Docker

To run the project using **Docker**, follow these steps:

### 1. 📄 Copy the environment file
```sh
cp .env.example .env
```
This command copies the example environment configuration to `.env`, which will be used by Laravel.

### 2. 🏗 Build and start the containers
```sh
docker-compose up -d --build
```
This command builds the Docker images and starts the containers in detached mode.

### 3. 📦 Install dependencies
```sh
docker-compose exec app composer install
```
Installs Laravel and project dependencies using **Composer** inside the running container.

### 4. 🔑 Generate the application key
```sh
docker-compose exec app php artisan key:generate --force
```
Generates a unique application key for Laravel, ensuring secure encryption.

### 5. 🗄 Run database migrations and seed the database
```sh
docker-compose exec app php artisan migrate --seed
```
Runs Laravel database migrations and seeds the database with initial data.

### 6. 🔐 Set permissions for storage and cache
```sh
docker-compose exec app chmod -R 775 storage bootstrap/cache
docker-compose exec app chown -R www-data:www-data storage bootstrap/cache
```
Sets appropriate permissions for the **storage** and **cache** directories to allow Laravel to function correctly.

## Notes
- ⚠ Ensure **Docker** and **Docker Compose** are installed on your system before running the setup.
- 📝 The `.env` file must be correctly configured for the application to connect to the database and other services.

---
This guide ensures a smooth setup of **SchedU** using Docker. 🚀

