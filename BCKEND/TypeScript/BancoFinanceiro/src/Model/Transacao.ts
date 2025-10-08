import { Cliente } from "./Cliente";

export enum TipoTransacao {
    DEPOSITO = "Depósito",
    SAQUE = "Saque",
    TRANSFERENCIA = "Transferência",
    PAGAMENTO = "Pagamento"
}

export class Transacao {
    private tipo: TipoTransacao;
    private valor: number;
    private data: Date;
    private clienteTransferencia?: Cliente;
    private infoPagamento?: string;
    private tipoValor: string;

    constructor(tipo: TipoTransacao, valor: number, tipoValor: string, clienteTransferencia?: Cliente, infoPagamento?: string) {
        this.tipo = tipo;
        this.valor = valor;
        this.data = new Date();
        if(clienteTransferencia) this.clienteTransferencia = clienteTransferencia;
        if(infoPagamento) this.infoPagamento = infoPagamento;
        this.tipoValor = tipoValor;
    }

    public getTipo(): TipoTransacao {
        return this.tipo;
    }

    public getValor(): number {
        return this.valor;
    }

    public getData(): Date {
        return this.data;
    }

    public getClienteTransferencia(): Cliente | undefined {
        return this.clienteTransferencia;
    }

    public getTipoValor(): string {
        return this.tipoValor;
    }

    public getInfoPagamento(): string | undefined {
        return this.infoPagamento;
    }

    public toString(): string {
        let transacaoStr = `Data: ${this.data.toLocaleString()}, Tipo: ${this.tipo}, Valor: ${this.tipoValor} ${this.valor.toFixed(2)}`;
        if (this.clienteTransferencia) {
            transacaoStr += `, Cliente Transferência: ${this.clienteTransferencia.getNome()}`;
        }
        if (this.infoPagamento) {
            transacaoStr += `, Info Pagamento: ${this.infoPagamento}`;
        }
        return transacaoStr;
    }
    
}