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
        private readonly IContextData _contextData;

        public OrigemRepository(IContextData contextData)
        {
            _contextData = contextData;
        }

        public List<Origem> Listar()
        {
            return _contextData.ListarOrigem();
        }
        public Origem Pesquisar(int id)
        {
            return _contextData.PesquisarOrigemProduto(id);
        }
         public List<Produto> ListarProdutos(string continente)
        {
            return _contextData.ListarProdutosOrigem(continente);
        }

    }
}