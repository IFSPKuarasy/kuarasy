using kuarasy.Models.Enums;
using System.Collections.Generic;

namespace kuarasy.Models.SqlManager
{
    public class SqlManagerOrigem
    {
        public static string GetSql(TSql tsql)
        {
            var sql = "";
            switch(tsql)
            {  
                case TSql.LISTAR_ORIGEM:
                    sql = "select * from origem";
                    break;
                case TSql.PESQUISAR_ORIGEM:
                    sql = "select op.id_origem, og.pais, og.continente, og.imagem_origem from origem_produto op inner join origem og on op.id_origem = og.id_origem WHERE id_produto = @id";
                    break;
                case TSql.LISTAR_PRODUTOS_ORIGEM:
                    sql = "select p.id_produto, og.pais, p.nome, p.preco, p.imagem, p.desconto from origem_produto op "+
                    "inner join produto p on op.id_produto = p.id_produto "+
                    "inner join origem og on op.id_origem = og.id_origem WHERE og.continente = @continente";
                    break;
            }
            return sql;
        }
    }

}