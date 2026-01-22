-- init.sql
-- Создание дополнительной базы данных
CREATE DATABASE testdb;

-- Создание пользователя (если нужно)
CREATE USER testuser WITH PASSWORD 'testpassword';
GRANT ALL PRIVILEGES ON DATABASE testdb TO testuser;

-- Создание таблицы в основной базе данных
\c mydatabase

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Вставка тестовых данных
INSERT INTO users (name, email) 
VALUES 
    ('Иван Иванов', 'ivan@example.com'),
    ('Мария Петрова', 'maria@example.com')
ON CONFLICT (email) DO NOTHING;