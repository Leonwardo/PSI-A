#1

DROP DATABASE Clube;
CREATE DATABASE Clube;
USE Clube;

#2

CREATE TABLE Socios(
    IdSocio INT(3) AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(20) NOT NULL,
    Idade INT(2) CHECK (Idade between 0 AND 150),
    Sexo CHAR CHECK (Sexo IN ('M','F')),
    Mensalidade NUMERIC(4,2) DEFAULT(10.50)
);

#3

CREATE TABLE Modalidade(
    CodMod INT(3) PRIMARY KEY ,
    Descricao VARCHAR(20) NOT NULL
);

#4

CREATE TABLE Inscricoes (
    IdSocio INT(3),
    CodMod INT(3),
    DataInscr Date NOT NULL
);

#5

INSERT INTO Socios VALUES (1, 'Sandra Viegas', 18, 'F', 8.50), (2, 'Cristina Sofia', 19, 'F', 12.00), (3, 'Dário Costa', 13, 'M', 12.00); 

#6

INSERT INTO Modalidade VALUES  (10, 'Futebol'), (20, 'Canoagem'), (30, 'Natação'), (40, 'Remo');

#7

INSERT INTO Inscricoes VALUES (1, 20, 2010-12-1), (1, 40, 2012-04-30), (3, 40, 2013-06-15), (2, 30, 2014-10-14);

#8

SHOW TABLES;

#9

Show columns from Socios;

#10

ALTER TABLE Socios MODIFY Nome VARCHAR(30) UNIQUE;