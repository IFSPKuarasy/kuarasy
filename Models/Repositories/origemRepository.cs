using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kuarasy.Models.Contracts.Context;
using kuarasy.Models.Contracts.Repositories;
using kuarasy.Models.Entidades;

namespace kuarasy.Models.Repositories
{
    public class OrigemRepository : IOrigemRepository
    {
        private readonly IContextDataOrigem _contextDataOrigem;

        public OrigemRepository(IContextDataOrigem contextDataOrigem)
        {
            _contextDataOrigem = contextDataOrigem;
        }
        public List<Origem> Listar()
        {
            return _contextDataOrigem.ListarOrigem();
        }
        public Origem Pesquisar(int id)
        {
            return _contextDataOrigem.PesquisarOrigemProduto(id);
        }
         public List<Produto> ListarProdutos(string continente)
        {
            return _contextDataOrigem.ListarProdutosOrigem(continente);
        }

    }
}