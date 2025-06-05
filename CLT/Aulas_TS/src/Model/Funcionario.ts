import { Telefone } from "./Telefone";

export class Funcionario {
    private cpf : string;
    private nome : string;
    private nomeSocial? : string; 
    private genero : string;
    private dataNascimento : Date;
    private email : string;
    private salario : number;
    private status : boolean;
    private fg? : number;
    private telefones : Telefone[] = []; // Array to hold Telefone objects

    //create constructor
    constructor(cpf: string, nome: string, genero: string, dataNascimento: Date, email: string, salario: number, nomeSocial?: string, fg?: number) {
        this.cpf = cpf;
        this.nome = nome;
        this.genero = genero;
        this.dataNascimento = dataNascimento;
        this.email = email;
        this.salario = salario;
        this.status = true;
        this.nomeSocial = nomeSocial;
        this.fg = fg;
    }

    //create getters and setters
    public getCpf(): string {
        return this.cpf;
    }

    public getNome(): string {
        return this.nome;
    }

    public setNome(nome: string): void {
        this.nome = nome;
    }

    public getNomeSocial(): string | undefined {
        return this.nomeSocial;
    }

    public setNomeSocial(nomeSocial: string | undefined): void {
        this.nomeSocial = nomeSocial;
    }

    public getGenero(): string {
        return this.genero;
    }

    public setGenero(genero: string): void {
        this.genero = genero;
    }

    public getDataNascimento(): Date {
        return this.dataNascimento;
    }

    public getEmail(): string {
        return this.email;
    }

    public setEmail(email: string): void {
        this.email = email;
    }

    public getSalario(): number {
        return this.salario;
    }

    public setSalario(salario: number): void {
        this.salario = salario;
    }

    public getStatus(): boolean {
        return this.status;
    }

    public setStatus(status: boolean): void {
        this.status = status;
    }

    public getFg(): number | undefined {
        return this.fg;
    }

    public setFg(fg: number | undefined): void {
        this.fg = fg;
    }

    // Method to add a Telefone object to the telefones array
    public adcionarTelefone(telefone: Telefone): void { 
        this.telefones.push(telefone);
    }
    
    public adcionarNumTelefone(numero: string): void {
        const telefone = new Telefone(numero);
        this.telefones.push(telefone);
    }

    public removerTelefone(telefone: Telefone): void {
        const index = this.telefones.indexOf(telefone);
        if (index > -1) {
            this.telefones.splice(index, 1);
        } else {
            console.log("Telefone não encontrado.");
        }
    }

    public removerNumTelefone(numero: string): void {
        const index = this.telefones.findIndex(t => t.getNumero() === numero);
        if (index > -1) {
            this.telefones.splice(index, 1);
        } else {
            console.log("Telefone não encontrado.");
        }
    }

    // Method to return a string representation of the Funcionario
    toString(): string {    
        return `Funcionário: ${this.nome}${ this.nomeSocial ? ' | ' + this.nomeSocial : ''}, CPF: ${this.cpf}, Data de Nascimento: ${this.dataNascimento.toLocaleDateString()}, Email: ${this.email}, Salário: R$${this.salario}, Status: ${ this.status ? 'Ativo' : 'Inativo' }, Função Gratificada: ${this.fg !== undefined ? 'R$'+this.fg : 'N/A'}, Telefones: ${this.telefones.map(t => t.toString()).join(', ')}`;
    }
}