import { AppDataSource } from "../db/data-source";
import { Cliente } from "../models/Cliente";

class ClienteRepository {
    clienteRepository = AppDataSource.getRepository(Cliente);

    async createCliente(cliente: Cliente): Promise<Cliente> {
        try {
            return await this.clienteRepository.save(cliente);
        } catch (error) {
            throw new Error(`Erro ao criar cliente: ${error}`);
        }
    }

    async getAllClientes(): Promise<Array<Cliente>> {
        try {
            return await this.clienteRepository.find();
        } catch (error) {
            throw new Error(`Erro ao buscar clientes: ${error}`);
        }
    }

    async getClienteByCPF(cpf: string | undefined): Promise<Cliente | null> {
        try {
            if (!cpf) {
                throw new Error("CPF não fornecido");
            }
            return await this.clienteRepository.findOneBy({ cpf: cpf });
        } catch (error) {
            throw new Error(`Erro ao buscar cliente por CPF: ${error}`);
        }
    }

    async updateCliente(cliente: Cliente) {
        const { cpf, nome, dataNascimento, rg, email, telefone } = cliente;
        try {
            return await this.clienteRepository.save(cliente);
        } catch (error) {
            throw new Error(`Erro ao atualizar cliente: ${error}`);
        }
    }

    async deleteCliente(cpf: string) {
        try {
            await this.clienteRepository.delete(cpf);
        } catch (error) {
            throw new Error(`Erro ao deletar cliente: ${error}`);
        }
    }

    async deleteAll(): Promise<number> {
        try {
            let num = this.clienteRepository.query("select count(cpf) from clientes;");
            this.clienteRepository.query("delete from clientes;");
            return num;
        } catch (error) {
            throw new Error("Falha ao deletar todos os clientes!");
        }
    }

}

export default new ClienteRepository();
