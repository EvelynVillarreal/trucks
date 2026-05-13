FROM php:8.2-cli

RUN apt-get update && apt-get install -y libpq-dev unzip && \
    docker-php-ext-install pdo_pgsql && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app
COPY . .

RUN composer install --no-dev --optimize-autoloader

ENV DB_CONNECTION=pgsql
ENV DB_HOST=db.lezbfnhzsnzcthrabnoc.supabase.co
ENV DB_PORT=5432
ENV DB_DATABASE=postgres
ENV DB_USERNAME=postgres
ENV DB_PASSWORD=screamitoutloud
ENV DB_SCHEMA=public
ENV DATABASE_URL="postgresql://postgres:screamitoutloud@db.lezbfnhzsnzcthrabnoc.supabase.co:5432/postgres"

EXPOSE 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "public/"]
