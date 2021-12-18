using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kuarasy.Models.Entidades;

namespace kuarasy.Models.Contracts.Repositories
{
    public interface ICompraRepository
    {
        void Cadastrar(Compra compra);
        Compra PesquisarCompra();
    }

}