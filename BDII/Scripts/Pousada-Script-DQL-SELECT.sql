-- SQL: DQL -SELECT

select * from funcionario;

select nome, cpf, dataNasc, genero, email, salario
	from funcionario;
    
select nome, cpf, dataNasc, genero, email, salario
	from funcionario
		order by nome;
        
select nome, cpf, dataNasc, genero, email, salario
	from funcionario
		order by salario desc;
        
select nome, cpf, dataNasc, genero, email, salario
	from funcionario
		order by genero, salario desc;

select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    timestampdiff(year, dataNasc, now()) "Idade",
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
    email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
	from funcionario
		order by nome;

select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    timestampdiff(year, dataNasc, now()) "Idade",
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
    email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
	from funcionario
		where genero = 'F'
			order by nome;

select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    timestampdiff(year, dataNasc, now()) "Idade",
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
    email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
	from funcionario
		where timestampdiff(year, dataNasc, now()) >= 35 
			and timestampdiff(year, dataNasc, now()) < 45
			order by nome;

select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    timestampdiff(year, dataNasc, now()) "Idade",
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
    email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
	from funcionario
		where timestampdiff(year, dataNasc, now()) between 35 and 45
			order by nome;