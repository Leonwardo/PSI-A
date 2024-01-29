#p1
DROP DATABASE Transportes;

CREATE DATABASE Transportes;

USE Transportes;

#p2
CREATE TABLE Carro(
    matricula CHAR(8),
    marca VARCHAR(15),
    modelo VARCHAR(15),
    cor VARCHAR(15),
    cilindrada INTEGER(5),
    PRIMARY KEY(matricula)
);

CREATE TABLE Pessoa(
    bi VARCHAR(9),
    nome VARCHAR(50),
    morada VARCHAR(20),
    matricula CHAR(8),
    PRIMARY KEY(bi),
    FOREIGN KEY (matricula) REFERENCES Carro (matricula)
);

#p3

#CARRO

INSERT INTO Carro (matricula, marca, modelo, cor, cilindrada)
VALUES('11-22-AA', 'FIAT', 'UNO', 'Cinzento', 1100),
('88-99-MM', 'OPEL', 'Astra', 'Verde', 1400),
('55-66-KK', 'Citroen', 'Xantia', 'Azul Metalizado', 1640);

#PESSOA

INSERT INTO Pessoa (bi, nome, morada, matricula)
VALUES('111679870', 'Marilia Tomas', 'Rua X', '55-66-KK'),
('101897562', 'Cidalia Martins', 'Rua Y', '11-22-AA'),
('12864232', 'Celia Afonso ', 'Rua Z', '88-99-MM');

#p4

DELETE FROM Carro WHERE marca = 'OPEL';

#p5

ALTER TABLE Pessoa ADD (TM VARCHAR(9));

#p6

UPDATE Pessoa SET TM = '123456789' WHERE nome LIKE 'C%';


