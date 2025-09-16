package Principal;

import java.util.Date;

import Model.Cliente;
import Model.Endereco;

public class Principal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Olá mundo!");
		
		Endereco endRenato = new Endereco("PE", "Olinda", 
				"Tamarineira", "Rua Padre São Miguel", "Ap 1301",
				"50070-190", 123);
		
		Cliente renato = new Cliente("Renato Delgado", 
				"123.456.789-00", new Date(1992, 7, 14), 
				234543, "renato.delgado@gmail.com", "81978788787",
				endRenato);
		
		//endRenato.uf = "PE";
		endRenato.setUf("PE");
		//endRenato.cidade = "Recife"; erro
		endRenato.setCidade("Recife");
		
		System.out.println(endRenato);
		
		System.out.println(renato);
		
	}

}
