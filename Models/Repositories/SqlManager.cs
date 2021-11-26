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
                    sql = "select p.id_produto, p.nome, preco, descricao, quantidade, peso, tp.nome, imagem from produto p inner join tipo tp on p.id_tipo = tp.id_tipo";
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
                    sql = "insert into produto (nome, preco, descricao, quantidade, peso, id_tipo, imagem, id_tamanho) " +
                        "values (@nome, @preco, @descricao, @quantidade, @peso, @id_tipo, @imagem, @id_tamanho)";
                    break;
                case TSql.CADASTRAR_TAMANHO:
                    sql = "insert into tamanho (altura, largura, comprimento) values (@altura, @largura, @comprimento)";
                    break;
                case TSql.ULTIMO_REGRISTO_TAMANHO:
                    sql = "SELECT (id_tamanho) FROM tamanho WHERE id_tamanho = (SELECT max(id_tamanho) FROM tamanho)";
                    break;
                case TSql.PESQUISAR:
                    sql = "select p.id_produto, p.nome, preco, descricao, quantidade, peso, tp.nome, imagem from produto p inner join tipo tp on p.id_tipo = tp.id_tipo WHERE @inputSearch in (p.nome, descricao)";
                    break;
            }
            return sql;
        }
    }

}