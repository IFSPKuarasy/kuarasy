using kuarasy.Models.Contracts.Context;
using kuarasy.Models.Contracts.Repositories;
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
//PEGANDO TODOS OS PRODUTOS
        public List<Produto> ListarProduto()
        {
            var produtos = new List<Produto>();
            try
            {
                _connection.Open();

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
                    var nome_tipo = colunas[6].ToString();
                    var imagem = colunas[7].ToString();

                    var produto = new Produto {Id = id, Nome = nome, Preco = preco, Descricao = descricao, Quantidade = quantidade, Peso = peso, Nome_tipo = nome_tipo,
                    Imagem = imagem};
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

//ETAPAS DE CADASTRAMENTO DE PRODUTO---------------
        public void CadastrarProduto(Produto produto)
        {
           try
           {
               _connection.Open();
               var query = SqlManager.GetSql(TSql.CADASTRAR_PRODUTO);
               var query2 = SqlManager.GetSql(TSql.ULTIMO_REGRISTO_TAMANHO);


                var command = new SqlCommand(query, _connection);
               var command2 = new SqlCommand(query2, _connection);

                //SALVANDO TAMANHO
               CadastrarTamanho(produto);

                //BUSCANDO ULTIMO REGRISTRO DE TAMANHO NO BANCO PARA INSERIR NO PRODUTO

                int id_tamanho = (Int32)command2.ExecuteScalar();
                command.Parameters.Add("@id_tamanho", SqlDbType.Int).Value = id_tamanho;
                

                //SALVANDO PRODUTO
               command.Parameters.Add("@nome", SqlDbType.VarChar).Value = produto.Nome;
               command.Parameters.Add("@preco", SqlDbType.Float).Value = produto.Preco;
               command.Parameters.Add("@descricao", SqlDbType.VarChar).Value = produto.Descricao;
               command.Parameters.Add("@quantidade", SqlDbType.Int).Value = produto.Quantidade;
               command.Parameters.Add("@peso", SqlDbType.Float).Value = produto.Peso;
               command.Parameters.Add("@id_tipo", SqlDbType.Int).Value = produto.Id_tipo;
               command.Parameters.Add("@imagem", SqlDbType.VarChar).Value = produto.Imagem;
               
                command.ExecuteNonQuery();

                CadastrarOrigemProduto(produto);

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
        public void CadastrarOrigemProduto(Produto produto){
                var query = SqlManager.GetSql(TSql.ULTIMO_REGRISTO_PRODUTO);
                var query2 = SqlManager.GetSql(TSql.CADASTRAR_ORIGEM_PRODUTO);
                var command = new SqlCommand(query, _connection);
                var command2 = new SqlCommand(query2, _connection);
                var dataset = new DataSet();
                var adapter = new SqlDataAdapter(command);
                adapter.Fill(dataset);
                var rows = dataset.Tables[0].Rows;
                foreach (DataRow item in rows)
                {
                    var colunas = item.ItemArray;
                    var id_produto = Convert.ToInt32((colunas[0]));
                    command2.Parameters.Add("@id_produto", SqlDbType.Int).Value = id_produto;
                    command2.Parameters.Add("@id_origem", SqlDbType.Int).Value = produto.Id_origem;
                }                
                command2.ExecuteNonQuery();
                adapter = null;
                dataset = null;
        }

        public void CadastrarTamanho(Produto produto){
            var query = SqlManager.GetSql(TSql.CADASTRAR_TAMANHO);
            var command = new SqlCommand(query, _connection);
             //SALVANDO TAMAMANHO
                command.Parameters.Add("@altura", SqlDbType.Float).Value = produto.Altura;
               command.Parameters.Add("@largura", SqlDbType.Float).Value = produto.Largura;
               command.Parameters.Add("@comprimento", SqlDbType.Float).Value = produto.Comprimento;
               command.ExecuteNonQuery();
        }

//FIM DE ETAPAS DE CADASTRAMENTO DE PRODUTO----------

        public void AtualizarProduto(Produto produto)
        {
            try
            {
                _connection.Open();
                var query = SqlManager.GetSql(TSql.ATUALIZAR_PRODUTO);

                var command = new SqlCommand(query, _connection);

                command.Parameters.Add("@id", SqlDbType.Int).Value = produto.Id;
                command.Parameters.Add("@nome", SqlDbType.VarChar).Value = produto.Nome;
                command.Parameters.Add("@preco", SqlDbType.Float).Value = produto.Preco;
                command.Parameters.Add("@descricao", SqlDbType.VarChar).Value = produto.Descricao;
                command.Parameters.Add("@quantidade", SqlDbType.Int).Value = produto.Quantidade;
                command.Parameters.Add("@peso", SqlDbType.Float).Value = produto.Peso;

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

//ETAPAS DE EXCLUSÃO DE PRODUTO------------------
        public void ExcluirProduto(int id)
        {
            try
            {
                _connection.Open();
                var query = SqlManager.GetSql(TSql.EXCLUIR_PRODUTO);
                
                var command = new SqlCommand(query, _connection);
                
                ExcluirOrigemProduto(id);

                command.Parameters.Add("@id", SqlDbType.Int).Value = id;
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
        public void ExcluirOrigemProduto(int id)
        {
            var query = SqlManager.GetSql(TSql.EXCLUIR_ORIGEM_PRODUTO);
            var command = new SqlCommand(query, _connection);
            command.Parameters.Add("@id_produto", SqlDbType.Int).Value = id;            
            command.ExecuteNonQuery();
        }
//FIM DE ETAPAS DE EXCLUSÃO DE PRODUTO-----------


//PESQUISANDO APENAS UM PRODUTO PELO ID
        public Produto PesquisarProdutoPorId(int id)
        {
            try
            {
                Produto produto= null;
                var query = SqlManager.GetSql(TSql.PESQUISAR_PRODUTO);

                var command = new SqlCommand(query, _connection);
                command.Parameters.Add("@id", SqlDbType.Int).Value = id;

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

//PESQUISANDO PRODUTOS PELA BARRA DE PESQUISA
        public List<Produto> PesquisarProduto(string inputSearch)
        {
            
            var produtos = new List<Produto>();
            try
            {
                _connection.Open();

                var query = SqlManager.GetSql(TSql.PESQUISAR);

                var command = new SqlCommand(query, _connection);

                command.Parameters.Add("@inputSearch", SqlDbType.VarChar).Value = inputSearch;
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
                    var nome_tipo = colunas[6].ToString();
                    var imagem = colunas[7].ToString();

                    var produto = new Produto
                    {
                        Id = id,
                        Nome = nome,
                        Preco = preco,
                        Descricao = descricao,
                        Quantidade = quantidade,
                        Peso = peso,
                        Nome_tipo = nome_tipo,
                        Imagem = imagem

                    };
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

        public List<Origem> ListarOrigem(){
            var origens = new List<Origem>();
            try
            {
                _connection.Open();

                var query = SqlManager.GetSql(TSql.LISTAR_ORIGEM);

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

                    var origem = new Origem
                    {
                        Id_origem = id,
                        Pais = pais,
                        Continente = continente,
                        Descricao_origem = descricao,
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

        public List<Tipo> ListarTipoDaCategoria(string area)
        {
            var tipos = new List<Tipo>();
            try
            {
                _connection.Open();

                var query = SqlManager.GetSql(TSql.LISTAR_TIPO);

                var command = new SqlCommand(query, _connection);

                command.Parameters.Add("@area", SqlDbType.VarChar).Value = area;
                var dataset = new DataSet();

                var adapter = new SqlDataAdapter(command);
                adapter.Fill(dataset);

                var rows = dataset.Tables[0].Rows;


                foreach (DataRow item in rows)
                {
                    var colunas = item.ItemArray;

                    var contagem_tipo = ContagemTipo(Convert.ToInt32(colunas[0]));
                    var nome = colunas[1].ToString();
                    var nome_categoria = colunas[2].ToString();

                    var tipo = new Tipo()
                    {
                        Nome_tipo = nome,
                        Nome_categoria = nome_categoria,
                        Contagem_tipo = contagem_tipo
                    };
                    tipos.Add(tipo);
                }

                adapter = null;
                dataset = null;
                return tipos;


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

        public int ContagemTipo(int id_tipo)
        {
            var query = SqlManager.GetSql(TSql.CONTAGEM_TIPO);

            var command = new SqlCommand(query, _connection);

            command.Parameters.Add("@id_tipo", SqlDbType.VarChar).Value = id_tipo;
 
            int numero = (Int32)command.ExecuteScalar();
            
            return numero;

        }

        public string BuscarCategoria(string tipo)
        {
            try
            {
                _connection.Open();
                var query = SqlManager.GetSql(TSql.BUSCAR_CATEGORIA);

                var command = new SqlCommand(query, _connection);

                command.Parameters.Add("@tipo", SqlDbType.VarChar).Value = tipo;

                string categoria = (command.ExecuteScalar()).ToString();

                return categoria;
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