import { Funcionario } from "./Model/Funcionario";
import { Telefone } from "./Model/Telefone";

//console.log("Hello World! João Vitor");

const joaoPq = new Funcionario(
    "123.456.789-00",
    "João Victor Rodrigues Basante",
    "M",
    new Date("1999-12-27"),
    "joao.basante@gmail.com",
    5000,
    "Neymarzinho",
    450);

const gi = new Funcionario(
    "456.456.789-00",
    "Giseli Felix dos Santos",
    "F",
    new Date("2000-07-25"),
    "gi.felix@gmail.com",
    5500);

joaoPq.adcionarNumTelefone("(81) 99999-9999");
joaoPq.adcionarNumTelefone("(81) 98888-8888");

gi.adcionarNumTelefone("(81) 97777-7777");
gi.adcionarNumTelefone("(81) 96666-6666");
const telEmpGI = new Telefone("(81) 95555-5555");
gi.adcionarTelefone(telEmpGI);

console.log(joaoPq.toString());
console.log(gi.toString());
console.log(gi);