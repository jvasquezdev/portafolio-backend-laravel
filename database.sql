CREATE DATABASE IF NOT EXISTS portafolio_db;
USE portafolio_db;

CREATE TABLE IF NOT EXISTS projects (
                                        id INT AUTO_INCREMENT PRIMARY KEY,
                                        title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    tech_stack VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

INSERT INTO projects (title, description, tech_stack) VALUES
                                                          ('Microservicio ASP.NET', 'API REST estática para datos de perfil.', 'C#, .NET 8, CORS'),
                                                          ('Motor Computacional Python', 'Servidor asíncrono para cálculos complejos en tiempo real.', 'Python, FastAPI, Uvicorn'),
                                                          ('Orquestador Angular', 'Frontend interactivo que consume múltiples APIs de forma concurrente.', 'TypeScript, Angular 18, RxJS, Chart.js');
