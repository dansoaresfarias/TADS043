import { Agencia } from "./Model/Agencia";
import { Cliente } from "./Model/Cliente";
import { Endereco } from "./Model/Endereco";
import { Conta } from "./Model/Conta";

console.log("Banco Financeiro");

const endRenato: Endereco = new Endereco("PE", "Recife", "Tamarineira",
    "Rua Padre São Miguel", 123, "50070-190", "Apto 1301");

const endBasante: Endereco = new Endereco("PE", "Recife", "Campo Grande",
    "Rua Gonçalves Dias", 4321, "50070-180", "Apto 302");

const endAgSuassuna: Endereco = new Endereco("PE", "Recife", "Santo Amaro",
    "Rua Suassuna", 1234, "50070-190");

//console.log(endRenato.toString());

const renato: Cliente = new Cliente("Renato Delgado",
    "123.456.789-00", new Date("1992-08-14"), "SDS-PE 12.345.678",
    "renato.delgado@gmail.com", "(81) 91234-5678", endRenato);

const basante: Cliente = new Cliente("João Victor Basante",
    "311.456.789-00", new Date("1999-12-27"), "SDS-PE 21.346.678",
    "joao.basante@gmail.com", "(81) 91234-5666", endBasante);

//console.log(renato.toString());

const agenciaSuassuna: Agencia = new Agencia("Suassuna", 1234, "(81) 3344-5566",
    "ag.suassuna@banco.senac.br", endAgSuassuna);

//console.log(agenciaSuassuna.toString());

const contaRenato: Conta = new Conta(renato, 12345, agenciaSuassuna);
const contaBasante: Conta = new Conta(basante, 54321, agenciaSuassuna);

contaRenato.depositar(3500);
contaRenato.pagar(580, "Faculdade SENAC");
contaRenato.pagar(120, "Academia");
contaRenato.pagar(150, "Vivo");
contaRenato.pagar(380, "NeoEnergia");
contaRenato.pagar(1600, "Cartão Nubank");
contaRenato.sacar(200);

contaBasante.depositar(4000);
contaBasante.pagar(580, "Faculdade SENAC");
contaBasante.pagar(80, "Academia");
contaBasante.pagar(100, "GatoNET");
contaBasante.pagar(1200, "Aluguel");
contaBasante.pagar(250, "NeoEnergia");
contaBasante.pagar(800, "Cartão Nubank");
contaBasante.transferir(100, contaRenato);

console.log(contaRenato.gerarExtrato() + "\n");
console.log(contaBasante.gerarExtrato());