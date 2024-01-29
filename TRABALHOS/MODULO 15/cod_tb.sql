DROP DATABASE Company_Ghost;
CREATE DATABASE Company_Ghost;
USE Company_Ghost;

CREATE TABLE Funcionarios(
    Id_func VARCHARCHAR(5) AUTO_INCREMENT,
    Nome_func VARCHAR(50) NOT NULL,
    BI_func TEXT(9) NOT NULL,
    Telefone_func TEXT(9) NOT NULL,
    Morada_func VARCHAR(30) NOT NULL,
    Cidade_func VARCHAR(10),
    Salario_func INT(4),
    Data_Admisão_func DATE NOT NULL,
    Id_perm CHAR(2), 
);