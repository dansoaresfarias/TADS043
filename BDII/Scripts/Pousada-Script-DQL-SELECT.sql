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

select * from dependente;

select d.cpf "CPF do Dependente", upper(d.nome) "Dependente", 
	date_format(d.dataNasc, '%d/%m/%Y')"Data de Nascimento",
    timestampdiff(year, d.dataNasc, now()) "Idade",
    replace(replace(d.genero, 'M', "Masculino"), 'F', "Feminino") "Gênero",
    d.parentesco "Parentesco",
    d.Funcionario_cpf "CPF do Funcionário",
    f.nome "Funcionário"
	from dependente d, funcionario f
		where d.Funcionario_cpf = f.cpf;

select d.cpf "CPF do Dependente", upper(d.nome) "Dependente", 
	date_format(d.dataNasc, '%d/%m/%Y')"Data de Nascimento",
    timestampdiff(year, d.dataNasc, now()) "Idade",
    replace(replace(d.genero, 'M', "Masculino"), 'F', "Feminino") "Gênero",
    d.parentesco "Parentesco",
    d.Funcionario_cpf "CPF do Funcionário",
    f.nome "Funcionário"
	from dependente d
		join funcionario f on f.cpf = d.Funcionario_cpf;
        
select d.cpf "CPF do Dependente", upper(d.nome) "Dependente", 
	date_format(d.dataNasc, '%d/%m/%Y')"Data de Nascimento",
    timestampdiff(year, d.dataNasc, now()) "Idade",
    replace(replace(d.genero, 'M', "Masculino"), 'F', "Feminino") "Gênero",
    d.parentesco "Parentesco",
    d.Funcionario_cpf "CPF do Funcionário",
    f.nome "Funcionário"
	from dependente d
		inner join funcionario f on f.cpf = d.Funcionario_cpf;
        
select d.cpf "CPF do Dependente", upper(d.nome) "Dependente", 
	date_format(d.dataNasc, '%d/%m/%Y')"Data de Nascimento",
    timestampdiff(year, d.dataNasc, now()) "Idade",
    replace(replace(d.genero, 'M', "Masculino"), 'F', "Feminino") "Gênero",
    d.parentesco "Parentesco",
    e.cidade "Cidade",
    e.bairro "Bairro"
	from dependente d
		inner join funcionario f on f.cpf = d.Funcionario_cpf
		inner join endereco e on e.Funcionario_cpf = f.cpf;

select upper(f.nome) as "Funcionário", f.cpf "CPF", 
	date_format(f.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    timestampdiff(year, f.dataNasc, now()) "Idade",
    replace(replace(f.genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
    f.email "E-mail", 
    t.numero "Telefone",
    concat("R$ ", format(f.salario, 2, 'de_DE')) "Salário",
    e.cidade "Cidade", e.bairro "Bairro"
	from funcionario f
		inner join endereco e on e.Funcionario_cpf = f.cpf
        left join telefone t on t.Funcionario_cpf = f.cpf
			order by f.nome;

select upper(f.nome) as "Funcionário", f.cpf "CPF", 
	date_format(f.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    timestampdiff(year, f.dataNasc, now()) "Idade",
    replace(replace(f.genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
    f.email "E-mail", 
    group_concat(t.numero SEPARATOR ', ') "Telefone",
    concat("R$ ", format(f.salario, 2, 'de_DE')) "Salário",
    e.cidade "Cidade", e.bairro "Bairro"
	from funcionario f
		inner join endereco e on e.Funcionario_cpf = f.cpf
        left join telefone t on t.Funcionario_cpf = f.cpf
			group by f.cpf
				order by f.nome;

select func.cpf "CPF", func.nome "Funcionário", 
	fer.periodoAqt "Ano Referente",
    date_format(fer.dataInicio, '%d/%m/%Y') "Data Início",
    date_format(fer.dataFim, '%d/%m/%Y') "Data Fim",
    case when (timestampdiff(day, fer.dataInicio, fer.dataFim) + 1) > 30
		then 30 
        else timestampdiff(day, fer.dataInicio, fer.dataFim) + 1 
	end "Quantidade de Dias",
    concat('R$ ', format(fer.valor, 2, 'de_DE')) "Valor a Receber",
    case fer.addDecimal
		when 1 then "Sim"
        else "Não"
	end "Adiantamento do Décimo"
    from funcionario func
		inner join ferias fer on fer.Funcionario_cpf = func.cpf
			order by func.nome;

update ferias fer
	inner join vFerias on fer.idFerias = vFerias.idFerias
	set fer.dataFim = adddate(fer.dataFim, interval -1 day)
		where vFerias.qtdDias > 30;

select adddate(dataFim, interval -1 day), dataFim from ferias;

select idFerias 
	from vFerias 
		where qtdDias > 30;

select idFerias, timestampdiff(day, dataInicio, dataFim) + 1 "qtdDias"
	from ferias;

create view vFerias as
	select idFerias, timestampdiff(day, dataInicio, dataFim) + 1 "qtdDias"
		from ferias;

create view vRelFerias as
	select func.cpf "CPF", func.nome "Funcionário", 
		fer.periodoAqt "Ano Referente",
		date_format(fer.dataInicio, '%d/%m/%Y') "Data Início",
		date_format(fer.dataFim, '%d/%m/%Y') "Data Fim",
		case when (timestampdiff(day, fer.dataInicio, fer.dataFim) + 1) > 30
			then 30 
			else timestampdiff(day, fer.dataInicio, fer.dataFim) + 1 
		end "Quantidade de Dias",
		concat('R$ ', format(fer.valor, 2, 'de_DE')) "Valor a Receber",
		case fer.addDecimal
			when 1 then "Sim"
			else "Não"
		end "Adiantamento do Décimo"
		from funcionario func
			inner join ferias fer on fer.Funcionario_cpf = func.cpf
				order by func.nome;

select * from vrelferias;
