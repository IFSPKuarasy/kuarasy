using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kuarasy.Models.Contracts.Context;
using kuarasy.Models.Contracts.Repositories;
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

        public List<Produto> Listar(int porPaginas, int paginaAtual, string Order, string By)
        {
            return _contextData.ListarProduto(porPaginas, paginaAtual, Order, By);
        }
        public int Contagem(string inputSearch)
        {
            return _contextData.ContagemProduto(inputSearch);
        }
        public Produto PesquisarPorId(int id)
        {
            return _contextData.PesquisarProdutoPorId(id);
        }

        public List<Produto> Pesquisar(string inputSearch, int porPaginas, int paginaAtual, string Order, string By)
        {
            return _contextData.PesquisarProduto(inputSearch, porPaginas, paginaAtual,  Order, By);
        }
        public List<Tipo> ListarTipo(string area)
        {
            return _contextData.ListarTipoDaCategoria(area);
        }
        public string Categoria(string tipo)
        {
            return _contextData.BuscarCategoria(tipo);
        }
    }
}