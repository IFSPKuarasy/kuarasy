using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kuarasy.Models.Contracts.Context;
using kuarasy.Models.Contracts.Repositories;
using kuarasy.Models.Entidades;

namespace kuarasy.Models.Repositories
{
    public class CompraRepository : ICompraRepository
    {
        private readonly IContextDataCompra _contextDataCompra;

        public CompraRepository(IContextDataCompra contextDataCompra)
        {
            _contextDataCompra = contextDataCompra;
        }
        public void Cadastrar(Compra compra)
        {
            _contextDataCompra.CadastrarCompra(compra);
        }
        public Compra PesquisarCompra()
        {
            return _contextDataCompra.PesquisarCompraId();
        }
    }
}