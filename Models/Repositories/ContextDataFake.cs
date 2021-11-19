using kuarasy.Models.Contracts.Context;
using kuarasy.Models.Dtos;
using kuarasy.Models.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;

namespace kuarasy.Models.Repositories
{
    public class ContextDataFake : IContextData
    {
        private static List<Produto> produtos;

        public  ContextDataFake()
        {
            produtos = new List<Produto>();
            InitializeData();
        }

        public void AtualizarProduto(Produto produto)
        {
            try
            {
                var objPesquisa = PesquisarProdutoPorId(produto.Id);
                produtos.Remove(objPesquisa);

                objPesquisa.Nome = produto.Nome;
                objPesquisa.Preco = produto.Preco;
                objPesquisa.Descricao = produto.Descricao;
                objPesquisa.Quantidade = produto.Quantidade;
                objPesquisa.Peso = produto.Peso;

                CadastrarProduto(objPesquisa);

            }
            catch (Exception)
            {
                throw;

            }
        }

        public void CadastrarProduto(Produto produto)
        {
            try
            {
                produtos.Add(produto);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void ExcluirProduto(int id)
        {
            try
            {
                var objPesquisa = PesquisarProdutoPorId(id);
                produtos.Remove(objPesquisa);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Produto> ListarProduto()
        {
            try
            {
                return produtos.OrderBy(p => p.Nome).ToList();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Produto PesquisarProdutoPorId(int id)
        {
            try
            {
                return produtos.FirstOrDefault(p => p.Id == id);
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void InitializeData()
        {
            var produto = new Produto{Nome = "Harry Potter", Preco = 34.20f, Descricao = "AAAAAAAA", Quantidade = 1, Peso = 500};
            produtos.Add(produto);

            produto = new Produto{Nome = "Harry Potter", Preco = 34.20f, Descricao = "AAAAAAAA", Quantidade = 1, Peso = 500};
            produtos.Add(produto);

            produto = new Produto{Nome = "Harry Potter", Preco = 34.20f, Descricao = "AAAAAAAA", Quantidade = 1, Peso = 500};
            produtos.Add(produto);

            produto = new Produto{Nome = "Harry Potter", Preco = 34.20f, Descricao = "AAAAAAAA", Quantidade = 1, Peso = 500};
            produtos.Add(produto);

            produto = new Produto{Nome = "Harry Potter", Preco = 34.20f, Descricao = "AAAAAAAA", Quantidade = 1, Peso = 500};
            produtos.Add(produto);
        }
    }

}