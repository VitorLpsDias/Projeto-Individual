-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/
drop database if exists spiderman;
create database if not exists spiderman;

use spiderman;

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    sobrenome VARCHAR(45) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(20) NOT NULL,
    CONSTRAINT chkEmail CHECK (email LIKE '%@%')
);


CREATE TABLE quiz (
idQuiz INT PRIMARY KEY AUTO_INCREMENT,
pontuacao INT,
fkUsuario INT,
	FOREIGN KEY (fkUsuario) REFERENCES usuario(id)
);

select * from usuario;

select * from quiz;

CREATE TABLE tentativa(
	idTentativa INT,
    pontuacao INT,
    fkUsuario INT,
    fkQuiz INT,
    FOREIGN KEY (fkUsuario) REFERENCES usuario (id),
    FOREIGN KEY (fkQuiz) REFERENCES quiz (idQuiz)
);

