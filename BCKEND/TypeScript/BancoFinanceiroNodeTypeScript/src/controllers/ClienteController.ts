import { Request, Response } from 'express';
import ClienteRepository from '../repositories/ClienteRepository';
import { Cliente } from '../models/Cliente';

export default class ClienteController {

    public async createCliente(req: Request, res: Response): Promise<Response> {
        if (!req.body.cpf) {
            return res.status(400).json({ message: "CPF é obrigatório, no cadastro do cliente!" });
        }

        try {
            const cliente: Cliente = req.body;
            const novoCliente = await ClienteRepository.createCliente(cliente);
            return res.status(201).json(novoCliente);
        } catch (error) {
            return res.status(500).json({ message: error + " - Erro ao criar cliente." });
        }
    }

    public async getAllClientes(req: Request, res: Response): Promise<Response> {
        try {
            const clientes = await ClienteRepository.getAllClientes();
            return res.status(200).json(clientes);
        } catch (error) {
            return res.status(500).json({ message: error + " - Erro ao buscar clientes." });
        }
    }

    public async getClienteByCPF(req: Request, res: Response): Promise<Response> {
        try {
            const cpf: string | undefined = req.params.cpf;
            const cliente = await ClienteRepository.getClienteByCPF(cpf);
            return res.status(200).json(cliente);
        } catch (error) {
            return res.status(500).json({ message: error + " - Erro ao buscar o cliente." });
        }
    }

    public async updateCliente(req: Request, res: Response): Promise<Response> {
        try {
            const cliente: Cliente = req.body;
            const clienteAtualizado = await ClienteRepository.updateCliente(cliente);
            return res.status(200).json(clienteAtualizado);
        } catch (error) {
            return res.status(500).json({ message: error + " - Erro ao atualizar cliente." });
        }
    }

    public async deleteCliente(req: Request, res: Response): Promise<Response> {
        try {
            const cpf: string | undefined = req.params.cpf;
            const clienteEncontrado = await ClienteRepository.getClienteByCPF(cpf);
            if (!clienteEncontrado) {
                return res.status(404).json({ message: "Cliente não encontrado para o CPF informado." });
            } else {
                const mensagem = await ClienteRepository.deleteCliente(clienteEncontrado.cpf);
                return res.status(200).json({ message: mensagem });
            }
        } catch (error) {
            return res.status(500).json({ message: error + " - Erro ao deletar o cliente." });
        }
    }

    public async deleteAll(req: Request, res: Response): Promise<Response> {
        try {
            const numClientesDeletados = await ClienteRepository.deleteAll();
            return res.status(200).json({ message: `Foram deletados ${numClientesDeletados} clientes.` });
        } catch (error) {
            return res.status(500).json({ message: error + " - Erro ao deletar todos os clientes." });
        }
    }


}