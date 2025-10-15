package Principal;

import java.util.Date;

import Model.Agencia;
import Model.Cliente;
import Model.Endereco;
import Model.ContaCorrente;
import Model.ContaPoupanca;

public class Principal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//System.out.println("Olá mundo!");
		
		Endereco endRenato = new Endereco("PE", "Olinda", 
				"Tamarineira", "Rua Padre São Miguel", "Ap 1301",
				"50070-190", 123);
		
		Endereco endBasante = new Endereco("PE", "Recife", 
				"Campo Grande", "Rua Gonçalves Dias", "Ap 302",
				"50075-180", 771);
		
		Endereco endAgSuassuna = new Endereco("PE", "Recife", 
				"Santo Amaro", "Rua Suassuna", null,
				"50070-190", 123);
		
		Agencia agSuassuna = new Agencia("Suasssuna", 1234,
				"(81)21263456", "ag.suassuna@banco.senac.br", 
				endAgSuassuna);
		
		Cliente renato = new Cliente("Renato Delgado", 
				"123.456.789-00", new Date(1992, 7, 14), 
				234543, "renato.delgado@gmail.com", "81978788787",
				endRenato);
		
		Cliente basante = new Cliente("João Victor Basante", 
				"331.456.789-00", new Date(1999, 11, 27), 
				234543, "joazinho.basante@gmail.com", "81978786669",
				endBasante);
		
		ContaCorrente contaRenato = new ContaCorrente(renato, 123456, agSuassuna);
		ContaPoupanca contaBasante = new ContaPoupanca(basante, 654321, agSuassuna);
		
		//endRenato.uf = "PE";
		//endRenato.setUf("PE");
		//endRenato.cidade = "Recife"; erro
		//endRenato.setCidade("Recife");
		
		//System.out.println(endRenato);
		
		//System.out.println(renato);
		
		//System.out.println(agSuassuna);
		
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
		
		System.out.println(contaRenato.gerarExtrato() + "\n");
		System.out.println(contaBasante.gerarExtrato());
		
	}

}
