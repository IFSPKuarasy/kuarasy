using kuarasy.Models.Contracts.Context;
using kuarasy.Models.Contracts.Repositories;
using kuarasy.Models.Entidades;
using kuarasy.Models.Enums;
using kuarasy.Models.Repositories;
using kuarasy.Models.SqlManager;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace kuarasy.Models.Contexts
{
    public class ContextDataSqlServerOrigem : IContextDataOrigem
    {
        private readonly SqlConnection _connection = null;

        public ContextDataSqlServerOrigem(IConnectionManager connectionManager)
        {
            _connection = connectionManager.GetConnection();
        }
//LISTANDO AS ORIGENS
        public List<Origem> ListarOrigem(){
            var origens = new List<Origem>();
            try
            {
                _connection.Open();

                var query = SqlManagerOrigem.GetSql(TSql.LISTAR_ORIGEM);

                var command = new SqlCommand(query, _connection);

                var dataset = new DataSet();

                var adapter = new SqlDataAdapter(command);
                adapter.Fill(dataset);

                var rows = dataset.Tables[0].Rows;


                foreach (DataRow item in rows)
                {
                    var colunas = item.ItemArray;

                    var id = Convert.ToInt32((colunas[0]));
                    var pais = colunas[1].ToString();
                    var continente = colunas[2].ToString();
                    var descricao = colunas[3].ToString();
                    var imagem = colunas[4].ToString();

                    var origem = new Origem
                    {
                        Id_origem = id,
                        Pais = pais,
                        Continente = continente,
                        Descricao_origem = descricao,
                        Imagem_origem = imagem
                    };
                    origens.Add(origem);
                }

                adapter = null;
                dataset = null;
                return origens;
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
//PESQUISAR ORIGEM
        public Origem PesquisarOrigemProduto(int id)
        {
            try
            {
                Origem origem = null;
                _connection.Open();

                var query = SqlManagerOrigem.GetSql(TSql.PESQUISAR_ORIGEM);

                var command = new SqlCommand(query, _connection);

                command.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
                var dataset = new DataSet();
                var adapter = new SqlDataAdapter(command);
                adapter.Fill(dataset);

                var rows = dataset.Tables[0].Rows;

                foreach (DataRow item in rows)
                {
                    var colunas = item.ItemArray;

                    var id_origem = Convert.ToInt32((colunas[0]));
                    var pais = colunas[1].ToString();
                    var continente = colunas[2].ToString();
                    var imagem = colunas[3].ToString();

                    origem = new Origem
                    {
                        Id_origem = id_origem,
                        Pais = pais,
                        Continente = continente,
                        Imagem_origem = imagem
                    };
                }

                adapter = null;
                dataset = null;
                return origem;

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
//LISTAR PRODUTOS PELA ORIGEM
         public List<Produto> ListarProdutosOrigem(string continente)
        {
            var produtos = new List<Produto>();
            try
            {
                _connection.Open();

                var query = SqlManagerOrigem.GetSql(TSql.LISTAR_PRODUTOS_ORIGEM);

                var command = new SqlCommand(query, _connection);

                command.Parameters.Add("@continente", SqlDbType.VarChar).Value = continente;

                var dataset = new DataSet();
                var adapter = new SqlDataAdapter(command);
                adapter.Fill(dataset);

                var rows = dataset.Tables[0].Rows;


                foreach (DataRow item in rows)
                {
                    var colunas = item.ItemArray;

                    var id = Convert.ToInt32((colunas[0]));
                    var pais = colunas[1].ToString();
                    var nome = colunas[2].ToString();
                    var preco = Convert.ToDecimal(colunas[3]);
                    var imagem = colunas[4].ToString();
                    var desconto = Convert.ToDecimal(colunas[5]);

                    var produto = new Produto {Id = id, Nome = nome, Preco = preco - (preco * desconto), Imagem = imagem, Pais = pais, Desconto = desconto,
                    DescontoCheio = (preco * desconto)};
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
    }
   
}