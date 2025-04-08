-- SQL: DML - DELETE

update funcionario
	set salario = 3600
		where cpf = "074.740.774-00";
        
update funcionario
	set salario = 2000, fg = 500
		where cpf = "126.621.666-11";
        
update funcionario
	set salario = salario * 1.1
		where genero = "F";
        
SET SQL_SAFE_UPDATES = 0;

-- salario = salario * 1 - (salario * 0.2) ==> salario * (1 - 0.2)
update funcionario
	set salario = salario * 0.8;

update funcionario
	set salario = salario * 1.15
		where dataNasc <= '1985-01-01';

update funcionario
	set salario = salario * 1.15
		where dataNasc <= '1985-04-07';

update funcionario
	set salario = salario * 1.2
		where cpf in (select funcionario_cpf from trabalhar
	where dataInicio <= '2020-04-07');

select funcionario_cpf from trabalhar
	where dataInicio <= '2020-04-07';

-- SQL: DML - DELETE    
delete from trabalhar
	where funcionario_cpf = "126.621.666-11";
    
delete from funcionario
	where cpf = "126.621.666-11";

delete from trabalhar; -- truncate trabalhar;

delete from reserva;

delete from departamento;

delete from funcionario
	where cpf in (select funcionario_cpf 
		from endereco where cidade = "Recife");

-- SQL: DTL
start transaction;        
delete from funcionario
	where cpf in (select funcionario_cpf 
		from endereco where cidade like "Jabo%");
commit;
rollback;


