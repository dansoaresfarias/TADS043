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

delimiter $$
create function calcValeTransp(pCPF varchar(14))
	returns decimal(5,2) deterministic
    begin
		declare valeTransp decimal(5,2) default 0.0;
        declare tempSal decimal(7,2);
        declare tempCid varchar(45);
        select salario into tempSal from funcionario where cpf = pCPF;
        select cidade into tempCid from endereco where Funcionario_cpf = pCPF;
        if tempCid like 'Recife' 
			then set valeTransp = 22 * 2 * 4.3;
		else set valeTransp = 22 * 2 * 5.6;
        end if;
        set valeTransp = valeTransp - tempSal * 0.06;
        if valeTransp > 0.0 
			then return valeTransp;
		else return 0.0;
        end if;
    end $$ 
delimiter ;

select salario into @tempSal from funcionario where cpf = '074.740.774-00';
select @tempSal;

	select count(cpf)  from dependente
			where Funcionario_cpf = "101.112.223-44" and
				parentesco like "Filh%" and
                timestampdiff(year, dataNasc, now()) <= 6;

delimiter $$
create function calcAuxCreche(pCPF varchar(14))
	returns decimal(6,2) deterministic
    begin
		declare auxCreche decimal(6,2) default 0.0;
        declare qtdFilho int;
        select count(cpf) into qtdFilho from dependente
			where Funcionario_cpf = pCPF and
				parentesco like "Filh%" and
                timestampdiff(year, dataNasc, now()) <= 6;
        set auxCreche = 250 * qtdFilho;
        return auxCreche;
    end $$
delimiter ;

delimiter $$
create function calcINSS(pSalario decimal(7,2))
	returns decimal(6,2) deterministic
    begin
		declare INSS decimal(6,2);
        if pSalario <= 1518 
			then set INSS = pSalario * 0.075;
		elseif pSalario between 1518.01 and 2793.88
			then set INSS = pSalario * 0.09;
		elseif pSalario between 2793.89 and 4190.83
			then set INSS = pSalario * 0.12;
		elseif pSalario between 4190.84 and 8157.41
			then set INSS = pSalario * 0.14;
		else set INSS = 8157.41 * 0.14;
        end if;
        return INSS;
    end $$
delimiter ;

delimiter $$
create function calcIRRF(pSalario decimal(7,2))
	returns decimal(6,2) deterministic
    begin
		declare IRRF decimal(6,2);
        if pSalario <= 2259.20 
			then set IRRF = 0.0;
		elseif pSalario between 2259.21 and 2826.65
			then set IRRF = pSalario * 0.075;
		elseif pSalario between 2826.66 and 3751.05
			then set IRRF = pSalario * 0.15;
		elseif pSalario between 3751.06 and 4664.68
			then set IRRF = pSalario * 0.225;
		else set IRRF = pSalario * 0.275;
        end if;
        return IRRF;
    end $$
delimiter ;

select nome "Funcionário", cpf "CPF",
	concat("R$ ", format(salario, 2, 'de_DE')) "Salário Bruto",
    concat("R$ ", format(calcValeTransp(cpf), 2, 'de_DE')) "Vale Transporte",
    concat("R$ ", format(22 * 18.5, 2, 'de_DE')) "Vale Alimentação",
    concat("R$ ", format(calcAuxCreche(cpf), 2, 'de_DE'))"Auxílio Creche",
    concat("R$ -", format(calcINSS(salario), 2, 'de_DE'))"INSS",
    concat("R$ -", format(calcIRRF(salario), 2, 'de_DE'))"IRRF",
    concat("R$ ", format(salario + calcValeTransp(cpf) + 22 * 18.5 + 
    calcAuxCreche(cpf) - calcINSS(salario) - calcIRRF(salario), 2, 'de_DE')) "Salário Líquido"
    from funcionario
		order by nome;

delimiter $$
create procedure cadFuncionario(in pcpf varchar(14),
								in pnome varchar(80),
								in pnomeSocial varchar(45),
								in pgenero char(1),
								in pdataNasc date,
								in pemail varchar(45),
								in psalario decimal(7,2),
                                in pnumTel1 varchar(15),
                                in pnumTel2 varchar(15),
                                in pnumTel3 varchar(15),
                                in pUF char(2),
								in pcidade varchar(45),
								in pbairro varchar(45),
								in prua varchar(45),
								in pnumero int,
								in pcomp varchar(45),
								in pcep varchar(9))
	begin
		insert into funcionario
			value (pcpf, pnome, pnomeSocial, pgenero, pdataNasc, pemail, 
				psalario, 1, 0.0);
		insert into telefone (numero, Funcionario_cpf)
			value (pnumTel1, pcpf);
		if pnumTel2 is not null
			then insert into telefone (numero, Funcionario_cpf)
					value (pnumTel2, pcpf);
		end if;
        if pnumTel3 is not null
			then insert into telefone (numero, Funcionario_cpf)
					value (pnumTel3, pcpf);
		end if;
        insert into endereco
			value (pcpf, pUF, pcidade, pbairro, prua, pnumero, pcomp, pcep);
    end $$
delimiter ;

call cadFuncionario("709.907.770-99", "Maria Clara de Melo", "Clara", 'F',
	'2002-03-20', "clara.melo@gmail.com", 15000, "(81)98679-8679", 
    "(81)99774-5742", null, 'PE', "Recife", "Pina", "Rua 12 de Julho", 123,
    "Ap 203", '50180-980');

select * from funcionario;

select * from telefone;

select * from endereco;
