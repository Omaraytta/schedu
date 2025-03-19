# SchedU

SchedU is a scheduling web application built using **PHP Laravel**. It provides a structured way to manage and organize schedules efficiently.

## 🚀 Technologies Used
- 🐘 **PHP 8.x** (Laravel Framework)
- 🌐 **Apache** (Web Server)
- 🗄️ **MySQL** (Database)
- 🐳 **Docker & Docker Compose** (Containerization)

## 📂 Project Structure
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

## 🛠️ Setting Up the Project with Docker

To run the project using **Docker**, follow these steps:

### 1️⃣ Automated Setup (Recommended)
You can run the setup script to automate the installation and setup process:
```sh
./setup.sh
```
This will install **Docker & Docker Compose**, build the containers, install dependencies, set up the database, and configure permissions automatically.

---

### 2️⃣ Manual Setup (Step-by-Step)
If you prefer a manual setup, follow these steps:

#### 🏗️ 2.1 Install Docker & Docker Compose
Ensure **Docker** and **Docker Compose** are installed on your system. You can install them using:

```sh
# Install Docker
sudo apt-get update
sudo apt-get install docker.io

# Install Docker Compose
sudo apt-get install docker-compose
```

#### 🏗️ 2.2 Build and start the containers
```sh
docker-compose up -d --build
```
This command builds the Docker images and starts the containers in detached mode.

#### 📦 2.3 Install dependencies
```sh
docker-compose exec app composer install
```
Installs Laravel and project dependencies using **Composer** inside the running container.

#### 🔑 2.4 Generate the application key
```sh
docker-compose exec app php artisan key:generate --force
```
Generates a unique application key for Laravel, ensuring secure encryption.

#### 🗄️ 2.5 Run database migrations and seed the database
```sh
docker-compose exec app php artisan migrate --seed
```
Runs Laravel database migrations and seeds the database with initial data.

#### 🔧 2.6 Set permissions for storage and cache
```sh
docker-compose exec app chmod -R 775 storage bootstrap/cache
docker-compose exec app chown -R www-data:www-data storage bootstrap/cache
```
Sets appropriate permissions for the **storage** and **cache** directories to allow Laravel to function correctly.

## 🌍 Accessing the Application
Once the setup is complete, you can access the application via:

- 🖥️ **On Host Machine:** [http://localhost:8000](http://localhost:8000)
- 🖧 **On Guest VM:** [http://schedu.site:8000](http://schedu.site:8000)

## ⚠️ Troubleshooting
If you encounter any issues, check the following:

### 🔍 1. Verify `.env` File Configuration
Ensure the `.env` file is correctly configured, especially the database credentials:
```sh
db_connection=mysql
db_host=mysql
db_port=3306
db_database=your_database_name
db_username=your_username
db_password=your_password
```

### 🛠️ 2. Check Database Connection
Run the following command to check if the database container is running:
```sh
docker-compose ps
```
If the database is not running, restart it:
```sh
docker-compose restart mysql
```

### 🔐 3. Check SELinux (For CentOS/RHEL Users)
If SELinux is enabled, it might block file access. Try setting permissive mode:
```sh
sudo setenforce 0
```
Or permanently disable it by editing `/etc/selinux/config` and setting:
```sh
SELINUX=permissive
```

### 🔥 4. Allow Docker in Firewall (For CentOS/RHEL Users)
Ensure Docker services are allowed through the firewall:
```sh
sudo firewall-cmd --zone=public --add-masquerade --permanent
sudo firewall-cmd --zone=public --add-service=docker --permanent
sudo firewall-cmd --reload
```

---
This guide ensures a smooth setup of **SchedU** using Docker. 🚀

