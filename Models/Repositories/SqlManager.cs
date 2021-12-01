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
                    sql = "select p.id_produto, p.nome, preco, descricao, quantidade, peso, tp.nome, imagem from produto p " +
                    "inner join tipo tp on p.id_tipo = tp.id_tipo " +
                    "inner join categoria ct on tp.id_categoria = ct.id_categoria WHERE p.nome like '%'+@inputSearch+'%' or tp.nome like '%'+@inputSearch+'%' or ct.nome like '%'+@inputSearch+'%'";
                    break;
                case TSql.LISTAR_TIPO:
                    sql = "select tp.id_tipo, tp.nome, ct.nome from tipo tp inner join categoria ct on tp.id_categoria = ct.id_categoria where ct.nome = @area";
                    break;
                case TSql.CONTAGEM_TIPO:
                    sql = "select count(id_produto) from produto where id_tipo = @id_tipo";
                    break;
                case TSql.BUSCAR_CATEGORIA:
                    sql = "select ct.nome from tipo tp inner join categoria ct on tp.id_categoria = ct.id_categoria where tp.nome = @tipo";
                    break;
                case TSql.ULTIMO_REGRISTO_PRODUTO:
                    sql = "SELECT (id_produto) FROM produto WHERE id_produto = (SELECT max(id_produto) FROM produto)";
                    break;
                case TSql.CADASTRAR_ORIGEM_PRODUTO:
                    sql = "insert into origem_produto (id_produto, id_origem) values (@id_produto, @id_origem)";
                    break;
                case TSql.EXCLUIR_ORIGEM_PRODUTO:
                    sql = "delete origem_produto WHERE id_produto = @id_produto";
                    break;
                case TSql.LISTAR_ORIGEM:
                    sql = "select * from origem";
                    break;
            }
            return sql;
        }
    }

}