using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kuarasy.Models.Contracts.Services;
using kuarasy.Models.Contracts.Repositories;
using kuarasy.Models.Entidades;

namespace kuarasy.Models.Services{

    public class CompraService : ICompraService
    {
        private readonly ICompraRepository _compraRepository;
        public CompraService(ICompraRepository compraRepository) {
        _compraRepository = compraRepository;
        }

        public void Cadastrar(Compra compra)
        {
            try
            {                
                _compraRepository.Cadastrar(compra);
            }
            catch (Exception)
            {
                throw;
            }
        }

          public Compra PesquisarCompra()
        {
            try
            {           
                Compra compra = _compraRepository.PesquisarCompra(); 
                return compra;
            }
            catch (Exception)
            {
                throw;
            }
        }
        
    }
}