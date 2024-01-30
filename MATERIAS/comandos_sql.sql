CREATE DATABASE Nome_da_BD;
DROP DATABASE Nome_da_BD;
USE Nome_da_BD;

Show databases; 
Select database();

Show tables;
Show columns from nome_tabela;

DROP TABLE aluno;
Select * from table;

CREATE TABLE Aluno (
Id INT AUTO_INCREMENT PRIMARY KEY, (Chave simples)
nome_a VARCHAR(255),
Idade INT NOT NULL CHECK (Idade between 0 AND 150),
cod_postal VARCHAR(8) NOT NULL,
Sexo CHAR CHECK (sexo IN (‘M’,’F’)),
nomeCidade VARCHAR(50) DEFAULT ‘Faro’,
telefone NUMERIC(9,0) UNIQUE,
FOREIGN KEY (n_aluno) REFERENCES Aluno (n_aluno),
PRIMARY KEY (n_aluno, cod_disc, data_insc) (Chave composta)
);

ALTER TABLE Aluno ADD (email VARCHAR(30));
ALTER TABLE Aluno CHANGE email email_novo varchar(20);
ALTER TABLE Aluno MODIFY nome_a varchar(50) NOT NULL;
ALTER TABLE Aluno DROP COLUMN nome_a;
ALTER TABLE Tabela ADD CONSTRAIN restrição tipo (coluna);
ALTER TABLE Tabela DROP CONSTRAIN restrição tipo (coluna);

INSERT INTO Localidade VALUES (8005, ‘FARO’);
INSERT INTO Localidade VALUES (1400, ‘Porto’), (1500, ‘Lisboa’), (8005, ‘FARO’);

UPDATE Localidade SET localidade= ‘FARO’ WHERE cod_postal= 8000;
DELETE FROM Aluno WHERE nome_a= ‘Susana Viegas’;
CREATE INDEX indNome ON alunos (nomealu DESC);
DROP INDEX indNome ON alunos;
SHOW INDEX from clientes;