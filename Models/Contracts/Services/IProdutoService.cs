using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kuarasy.Models.Dtos;

namespace kuarasy.Models.Contracts.Services
{
	public interface IProdutoService
    {
        List<ProdutoDto> Listar();
        void Cadastrar(ProdutoDto produto);
        ProdutoDto PesquisarPorId(int id);
        void Atualizar(ProdutoDto produto);
        void Excluir(int id);
    }
}