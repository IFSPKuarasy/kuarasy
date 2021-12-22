using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kuarasy.Models.Contracts.Services;
using kuarasy.Models.Contracts.Repositories;
using kuarasy.Models.Entidades;

namespace kuarasy.Models.Services{

    public class OrigemService : IOrigemService
    {
        private readonly IOrigemRepository _origemRepository;
        public OrigemService(IOrigemRepository origemRepository) {
        _origemRepository = origemRepository;
        }

        public List<Origem> Listar()
        {
            try
            {
                var origens = new List<Origem>();
                origens = _origemRepository.Listar();
                return origens;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Origem Pesquisar(int id)
        {
            try
            {
                var origem = _origemRepository.Pesquisar(id);
                return origem;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Produto> ListarProdutos(string continente)
        {
            try
            {
                var produtos = _origemRepository.ListarProdutos(continente);
                return produtos;
            }
            catch (Exception)
            {
                throw;
            }
        }
        
    }
}