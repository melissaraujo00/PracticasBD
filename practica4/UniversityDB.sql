-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS universidad;
USE universidad;

-- Tabla FACULTAD
CREATE TABLE FACULTAD (
    id_facultad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    decano VARCHAR(100) NOT NULL
);

-- Tabla DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100),
    id_facultad INT,
    FOREIGN KEY (id_facultad) REFERENCES FACULTAD(id_facultad)
);

-- Tabla PROFESOR
CREATE TABLE PROFESOR (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    titulo VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES DEPARTAMENTO(id_departamento)
);

-- Tabla CURSO
CREATE TABLE CURSO (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(10) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    creditos INT NOT NULL,
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES PROFESOR(id_profesor)
);

-- Tabla ESTUDIANTE
CREATE TABLE ESTUDIANTE (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    email VARCHAR(100) UNIQUE,
    direccion VARCHAR(200),
    telefono VARCHAR(20)
);

-- Tabla INSCRIPCION (tabla intermedia para relación muchos a muchos)
CREATE TABLE INSCRIPCION (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion DATE NOT NULL,
    calificacion FLOAT,
    FOREIGN KEY (id_estudiante) REFERENCES ESTUDIANTE(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES CURSO(id_curso),
    UNIQUE KEY inscripcion_unica (id_estudiante, id_curso)
);