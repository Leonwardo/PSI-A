DROP DATABASE sapataria_descalco;

CREATE DATABASE sapataria_descalco;

USE sapataria_descalco;

CREATE TABLE categorias(
    codcat INT(2) AUTO_INCREMENT,
    categoria VARCHAR(20) NOT NULL,
    PRIMARY KEY (codcat)
);

CREATE TABLE clientes(
    codcli INT(3),
    nome VARCHAR(20) NOT NULL,
    morada VARCHAR(30),
    telefone CHAR(9),
    contacto VARCHAR(20),
    dividamaxima FLOAT(6,2) NOT NULL DEFAULT(100) CHECK(dividamaxima > 0),
    PRIMARY KEY(codcli)
);

CREATE TABLE encomendas(
    codcli INT(3),
    codcat INT(2),
    Data DATE NOT NULL DEFAULT(curdate()),
    quantidade INT NOT NULL DEFAULT(0) CHECK(quantidade >= 0),
    PRIMARY KEY(codcli, codcat)
);

INSERT INTO categorias(codcat, categoria)
VALUES(1, 'Sapato Homem'),
(2, 'Sapato Senhora'),
(3, 'Sapatilhas'),
(4, 'Bota Homem'),
(5, 'Bota Criança'),
(6, 'Bota Senhora'),
(7, 'Sandália'),
(8, 'Chinelo');

INSERT INTO clientes(codcli, nome, morada, telefone, contacto,dividamaxima)
VALUES(1, 'Rui Santos, Lda', 'Rua 12 - Alcobaça', '261598756', 'Afonso Pereira', 3000),
(2, 'Pé Leve', 'Zona B - Leiria', '244659875', 'Sofia Francisco', 2500),
(3, 'Rei do Calçado', 'Estrada 5 - Pombal', '236542365', 'Filipe Brás', 2000),
(4, 'Botas Filipe', 'Rua Azul - Leiria', '244659372', 'Antonio Filipe', 1800),
(5, 'Sapatos do Ceu', 'Av. Pedro - Batalha', '244975862', 'Beatriz Figueira', 1300);

INSERT INTO encomendas(codcli, codcat, Data, quantidade)
VALUES(4, 3, '2009-05-12', 30),
(1, 1, '2009-07-06', 20),
(1, 2, '2009-07-06', 10),
(1, 4, '2009-07-06', 35),
(3, 4, '2009-11-20', 300),
(3, 5, '2009-11-20', 300),
(3, 6, '2009-11-20', 300),
(5, 7, '2009-12-29', 100),
(5, 8, '2009-12-29', 60);

ALTER TABLE categorias
MODIFY categoria VARCHAR(25) NOT NULL UNIQUE ;

UPDATE clientes SET dividamaxima = 2200 WHERE(nome = 'Botas Filipe');

DELETE FROM encomendas WHERE(codcat = 8);