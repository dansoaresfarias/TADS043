package Model;

import java.util.Date;

enum TipoTransacao {
	Depósito, Saque, Pagamento, Transferência
}

public class Transacao {

	private TipoTransacao tipo;
	private Date data;
	private double valor;
	private Cliente clienteTransferencia;
	private String infoPag;
	private char tipoValor;

	public Transacao(TipoTransacao tipo, double valor, char tipoValor) {
		super();
		this.tipo = tipo;
		this.data = new Date();
		this.valor = valor;
		this.clienteTransferencia = null;
		this.infoPag = null;
		this.tipoValor = tipoValor;
	}

	public Transacao(TipoTransacao tipo, double valor, Cliente clienteTransferencia, char tipoValor) {
		super();
		this.tipo = tipo;
		this.data = new Date();
		this.valor = valor;
		this.clienteTransferencia = clienteTransferencia;
		this.infoPag = null;
		this.tipoValor = tipoValor;
	}

	public Transacao(TipoTransacao tipo, double valor, String infoPag, char tipoValor) {
		super();
		this.tipo = tipo;
		this.data = new Date();
		this.valor = valor;
		this.clienteTransferencia = null;
		this.infoPag = infoPag;
		this.tipoValor = tipoValor;
	}

	public TipoTransacao getTipo() {
		return tipo;
	}

	public Date getData() {
		return data;
	}

	public double getValor() {
		return valor;
	}

	public Cliente getClienteTransferencia() {
		return clienteTransferencia;
	}

	public char getTipoValor() {
		return tipoValor;
	}

	public String getInfoPagamento() {
		return infoPag;
	}

	@Override
	public String toString() {
		if (clienteTransferencia != null) {
			return data.getDate() + "/" + (data.getMonth()+1) + "/" + 
					(data.getYear()+1900) + "\t" + tipo + "\t"
					+ clienteTransferencia.getNome() + "\t" + tipoValor + 
					" R$ " + valor;
		} else if(infoPag != null) {
			return data.getDate() + "/" + (data.getMonth()+1) + "/" + 
					(data.getYear()+1900) + "\t" + tipo + "\t"
					+ infoPag + "\t" + tipoValor + " R$ " + valor;
		} else {
			return data.getDate() + "/" + (data.getMonth()+1) + "/" + 
					(data.getYear()+1900) + "\t" + tipo + "\t"
					+ tipoValor + " R$ " + valor;
		}
	}

}
