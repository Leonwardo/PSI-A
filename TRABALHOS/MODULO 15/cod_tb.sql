# Criação da Base de Dados

DROP DATABASE IF EXISTS Company_Ghost;
CREATE DATABASE Company_Ghost;
USE Company_Ghost;


# Tabelas de Entidade

CREATE TABLE Permissoes(
    Id_perm CHAR(2) PRIMARY KEY,
    Nome_perm VARCHAR(20) NOT NULL
);

CREATE TABLE Funcionarios(
    Id_func VARCHAR(5) PRIMARY KEY,
    Nome_func VARCHAR(50) NOT NULL,
    BI_func TEXT(9) UNIQUE,
    Telefone_func TEXT(9) NOT NULL,
    Morada_func VARCHAR(30) NOT NULL,
    Cidade_func VARCHAR(10) NOT NULL,
    Salario_func NUMERIC(8.2) NOT NULL,
    Data_Admisao_func DATE NOT NULL,
    Id_perm CHAR(2) NOT NULL,
    FOREIGN KEY (Id_perm) REFERENCES Permissoes(Id_perm)
);

CREATE TABLE Departamentos(
    Id_dep VARCHAR(5) PRIMARY KEY,
    Nome_dep VARCHAR(20) NOT NULL,
    Id_func VARCHAR(5) NOT NULL,
    FOREIGN KEY (Id_func) REFERENCES Funcionarios(Id_func)
);

CREATE TABLE Fornecedores(
    Id_forn VARCHAR(5) PRIMARY KEY,
    Nome_forn VARCHAR(20) NOT NULL,
    Nif_forn TEXT(9) UNIQUE,
    Morada_forn VARCHAR(50) NOT NULL,
    Cidade_forn VARCHAR(10) NOT NULL,
    Telefone_forn TEXT(9) NOT NULL,
    Email_forn VARCHAR(30) NOT NULL
);

CREATE TABLE Cliente(
    Id_clien VARCHAR(5) PRIMARY KEY,
    Nome_clien VARCHAR(20) NOT NULL,
    BI_clien TEXT(9) UNIQUE,
    Morada_clien VARCHAR(50) NOT NULL,
    Cidade_clien VARCHAR(10) NOT NULL,
    Email_clien VARCHAR(30) NOT NULL,
    Telefone_clien TEXT(9) NOT NULL
);

CREATE TABLE Projetos(
    Id_proj VARCHAR(5) PRIMARY KEY,
    Nome_proj VARCHAR(20) NOT NULL,
    Data_inicio DATE NOT NULL,
    Data_fim DATE NOT NULL
);

CREATE TABLE Encomendas(
    Id_enco VARCHAR(5) PRIMARY KEY,
    Montante_enco NUMERIC(8.2) NOT NULL,
    Data_enco DATE NOT NULL
);

CREATE TABLE Pagamentos(
    Id_pag VARCHAR(5) PRIMARY KEY,
    Nome_pag VARCHAR(20) NOT NULL
);

CREATE TABLE Faturas(
    Id_fatu VARCHAR(5) PRIMARY KEY,
    Id_clien VARCHAR(5) NOT NULL,
    Id_func VARCHAR(5) NOT NULL,
    Id_pag VARCHAR(5) NOT NULL,
    Montante_fat NUMERIC(8.2) NOT NULL,
    Data_fat DATE NOT NULL,
    FOREIGN KEY (Id_clien) REFERENCES Cliente(Id_clien),
    FOREIGN KEY (Id_func) REFERENCES Funcionarios(Id_func),
    FOREIGN KEY (Id_pag) REFERENCES Pagamentos(Id_pag)
);

CREATE TABLE Produtos(
    Id_prod VARCHAR(5) PRIMARY KEY,
    Nome_prod VARCHAR(20) NOT NULL,
    Preco_prod NUMERIC(8.2) NOT NULL
);


# Tabelas de Relacionamento

CREATE TABLE Pertencem(
    Id_func VARCHAR(5) NOT NULL,
    Id_dep VARCHAR(5) NOT NULL,
    Data_p DATE NOT NULL,
    FOREIGN KEY (Id_func) REFERENCES Funcionarios(Id_func),
    FOREIGN KEY (Id_dep) REFERENCES Departamentos(Id_dep)
);

CREATE TABLE Com(
    Id_prod VARCHAR(5) NOT NULL,
    Id_enco VARCHAR(5) NOT NULL,
    Quantidade INT(4) NOT NULL,
    Data_c DATE NOT NULL,
    FOREIGN KEY (Id_prod) REFERENCES Produtos(Id_prod),
    FOREIGN KEY (Id_enco) REFERENCES Encomendas(Id_enco)
);

CREATE TABLE Projetam(
    Id_proj VARCHAR(5) NOT NULL,
    Id_clien VARCHAR(5) NOT NULL,
    Data_p DATE NOT NULL,
    FOREIGN KEY (Id_proj) REFERENCES Projetos(Id_proj),
    FOREIGN KEY (Id_clien) REFERENCES Cliente(Id_clien)
);

CREATE TABLE Fornece(
    Id_enco VARCHAR(5) NOT NULL,
    Id_forn VARCHAR(5) NOT NULL,
    Data_f DATE NOT NULL,
    FOREIGN KEY (Id_enco) REFERENCES Encomendas(Id_enco),
    FOREIGN KEY (Id_forn) REFERENCES Fornecedores(Id_forn)
);

CREATE TABLE Vendem(
    Id_fatuu VARCHAR(5) NOT NULL,
    Id_prod VARCHAR(5) NOT NULL,
    Quantidade INT(4) NOT NULL,
    Data_v DATE NOT NULL,
    FOREIGN KEY (Id_fatuu) REFERENCES Faturas(Id_fatuu),
    FOREIGN KEY (Id_prod) REFERENCES Produtos(Id_prod)
);


# Inserção, Atualização e Eliminação de Dados

INSERT INTO Funcionarios VALUES (1, 'João Silva', 144418355, 912345678, 'Rua da Liberdade, 123', 'Lisboa', 1500, '2021-08-20', 'sg'), (2, 'Maria Oliveira', 325473617, 921876543, 'Avenida da República, 456', 'Porto', 2000, '2021-11-05', 'fn'), (3 'Carlos Santos', 147630983, 961111222, 'Travessa dos Cedros, 789', 'Braga', 1400, '2022-02-28', 'gr'), (4, 'Ana Pereita', 183566017, 894464473, 'Praça do Comércio, 101', 'Coimbra', 1600, '2022-03-10', 'gr'), (5, 'Luis Costa', 155411500, 856067225, 'Rua das Oliveiras, 222', 'Faro', 2000, '2022-08-20',sc), (6, 'Fernanda Lima', 130708755, 732808977, 'Avenida dos Girassóis, 333', 'Aveiro', 1200, '2023-05-12', 'gr'), (7, 'Rafael Oliveira', 134692179, 362708256, 'Rua das Figueiras, 444', 'Evora', 1300, '2023-07-03', 'gr');

INSERT INTO Permissoes VALUES ('cf', 'Chefe'), ('sc', 'Socio'), ('gr', 'Gerente'), ('sg', 'SubGerente'), ('fn', 'Funcionário'), ('vs','Visitante');

INSERT INTO Departamentos VALUES (1, 'Finanças', 4), (2, 'Recursos Humanos', 1), (3, 'Controle de Estoque', 7), (4, 'Comercial', 3), (5, 'Pedidos', 6), (6, 'Developers', 5);

INSERT INTO Cliente VALUES (1, 'Cliente A', 177180820, 'Rua Principal, 123', 'Lisboa', 'clienteA@email.com', 911234567), (2, 'Cliente B', 183772482, 'Avenida Central, 456', 'Faro', 'clienteB@email.com', 922345678), (3, 'Cliente C', 170122417, 'Avenida dos Girassóis, 333', 'Aveiro', 'clienteC@email.com', 942465648);

INSERT INTO Fornecedores VALUES (1, 'Fornecedor A', 296158275, 'Travessa das Violetas, 555', 'Viseu', 961555444, 'fornecedorA@email.com'), (2, 'Fornecedor B', 207083380, 'Rua das Figueiras, 422', 'Évora', 921455442, 'fornecedorB@email.com');

INSERT INTO Projetos VALUES (1, 'Projeto A', '2023-01-01', '2023-12-02'), (2, 'Projeto B', '2023-03-15', '2023-01-01');

INSERT INTO Encomendas VALUES (1, 2000, '2023-01-01'), (2, 5000, '2023-03-15'), (3, 2300, '2023-07-17');

INSERT INTO Faturas VALUES (1, 3, 5, 'dh', 1498.99, '2022-11-01'), (2, 1, 1, 'cc', 5004.95, '2023-02-01');

INSERT INTO Pagamentos VALUES ('dh', 'Dinheiro'), ('cc', 'Cartão de Crédito'), ('cd', 'Cartão de Débito'), ('ch', 'Cheque');

INSERT INTO Produtos VALUES (1, 'Produto A', 500.99), (2, 'Produto B', 1000.99), (3, 'Produto C', 499.00);

INSERT INTO Pertencem VALUES (1, 2, '2021-08-20'), (2, 6, '2021-11-05'), (3, 4, '2022-02-28');

INSERT INTO Projetam VALUES (1, 1, '2023-01-01'), (2, 3, '2023-03-15'), (3, 2, '2023-03-15');

INSERT INTO Com VALUES (1, 1, 200, '2023-01-01'), (2, 2, 500, '2023-03-15'), (3, 3, 300, '2023-07-17');

INSERT INTO Fornece VALUES (1, 1, '2023-01-01'), (2, 2, '2023-03-15'), (3, 1, '2023-07-17');

INSERT INTO Vendem VALUES (1, 1, 1, '2022-11-01'), (2, 3, 2, '2023-11-01'), (3, 2, 5, '2023-02-01');


UPDATE Funcionarios SET Salario_func = 1700 WHERE Id_func = 3;

UPDATE Faturas SET Montante_fat = 1499.99 WHERE Id_fatuu = 1;

UPDATE Produtos SET Preco_prod = 499.99 WHERE Id_prod = 3;


DELETE FROM Funcionarios WHERE Id_func = 7;

DELETE FROM Faturas WHERE Id_fatuu = 2;


# Criação de Indices, Visualização e Eliminação de Indices

CREATE INDEX idx_nome_func ON Funcionarios(Nome_func);

CREATE INDEX idx_nome_clien ON Cliente(Nome_clien);


SHOW INDEX FROM Funcionarios;


DROP INDEX idx_nome_func ON Funcionarios;


# Consultas de Dados

SHOW TABLES;

SHOW COLUMNS FROM Funcionarios;

SELECT * FROM Funcionarios WHERE Salario_func > 1500;


# Transações

START TRANSACTION;

UPDATE Funcionarios SET Salario_func = 1800 WHERE Id_func = 1;

COMMIT;

ROLLBACK;


START TRANSACTION;

SAVEPOINT sp1;
UPDATE Funcionarios SET Salario_func = 1900 WHERE Id_func = 2;

COMMIT TO sp1;


# Segurança

CREATE USER 'dev_1'@'localhost' IDENTIFIED BY '1234';

SET PASSWORD FOR 'dev_1'@'localhost' = PASSWORD('4321');

GRANT SELECT, INSERT ON Company_Ghost.Funcionarios TO 'dev_1'@'localhost';

REVOKE SELECT ON Company_Ghost.Funcionarios FROM 'dev_1'@'localhost';

DROP USER 'dev_1'@'localhost';
