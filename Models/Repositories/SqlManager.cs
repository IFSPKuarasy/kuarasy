using kuarasy.Models.Dtos;
using kuarasy.Models.Enums;
using System.Collections.Generic;

namespace kuarasy.Models.Repositories
{
    public class SqlManager
    {
        public static string GetSql(TSql tsql)
        {
            var sql = "";

            switch(tsql)
            {  
                case TSql.LISTAR_PRODUTO:
                    sql = "select * from produto order by nome";
                    break;
                case TSql.PESQUISAR_PRODUTO:
                    sql = "select * from produto where id_produto = @id";
                    break;

                case TSql.ATUALIZAR_PRODUTO:
                    sql = "update produto set nome = @nome, preco = @preco, descricao = @descricao, quantidade = @quantidade, peso = @peso from produto where id_produto = @id";
                    break;

                case TSql.EXCLUIR_PRODUTO:
                    sql = "delete from produto where id_produto = @id";
                    break;
                case TSql.CADASTRAR_PRODUTO:
                    sql = "insert into produto values (@nome, @peso, @descricao, @quantidade, @peso, @id_tipo)";
                    break;
            }
            return sql;
        }
    }

}