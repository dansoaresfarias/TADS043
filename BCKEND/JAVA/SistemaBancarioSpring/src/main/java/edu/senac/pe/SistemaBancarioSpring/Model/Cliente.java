package edu.senac.pe.SistemaBancarioSpring.Model;

public class Cliente {

	private String nome;
	private String cpf;
	private String dataNasc;
	private Integer rg;
	private String email;
	private String telefone;

	public Cliente(String nome, String cpf, String dataNasc, Integer rg, String email, String telefone) {
		this.nome = nome;
		this.cpf = cpf;
		this.dataNasc = dataNasc;
		this.rg = rg;
		this.email = email;
		this.telefone = telefone;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCpf() {
		return cpf;
	}

	public String getDataNasc() {
		return dataNasc;
	}

	public Integer getRg() {
		return rg;
	}

	@Override
	public String toString() {
		return "Cliente " + nome + ", portador(a) do cpf " + cpf 
				+ ", nasceu em " + dataNasc 
				+ ", portador(a) do RG " + rg + ", " + email
				+ ", telefone: " + telefone;
	}

}
