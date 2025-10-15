import { Agencia } from "./Agencia";
import { Cliente } from "./Cliente";
import { TipoTransacao, Transacao } from "./Transacao";

export abstract class Conta {

    private cliente: Cliente;
    private numero: number;
    private agencia: Agencia;
    private dataCriacao: Date;
    private saldo: number;
    private status: boolean;
    private transacoes: Transacao[];

    constructor(cliente: Cliente, numero: number, agencia: Agencia) {
        this.cliente = cliente;
        this.numero = numero;
        this.agencia = agencia;
        this.dataCriacao = new Date();
        this.saldo = 0;
        this.status = true;
        this.transacoes = [];
    }

    public getCliente(): Cliente {
        return this.cliente;
    }

    public getNumero(): number {
        return this.numero;
    }

    public getAgencia(): Agencia {
        return this.agencia;
    }

    public getDataCriacao(): Date {
        return this.dataCriacao;
    }

    public getSaldo(): number {
        return this.saldo;
    }

    public isAtiva(): boolean {
        return this.status;
    }

    public getTransacoes(): Transacao[] {
        return this.transacoes;
    }

    //depositar
    public depositar(valor: number): boolean {
        if (valor <= 0 || !this.status) {
            console.log("Valor inválido ou conta inativa.");
            return false;
        }else {
            this.saldo += valor;
            const transacao = new Transacao(TipoTransacao.DEPOSITO, valor, 
                "+");
            this.transacoes.push(transacao);
            return true;
        }
    }
    //sacar
    public sacar(valor: number): boolean {
        if (valor <= 0 || valor > this.saldo || !this.status) {
            console.log("Valor inválido, saldo insuficiente ou conta inativa.");
            return false;
        }else {
            this.saldo -= valor;
            const transacao = new Transacao(TipoTransacao.SAQUE, valor, 
                "-");
            this.transacoes.push(transacao);
            return true;
        }
    }

    //transferir
    public transferir(valor: number, contaDestino: Conta): boolean {
        if (valor <= 0 || valor > this.saldo || !this.status) {
            console.log("Valor inválido, saldo insuficiente ou conta inativa.");
            return false;
        }else {     
            this.saldo -= valor;
            contaDestino.saldo += valor;
            const transacaoSaida = new Transacao(TipoTransacao.TRANSFERENCIA, valor, 
                "-", contaDestino.cliente);
            this.transacoes.push(transacaoSaida);
            const transacaoEntrada = new Transacao(TipoTransacao.TRANSFERENCIA, valor, 
                "+", this.cliente);
            contaDestino.transacoes.push(transacaoEntrada);
            return true;
        }
    }

    //pagar
    public pagar(valor: number, descricao: string): boolean {
        if (valor <= 0 || valor > this.saldo || !this.status) {
            console.log("Valor inválido, saldo insuficiente ou conta inativa.");
            return false;
        }else {     
            this.saldo -= valor;
            const transacao = new Transacao(TipoTransacao.PAGAMENTO, valor, 
                "-", undefined, descricao);
            this.transacoes.push(transacao);
            return true;
        }
    }

    //imprimir extrato
    public gerarExtrato(): void {
        console.log(`\nExtrato da Conta ${this.numero} - Agência ${this.agencia.getNumero()}`);
        console.log(`Cliente: ${this.cliente.getNome()}`);
        console.log("Transações:");
        if (this.transacoes.length === 0) {
            console.log("Nenhuma transação realizada.");
        } else {
            this.transacoes.forEach((transacao, index) => {
                console.log(`${transacao.toString()}`);
            });
        }
        console.log(`Saldo Atual: R$ ${this.saldo.toFixed(2)} \n`);
    }

}