package Model;

import java.util.Date;

public class ContaPoupanca extends Conta {

	private double taxaRendimento;

	// Polimorfismo de sobrecarga
	public ContaPoupanca(Cliente cliente, Date dataCriacao, Agencia ag, double saldo) {
		super(cliente, dataCriacao, ag, saldo);
		// TODO Auto-generated constructor stub
		this.taxaRendimento = 0.02;
	}

	// Polimorfismo de sobrecarga
	public ContaPoupanca(Cliente cliente, int numero, Agencia ag) {
		super(cliente, numero, ag);
		// TODO Auto-generated constructor stub
		this.taxaRendimento = 0.02;
	}

	public double getTaxaRendimento() {
		return taxaRendimento;
	}

	public void setTaxaRendimento(double taxaRendimento) {
		this.taxaRendimento = taxaRendimento;
	}

	// Polimorfismo de sobrescrita
	@Override
	public boolean depositar(double valor) {
		return super.depositar(valor + valor * this.taxaRendimento);
	}

}
