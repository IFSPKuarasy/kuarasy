using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kuarasy.Models.Entidades;

namespace kuarasy.Models.Contracts.Services
{
    public interface ICompraService
    {
        void Cadastrar(Compra compra);

    }
}