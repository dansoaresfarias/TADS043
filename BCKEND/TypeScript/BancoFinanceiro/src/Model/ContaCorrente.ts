import { Conta } from "./Conta";
import { Cliente } from "./Cliente";
import { Agencia } from "./Agencia";

export class ContaCorrente extends Conta {
    private taxaManutencao: number;

    constructor(cliente: Cliente, numero: number, agencia: Agencia) {
        super(cliente, numero, agencia);
        this.taxaManutencao = 0.01;
    }

    public getTaxaManutencao(): number {
        return this.taxaManutencao;
    }

    public setTaxaManutencao(taxa: number): void {
        this.taxaManutencao = taxa;
    }

    public sacar(valor: number): boolean {
        return super.sacar(valor + this.taxaManutencao * valor);
    }

}