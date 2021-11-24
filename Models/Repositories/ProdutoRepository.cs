using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kuarasy.Models.Contracts.Context;
using kuarasy.Models.Contracts.Repositories;
using kuarasy.Models.Dtos;
using kuarasy.Models.Entidades;

namespace kuarasy.Models.Repositories
{
    public class ProdutoRepository : IProdutoRepository
    {
        private readonly IContextData _contextData;

        public ProdutoRepository(IContextData contextData)
        {
            _contextData = contextData;
        }
        public void Atualizar(Produto produto)
        {
            _contextData.AtualizarProduto(produto);
        }

        public void Cadastrar(Produto produto)
        {
            _contextData.CadastrarProduto(produto);
        }

        public void Excluir(int id)
        {
            _contextData.ExcluirProduto(id);
        }

        public List<Produto> Listar()
        {
            return _contextData.ListarProduto();
        }
        public Produto PesquisarPorId(int id)
        {
            return _contextData.PesquisarProdutoPorId(id);
        }
    }
}