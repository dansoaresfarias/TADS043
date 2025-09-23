import { Agencia } from "./Model/Agencia";
import { Cliente } from "./Model/Cliente";
import { Endereco } from "./Model/Endereco";

console.log("Banco Financeiro");

const endRenato: Endereco = new Endereco("PE", "Recife", "Tamarineira", 
    "Rua Padre São Miguel", 123, "50070-190", "Apto 1301");

const endAgSuassuna: Endereco = new Endereco("PE", "Recife", "Santo Amaro", 
    "Rua Suassuna", 1234, "50070-190");

//console.log(endRenato.toString());

const renato: Cliente = new Cliente("Renato Delgado", 
    "123.456.789-00", new Date("1992-08-14"), "SDS-PE 12.345.678", 
    "renato.delgado@gmail.com", "(81) 91234-5678", endRenato);

//console.log(renato.toString());

const agenciaSuassuna: Agencia = new Agencia("Suassuna", 1234, "(81) 3344-5566",
    "ag.suassuna@banco.senac.br", endAgSuassuna);

console.log(agenciaSuassuna.toString());