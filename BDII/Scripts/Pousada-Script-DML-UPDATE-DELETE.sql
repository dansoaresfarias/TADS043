-- SQL: DML - UPDATE e DELETE

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



