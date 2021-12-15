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

                string[] produtos = compra.Id_produtos.Split(',');
                for(int i=0; i<produtos.Length-1; i++){
                    CadastrarProduto(produtos[i]);
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
    }

}