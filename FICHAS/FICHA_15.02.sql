#p1

DROP DATABASE OutraEmpresa;

CREATE DATABASE OutraEmpresa;

USE OutraEmpresa;

#p2

#a

CREATE TABLE Postal (
    codigo INT(4),
    localidade VARCHAR(20),
    PRIMARY KEY (codigo)
);

INSERT INTO Postal (codigo, localidade)
VALUES (1000, 'LISBOA'),
(1100, 'LISBOA'),
(1200, 'LISBOA'),
(1500, 'LISBOA'),
(2000, 'SANTARÉM'),
(2300, 'TOMAR'),
(3000, 'COIMBRA'),
(4000, 'PORTO'),
(9000, 'FUNCHAL');

#b

CREATE TABLE Pessoa(
    id INT(3) NOT NULL,
    nome VARCHAR(20),
    idade INT(3) CHECK (idade between 0 and 100) NOT NULL,
    salario FLOAT(6,2) NOT NULL CHECK(salario > 0),
    telefone INT(9),
    cod_postal INT(4),
    FOREIGN KEY (cod_postal) REFERENCES Postal (codigo),
    PRIMARY KEY (id)
);

INSERT INTO Pessoa (id, nome, idade, salario, telefone, cod_postal)
VALUES (42, 'António Dias', 43, 1200.00, 917896543, 1500),
(5, 'Célia Morais', 26, 620.00, 923923456, 1100),
(32, 'Florinda Simoes', 35, 830.00, NULL, 4000),
(37, 'Isabel Espada', 28, 700.00, NULL, 1100),
(49, 'José António', 17, 600.00, NULL, 1500),
(14, 'Nascimento Augusto', 35, 925.00, 213561234, 2300),
(25, 'Paulo Viegas', 32, 600.00, NULL, 1500);


CREATE TABLE Mensagem (
    id_msg INT(3),
    mensagem VARCHAR(30) NOT NULL
);

INSERT INTO Mensagem (id_msg, mensagem)
VALUES (10, 'Comissão de Vendas'),
(20, 'Fretes Individuais'),
(30, 'Fretes Empresas'),
(40, 'Vendas Extra'),
(50, 'Deslocações'),
(60, 'Refeiçoes'),
(70, 'Combustiveis'),
(80, 'Transportes'),
(90, 'Telefonemas'),
(100, 'Ofertas');


CREATE TABLE Comissao (
    id INT(3),
    id_msg INT(3),
    valor INT(3) NOT NULL CHECK(valor > 0),
    FOREIGN KEY (id) REFERENCES Pessoa (id),
    FOREIGN KEY (id_msg) REFERENCES Mensagem (id_msg),
    PRIMARY KEY(id, id_msg)
);

INSERT INTO Comissao (id, id_msg, valor)
VALUES(14, 10, 500),
(14, 100, 250),
(14, 70, 300),
(14, 60, 200),
(25, 10, 500),
(25, 30, 170),
(37, 40, 20),
(37, 30, 130),
(37, 10, 150),
(37, 50, 120),
(42, 20, 20),
(42, 30, 170),
(49, 20, 600),
(5, 90, 400),
(32, 80, 500);



show databases;
show columns from Postal; 
show columns from Pessoa;
show columns from Mensagem;
show columns from Comissao;

SELECT id, SUM(valor) FROM Comissao GROUP BY id;