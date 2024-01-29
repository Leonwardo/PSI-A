DROP DATABASE sapataria;

CREATE DATABASE sapataria;

USE sapataria;

CREATE TABLE categorias(
    codcat INT(2) AUTO_INCREMENT,
    categoria VARCHAR(20) NOT NULL,
    PRIMARY KEY(codcat)
);

INSERT INTO categorias(codcat, categoria)
VALUES(1, 'Sapato Homem'),
(2, 'Sapato Senhora'),
(3, 'Sapatilhas'),
(4, 'Bota Homem'),
(5, 'Bota Criança'),
(6, 'Bota Senhora');

START TRANSACTION;
INSERT INTO categorias(codcat, categoria)
VALUES(7, 'Mala Senhora'),
(8, 'Carteira Senhora');
COMMIT;
SELECT * FROM categorias;

START TRANSACTION;
DELETE FROM categorias WHERE categoria LIKE '%BOTA%';
SELECT * FROM categorias;
ROLLBACK;
SELECT * FROM categorias;

START TRANSACTION;
INSERT INTO categorias(codcat, categoria)
VALUES(9, 'Mochila');
SELECT * FROM categorias;
SAVEPOINT RESTAUROA;
DELETE FROM categorias WHERE codcat > 5;
SELECT * FROM categorias;
SAVEPOINT RESTAUROB;
SELECT * FROM categorias;
ROLLBACK TO RESTAUROA;
SELECT * FROM categorias;


CREATE USER 'gestor'@'%' IDENTIFIED BY 'gere';
CREATE USER 'operador'@'%' IDENTIFIED BY 'opera';

SELECT user FROM mysql.user;

GRANT ALL ON *.* TO 'gestor';
GRANT SELECT, INSERT, UPDATE, DELETE, USAGE ON categorias TO 'operador';
FLUSH PRIVILEGES;
REVOKE SELECT, INSERT ON categorias FROM 'operador';
FLUSH PRIVILEGES;