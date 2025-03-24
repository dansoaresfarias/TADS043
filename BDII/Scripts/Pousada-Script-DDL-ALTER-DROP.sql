create database cristal;

use cristal;

create table funcionario (
	cpf varchar(14) primary key not null,
    nome varchar(80) not null,
    nomeSocial varchar(45),
    genero char(1) not null,
    dataNasc date not null,
    email varchar(45) unique not null,
    salario decimal(7,2) unsigned zerofill not null,
    `status` tinyint not null,
    fg decimal(6,2)
);