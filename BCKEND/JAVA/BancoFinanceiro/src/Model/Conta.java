package Model;

import java.util.ArrayList;
import java.util.Date;

public class Conta {
	
	private Cliente cliente;
	private int numero;
	private Date dataCriacao;
	private Agencia ag;
	private double saldo;
	private boolean status;
	private ArrayList<Transacao> transacoes;
	
	public Conta(Cliente cliente, int numero, Agencia ag) {
		this.cliente = cliente;
		this.numero = numero;
		this.ag = ag;
		this.dataCriacao = new Date();
		this.saldo = 0.0;
		this.status = true;
		this.transacoes = new ArrayList<Transacao>();
		
	}

	public Conta(Cliente cliente, Date dataCriacao, Agencia ag, double saldo) {
		super();
		this.cliente = cliente;
		this.dataCriacao = dataCriacao;
		this.ag = ag;
		this.saldo = saldo;
		this.status = true;
		this.transacoes = new ArrayList<Transacao>();
	}
	
	//sacar
	public boolean sacar(double valor) {
		if (valor >= 0) {
			if (this.saldo >= valor) {
				this.saldo -= valor; // this.saldo = this.saldo - valor
				Transacao transacao = new Transacao(TipoTransacao.Saque, 
						valor, '-');
				this.transacoes.add(transacao);
				return true;
			} else {
				System.out.println("Saldo insuficiente!");
				return false;
			}			
		} else {
			System.out.println("Valor inválido!");
			return false;
		}		
	} 
	
	//depositar
	public boolean depositar(double valor) {
		if (valor >= 0) {
			this.saldo += valor;
			Transacao transacao = new Transacao(TipoTransacao.Depósito, 
					valor, '+');
			this.transacoes.add(transacao);
			return true;
		} else {
			System.out.println("Valor inválido!");
			return false;
		}
	}
	
	//transferir
	public boolean transferir(double valor, Conta contaDestino) {
		if (valor > 0 && contaDestino != null && contaDestino.status) {
			if(this.saldo >= valor) {
				this.saldo -= valor;
				Transacao transSaida = new Transacao(TipoTransacao.Transferência,
						valor, contaDestino.cliente, '-');
				this.transacoes.add(transSaida);
				contaDestino.saldo += valor;
				Transacao transDestino = new Transacao(TipoTransacao.Transferência, 
						valor, this.cliente, '+');
				contaDestino.transacoes.add(transDestino);
				return true;
			} else {
				System.out.println("Saldo insuficiente!");
				return false;
			}
		} else {
			System.out.println("Valores inválidos!");
			return false;
		}
	}
	
	//pagar
	public boolean pagar(double valor, String infoPagmento) {
		if (valor > 0 && infoPagmento != null ) {
			if (this.saldo >= valor) {
				this.saldo -= valor;
				Transacao transacao = new Transacao(TipoTransacao.Pagamento, 
						valor, infoPagmento, '-');
				this.transacoes.add(transacao);
				return true;
			} else {
				System.out.println("Saldo insuficiente!");
				return false;
			}
		} else {
			System.out.println("Valores inválidos!");
			return false;
		}
	}
	
	//imprimir extrato
	public String gerarExtrato() {
		String extrato = ".:: Extrato da Conta " + this.numero + " ::.\n";
		extrato += "Cliente: " + this.cliente.getNome() + ", CPF: " + 
				this.cliente.getCpf() + "\n" + "Agência " + this.ag.getNome()
				+ ", Nº " + this.getNumero() + "\n";
		for (Transacao transacao : transacoes) {
			extrato += transacao + "\n";
		}
		extrato += "Salado atual: R$ " + this.saldo;		
		return extrato;
	}

	public Agencia getAg() {
		return ag;
	}

	public void setAg(Agencia ag) {
		this.ag = ag;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public Date getDataCriacao() {
		return dataCriacao;
	}

	public double getSaldo() {
		return saldo;
	}
	
	public int getNumero() {
		return numero;
	}

	public ArrayList<Transacao> getTransacoes() {
		return transacoes;
	}	
	
}
