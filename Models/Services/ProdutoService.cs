using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kuarasy.Models.Contracts.Services;
using kuarasy.Models.Contracts.Repositories;
using kuarasy.Models.Entidades;

namespace kuarasy.Models.Services{

    public class ProdutoService : IProdutoService
    {
        private readonly IProdutoRepository _produtoRepository;
        public ProdutoService(IProdutoRepository produtoRepository) {
            _produtoRepository = produtoRepository;
        }

        public void Atualizar(Produto produto)
        {
            try
            {
                _produtoRepository.Atualizar(produto);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public void Cadastrar(Produto produto)
        {
            try 
            {
                _produtoRepository.Cadastrar(produto);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Excluir(int id)
        {
            try
            {
                _produtoRepository.Excluir(id);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Produto> Listar(int porPaginas, int paginaAtual, string Order, string By)
        {
            try
            {
                var produtos = new List<Produto>();
                produtos = _produtoRepository.Listar(porPaginas, paginaAtual, Order, By);
                return produtos;
            }
            catch (Exception)
            {
                throw;
            }
        }
         public int Contagem(string inputSearch)
        {
            try
            {
                
                int qtd = _produtoRepository.Contagem(inputSearch);
                return qtd;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Produto> Pesquisar(string inputSearch, int porPaginas, int paginaAtual, string Order, string By)
        {
            try
            {
                var produtos = _produtoRepository.Pesquisar(inputSearch, porPaginas, paginaAtual, Order, By);
                return produtos;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Produto PesquisarPorId(int id)
        {
            try
            {
                var produtos =  _produtoRepository.PesquisarPorId(id);
                return produtos;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Tipo> ListarTipo(string area)
        {
            try
            {
                var tipos = _produtoRepository.ListarTipo(area);
                return tipos;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public string Categoria(string tipo)
        {
            try
            {
                var categoria = _produtoRepository.Categoria(tipo);
                return categoria;
            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}