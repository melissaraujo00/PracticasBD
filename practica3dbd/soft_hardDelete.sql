CREATE DATABASE SoftHardDeleteBD

USE SoftHardDeleteBD

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    is_deleted BOOLEAN DEFAULT FALSE
);


CREATE TABLE ordenes(
	id_orden INT PRIMARY KEY auto_increment,
    id_usuario INT REFERENCES usuarios(id_usuario),
    producto VARCHAR(100) NOT NULL,
    cantidad INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

INSERT INTO usuarios(nombre, email)
VALUES('Juan Perez', 'juan@example.com'),
('Maria Lopez', 'maria@example.com');
select * from usuarios

INSERT INTO ordenes(id_usuario, producto, cantidad) VALUES
('1', 'Laptop', 1),
('1', 'Mouse', 2),
('2', 'Teclado', 1);

SELECT * FROM ordenes
-- Ejemplo de hard delete (eliminación fisica)

DELETE FROM ordenes WHERE id_orden = 1;

-- SOFT DELETE
UPDATE usuarios SET is_deleted = True WHERE id_usuario = 1

SELECT * FROM usuarios WHERE is_deleted = FALSE 
