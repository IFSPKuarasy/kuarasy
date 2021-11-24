using kuarasy.Models.Contracts.Context;
using kuarasy.Models.Contracts.Repositories;
using kuarasy.Models.Dtos;
using kuarasy.Models.Entidades;
using kuarasy.Models.Enums;
using kuarasy.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace kuarasy.Models.Contexts
{
    public class ContextDataSqlServer : IContextData
    {
        private readonly SqlConnection _connection = null;

        public ContextDataSqlServer(IConnectionManager connectionManager)
        {
            _connection = connectionManager.GetConnection();
        }


        public void CadastrarProduto(Produto produto)
        {
           try
           {
               _connection.Open();
               var query = SqlManager.GetSql(TSql.CADASTRAR_PRODUTO);

               var command = new SqlCommand(query, _connection);

               command.Parameters.Add("@nome", SqlDbType.VarChar).Value = produto.Nome;
               command.Parameters.Add("@preco", SqlDbType.VarChar).Value = produto.Preco;
               command.Parameters.Add("@descricao", SqlDbType.VarChar).Value = produto.Descricao;
               command.Parameters.Add("@quantidade", SqlDbType.VarChar).Value = produto.Quantidade;
               command.Parameters.Add("@peso", SqlDbType.VarChar).Value = produto.Peso;
                command.Parameters.Add("@id_tipo", SqlDbType.Int).Value = produto.TipoProduto.GetHashCode();


                command.ExecuteNonQuery();


           }
           catch (Exception)
           {
               throw;
           }
           finally
           {
               if (_connection.State == ConnectionState.Open)
                   _connection.Close();
           }
        }
        public void AtualizarProduto(Produto produto)
        {
            try
            {
                _connection.Open();
                var query = SqlManager.GetSql(TSql.ATUALIZAR_PRODUTO);

                var command = new SqlCommand(query, _connection);

                command.Parameters.Add("@id", SqlDbType.VarChar).Value = produto.Id;
                command.Parameters.Add("@nome", SqlDbType.VarChar).Value = produto.Nome;
                command.Parameters.Add("@preco", SqlDbType.VarChar).Value = produto.Preco;
                command.Parameters.Add("@descricao", SqlDbType.VarChar).Value = produto.Descricao;
                command.Parameters.Add("@quantidade", SqlDbType.VarChar).Value = produto.Quantidade;
                command.Parameters.Add("@peso", SqlDbType.VarChar).Value = produto.Peso;

                command.ExecuteNonQuery();


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (_connection.State == ConnectionState.Open)
                    _connection.Close();
            }
        }
        public void ExcluirProduto(int id)
        {
            try
            {
                _connection.Open();
                var query = SqlManager.GetSql(TSql.EXCLUIR_PRODUTO);

                var command = new SqlCommand(query, _connection);

                command.Parameters.Add("@id", SqlDbType.VarChar).Value = id;

                command.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (_connection.State == ConnectionState.Open)
                    _connection.Close();
            }
        }
        public List<Produto> ListarProduto()
        {
            var produtos = new List<Produto>();
            try
            {
                var query = SqlManager.GetSql(TSql.LISTAR_PRODUTO);

                var command = new SqlCommand(query, _connection);

                var dataset = new DataSet();
                var adapter = new SqlDataAdapter(command);
                adapter.Fill(dataset);

                var rows = dataset.Tables[0].Rows;

                foreach (DataRow item in rows)
                {
                    var colunas = item.ItemArray;

                    var id = Convert.ToInt32((colunas[0]));
                    var nome = colunas[1].ToString();
                    var preco = Convert.ToSingle(colunas[2]);
                    var descricao = colunas[3].ToString();
                    var quantidade = Convert.ToInt32((colunas[4]));
                    var peso = Convert.ToSingle(colunas[5]);
            

                    var produto = new Produto {Id = id, Nome = nome, Preco = preco, Descricao = descricao, Quantidade = quantidade, Peso = peso};
                    produtos.Add(produto);
                }

                adapter = null;
                dataset = null;
                return produtos; 


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (_connection.State == ConnectionState.Open)
                    _connection.Close();
            }
        }
        public Produto PesquisarProdutoPorId(int id)
        {
            try
            {
                Produto produto= null;
                var query = SqlManager.GetSql(TSql.PESQUISAR_PRODUTO);

                var command = new SqlCommand(query, _connection);
                command.Parameters.Add("@id", SqlDbType.VarChar).Value = id;

                var dataset = new DataSet();
                var adapter = new SqlDataAdapter(command);
                adapter.Fill(dataset);

                var rows = dataset.Tables[0].Rows;

                foreach (DataRow item in rows)
                {
                    var colunas = item.ItemArray;

                   
                    var codigo = Convert.ToInt32(colunas[0]);
                    var nome = colunas[1].ToString();
                    var preco = Convert.ToSingle(colunas[2]);
                    var descricao = colunas[3].ToString();
                    var quantidade = Convert.ToInt32((colunas[4]));
                    var peso = Convert.ToSingle(colunas[5]);
      

                    produto = new Produto {Id = codigo, Nome = nome, Preco = preco, Descricao = descricao, Quantidade = quantidade, Peso = peso};
                }

                adapter = null;
                dataset = null;
                return produto;


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (_connection.State == ConnectionState.Open)
                    _connection.Close();
            }
        }
    }

}