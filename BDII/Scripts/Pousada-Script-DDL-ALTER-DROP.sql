-- SQL: DDL-CREATE

create schema cristal;

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
    fg decimal(6,2) unsigned zerofill null
);

CREATE TABLE cristal.endereco (
    Funcionario_cpf VARCHAR(14) PRIMARY KEY NOT NULL,
    uf CHAR(2) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    rua VARCHAR(45) NOT NULL,
    numero INT NOT NULL,
    comp VARCHAR(45) NULL,
    cep VARCHAR(9) NOT NULL,
    FOREIGN KEY (Funcionario_cpf)
        REFERENCES cristal.funcionario (cpf)
        ON UPDATE CASCADE ON DELETE CASCADE
);

create table dependente (
	cpf varchar(14) not null,
    nome varchar(45) not null,
    dataNasc date not null,
    genero char(1) not null,
    parentesto varchar(15) not null,
    Funcionario_cpf varchar(14) not null,
    primary key (cpf),
    foreign key (Funcionario_cpf) 
		references cristal.funcionario (cpf)
			on update cascade
            on delete cascade
);

desc dependente;

-- SQL: DDL-DROP

drop table funcionario;

drop table dependente;

drop table endereco;

-- SQL: DDL-ALTER
alter table departamento
	add column descricao varchar(150) null;
    
alter table departamento
	change column descricao sobre varchar(155) null,
    add column sala varchar(15) null after `local`;

alter table departamento
	drop column sala, 
    drop column sobre;

desc departamento;






