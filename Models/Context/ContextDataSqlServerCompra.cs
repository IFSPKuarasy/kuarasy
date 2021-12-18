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
    public class ContextDataSqlServerCompra : IContextDataCompra
    {
        private readonly SqlConnection _connection = null;

        public ContextDataSqlServerCompra(IConnectionManager connectionManager)
        {
            _connection = connectionManager.GetConnection();
        }

        public void CadastrarCompra(Compra compra)
        {
            try
            {
                _connection.Open();
                var query = SqlManagerCompra.GetSql(TSql.CADASTRAR_COMPRA);
                DateTime thisDay = DateTime.Now;

                var command = new SqlCommand(query, _connection);

                //SALVANDO PRODUTO
                command.Parameters.Add("@observacao", SqlDbType.VarChar).Value = compra.Observacao;
                command.Parameters.Add("@valor_total", SqlDbType.VarChar).Value = compra.Valor_total;
                command.Parameters.Add("@data_entrega", SqlDbType.Date).Value = "21-11-2021";
                command.Parameters.Add("@data_compra", SqlDbType.DateTime).Value = thisDay.ToString();

                command.ExecuteNonQuery();

                string[] id_produtos = compra.Id_produtos.Split(',');
                string[] quantidadeComprado = compra.QuantidadeComprado.Split(',');
                string[] quantidade = compra.Quantidade.Split(',');
                for(int i=0; i<id_produtos.Length-1; i++){
                    CadastrarProduto(id_produtos[i]);
                    AtualizarEstoque(quantidadeComprado[i], id_produtos[i], quantidade[i]);
                }
                
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

        public void CadastrarProduto(string produto){
             var query = SqlManagerCompra.GetSql(TSql.CADASTRAR_COMPRA_PRODUTO);

                var command = new SqlCommand(query, _connection);

                //SALVANDO PRODUTO
                command.Parameters.Add("@id_compra", SqlDbType.Int).Value = UltimoRegristoCompra();
                command.Parameters.Add("@id_produto", SqlDbType.Int).Value = Convert.ToInt32(produto);

                command.ExecuteNonQuery();
        }

        public int UltimoRegristoCompra(){
            var query = SqlManagerCompra.GetSql(TSql.ULTIMO_REGISTRO_COMPRA);
            var command = new SqlCommand(query, _connection);
            int id_compra = (Int32)command.ExecuteScalar();
            return id_compra;
        }

        public void AtualizarEstoque(string quantidadeComprado, string id_produto, string quantidade){
            var query = SqlManagerCompra.GetSql(TSql.ATUALIZAR_ESTOQUE);
            var command = new SqlCommand(query, _connection);
            int quantidadeAntiga = Convert.ToInt32(quantidade);
            int quantidadeCompra = Convert.ToInt32(quantidadeComprado);
            command.Parameters.Add("@quantidade", SqlDbType.Int).Value = quantidadeAntiga - quantidadeCompra;
            command.Parameters.Add("@id_produto", SqlDbType.Int).Value = Convert.ToInt32(id_produto);

            command.ExecuteNonQuery();
        }

        public Compra PesquisarCompraId(){
            try
            {
                _connection.Open();
                Compra compra = null;
                var query = SqlManagerCompra.GetSql(TSql.PESQUISAR_COMPRA);

                var command = new SqlCommand(query, _connection);
                command.Parameters.Add("@id_compra", SqlDbType.Int).Value = UltimoRegristoCompra();

                var dataset = new DataSet();
                var adapter = new SqlDataAdapter(command);
                adapter.Fill(dataset);

                var rows = dataset.Tables[0].Rows;

                foreach (DataRow item in rows)
                {
                    var colunas = item.ItemArray;

                    var codigo = Convert.ToInt32(colunas[0]);
                    var observacao = colunas[1].ToString();
                    var valor_total = colunas[2].ToString();
                    var data_entrega = Convert.ToDateTime(colunas[3]);
                    var data_compra = Convert.ToDateTime(colunas[4]);

                    compra = new Compra {Id_compra = codigo, Observacao = observacao, Valor_total = valor_total, Data_entrega = data_entrega, Data_compra = data_compra};
                }

                adapter = null;
                dataset = null;
                return compra;

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