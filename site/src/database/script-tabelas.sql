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
tentativa INT,
	FOREIGN KEY (fkUsuario) REFERENCES usuario(id)
);

CREATE TABLE tentativa(
	idTentativa INT,
    fkUsuario INT,
    fkQuiz INT,
    FOREIGN KEY (fkUsuario) REFERENCES usuario (id),
    FOREIGN KEY (fkQuiz) REFERENCES quiz (idQuiz)
);
 
select * from usuario;
select * from quiz;
select * from tentativa;
SELECT count(pontuacao) FROM quiz join usuario on fkusuario = 1;
select nome, pontuacao from quiz join usuario on fkusuario = 1;
SELECT count(pontuacao) FROM quiz join usuario on fkusuario = 1;
select tentativa from quiz join usuario on fkusuario = 1;
SELECT COUNT(tentativa) FROM quiz where fkUsuario = 1;
INSERT INTO quiz (pontuacao, fkUsuario, tentativa) VALUES ('10', '1', (SELECT sum(tentativa) FROM quiz join usuario on fkusuario = 1));
