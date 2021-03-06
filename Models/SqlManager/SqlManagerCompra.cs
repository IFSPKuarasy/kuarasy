using kuarasy.Models.Enums;
using System.Collections.Generic;

namespace kuarasy.Models.SqlManager
{
    public class SqlManagerCompra
    {
        public static string GetSql(TSql tsql)
        {
            var sql = "";
            switch(tsql)
            {  
                case TSql.CADASTRAR_COMPRA:
                    sql = "insert into compra (observacao, valor_total, data_entrega, data_compra) values (@observacao, @valor_total, @data_entrega, @data_compra)";
                    break;
                 case TSql.CADASTRAR_COMPRA_PRODUTO:
                    sql = "insert into compra_produto (id_compra, id_produto) values (@id_compra, @id_produto)";
                    break;
                case TSql.ULTIMO_REGISTRO_COMPRA:
                    sql = "SELECT (id_compra) FROM compra WHERE id_compra = (SELECT max(id_compra) FROM compra)";
                    break;
                case TSql.ATUALIZAR_ESTOQUE:
                    sql = "update produto set quantidade = @quantidade where id_produto = @id_produto";
                    break;
                case TSql.PESQUISAR_COMPRA:
                    sql = "select id_compra, observacao, valor_total, data_entrega, data_compra from compra where id_compra = @id_compra";
                    break;
            }
            return sql;
        }
    }

}