#!/bin/bash

# Exit on error and print failed command
set -e
trap 'echo "❌ Error occurred at command: $BASH_COMMAND"' ERR

# Check if Docker and Docker Compose are installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install it using:"
    echo "   sudo apt install docker.io   # For Debian-based systems"
    echo "   sudo yum install docker      # For RHEL-based systems"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install it using:"
    echo "   sudo apt install docker-compose   # For Debian-based systems"
    echo "   sudo yum install docker-compose   # For RHEL-based systems"
    exit 1
fi

# Step 1: Build and start the containers
echo "🚀 Building and starting Docker containers..."
docker-compose up -d --build

# Step 2: Install dependencies
echo "📦 Installing Composer dependencies..."
docker-compose exec app composer install

# Step 3: Generate the application key
echo "🔑 Generating application key..."
docker-compose exec app php artisan key:generate --force

# Step 4: Run database migrations and seed the database
echo "🗄 Running migrations and seeding database..."
if ! docker-compose exec app php artisan migrate --seed; then
    echo "⚠ Migration failed! Attempting fresh migration..."
    docker-compose exec app php artisan migrate:fresh
    docker-compose exec app php artisan migrate --seed
fi

# Step 5: Set permissions for storage and cache
echo "🔐 Setting permissions for storage and cache..."
docker-compose exec app chmod -R 775 storage bootstrap/cache
docker-compose exec app chown -R www-data:www-data storage bootstrap/cache

# Done
echo "✅ SchedU setup is complete! 🚀"

