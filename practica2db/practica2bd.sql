
CREATE DATABASE IF NOT EXISTS VideogameStore;
use VideogameStore;

CREATE TABLE Videogames(
	id_videogame INT auto_increment PRIMARY KEY,
    name_videogame VARCHAR(100) NOT NULL,
    platform_videogame VARCHAR(100) NOT NULL,
    genre_videogame VARCHAR(50),
    developer_videogame VARCHAR(100),
    precio DECIMAL(10, 2) NOT NULL,
    release_date_videogame DATE, 
    stock INT NOT NULL DEFAULT 0
);

CREATE TABLE Customers(
	id_customer INT auto_increment PRIMARY KEY,
    name_customer VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(200) NOT NULL,
    registrationDate_customer DATE DEFAULT(current_date()),
    membership_customer ENUM('Regular', 'Premium', 'VIP') default 'Regular'
)

CREATE TABLE Employee(
	id_employee INT AUTO_INCREMENT PRIMARY KEY,
    name_employee VARCHAR(150) NOT NULL,
    charge_employee ENUM('Gerente', 'Supervisor', 'Vendedor') NOT NULL
)
CREATE TABLE Sales
(
	id_sale INT AUTO_INCREMENT PRIMARY KEY,
    date_sale DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_Sale DECIMAL(10, 2) NOT NULL,
    paymentMethod_sale ENUM('Efectivo', 'Tarjeta', 'Transferencia') NOT NULL,
    id_customer INT NOT NULL,
    id_employee INT NOT NULL,
    FOREIGN KEY(id_customer) REFERENCES Customers(id_customer),
    FOREIGN KEY(id_employee) REFERENCES Employee(id_employee)
)

CREATE TABLE Sales_Datails
(
	id_salesDetail INT AUTO_INCREMENT PRIMARY KEY,
    quantity_saleDatail INT NOT NULL,
    unit_price_saleDatail DECIMAL(10, 2) NOT NULL,
    subtotal_saleDatail DECIMAL(10, 2) NOT NULL,
    id_sale INT NOT NULL,
    id_videogame INT NOT NULL,
    FOREIGN KEY (id_sale) REFERENCES Sales(id_sale),
    FOREIGN KEY (id_videogame) REFERENCES Videogames(id_videogame)
)