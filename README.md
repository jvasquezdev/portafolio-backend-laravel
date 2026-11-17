# 🐘 Servicio de Datos con Laravel

Este repositorio (`portafolio-backend-laravel`) es el servicio backend encargado de proveer el catálogo de proyectos para mi portafolio.

Está desarrollado con **Laravel 13** y **MySQL/MariaDB**. Expone una API que devuelve los proyectos en formato JSON para que el frontend de Angular pueda consumirlos.

## 🏛️ Rol en la arquitectura

Este microservicio se ejecuta en el puerto `8081` y es consumido por el cliente [portafolio-frontend](https://github.com/jvasquezdev/portafolio-frontend).

Su función principal es recibir peticiones HTTP GET, consultar la base de datos mediante el *Query Builder* de Laravel y devolver la información en formato JSON.

## 🚀 Requisitos previos

Para ejecutar este proyecto localmente necesitas:

- **PHP 8.3 o superior**
- **Composer**
- **MySQL** o **MariaDB**

## ⚙️ Instalación y configuración

1. Clona el repositorio:

```bash
git clone [https://github.com/jvasquezdev/portafolio-backend-laravel.git](https://github.com/jvasquezdev/portafolio-backend-laravel.git)
cd portafolio-backend-laravel
```

2. Instala las dependencias de PHP:

```bash
composer install
```

3. Crea tu archivo de configuración local:

```bash
cp .env.example .env
```

4. Configura la conexión a la base de datos en el archivo `.env`:
> **Nota:** En este proyecto, la base de datos MySQL/MariaDB está alojada en un servidor VPS. Durante el desarrollo local, la conexión se expone mediante un túnel hacia `localhost`, por lo que la configuración utiliza `DB_HOST=127.0.0.1`.

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=portafolio_db
DB_USERNAME=root
DB_PASSWORD=tu_contraseña_local
```

5. Genera la clave de la aplicación:

```bash
php artisan key:generate
```

## 🗄️ Base de datos

Antes de iniciar el servidor, crea la base de datos, la tabla y los datos iniciales ejecutando el siguiente script en MySQL o MariaDB. Puedes usar DBeaver, phpMyAdmin o la terminal.

```sql
-- Crear y seleccionar la base de datos
CREATE DATABASE IF NOT EXISTS portafolio_db;
USE portafolio_db;

-- Crear la tabla de proyectos
CREATE TABLE IF NOT EXISTS projects (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    stack VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insertar datos iniciales
INSERT INTO projects (name, stack) VALUES
('Plataforma EdTech (Academia Mate Fácil)', 'Laravel 13, JS, MySQL'),
('Motor de Evaluación Matemático', 'Python, FastAPI, SymPy'),
('Dashboard Administrativo Multi-API', 'Angular, TypeScript, Kestrel');
```

## 🏃‍♂️ Ejecución del servidor

Ejecuta el servicio en el puerto `8081` para que el frontend pueda comunicarse correctamente con este backend:

```bash
php artisan serve --port=8081
```

La API estará disponible en:

```text
http://localhost:8081/api/projects
```

## 🛠️ Tecnologías utilizadas

- **Framework:** Laravel 13
- **Base de datos:** MySQL / MariaDB
- **Arquitectura:** API REST
- **Respuesta:** JSON
- **Consultas:** Query Builder de Laravel
