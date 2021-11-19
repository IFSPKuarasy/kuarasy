using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kuarasy.Models.Dtos;
using kuarasy.Models.Contracts.Services;
using kuarasy.Models.Contracts.Repositories;

namespace kuarasy.Models.Services{

    public class ProdutoService : IProdutoService
    {
        private readonly IProdutoRepository _produtoRepository;
        public ProdutoService(IProdutoRepository produtoRepository) {
            _produtoRepository = produtoRepository;
        }

        public void Atualizar(ProdutoDto produto)
        {
            try
            {
                var objProduto = produto.ConverterParaEntidade();
                _produtoRepository.Atualizar(objProduto );
            }
            catch (Exception)
            {
                throw;
            }

        }

        public void Cadastrar(ProdutoDto produto)
        {
            try 
            {
                var objProduto = produto.ConverterParaEntidade();
                _produtoRepository.Cadastrar(objProduto);
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

        public List<ProdutoDto> Listar()
        {
            try
            {
                var produtosDto = new List<ProdutoDto>();
                var produtos = _produtoRepository.Listar();
                foreach(var item  in produtos)
                {
                    produtosDto.Add(item.ConverterParaDto());
                }
                return produtosDto;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public ProdutoDto PesquisarPorId(int id)
        {
            try
            {
                var produtos =  _produtoRepository.PesquisarPorId(id);
                return produtos.ConverterParaDto();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}