using kuarasy.Models.Enums;
using System.Collections.Generic;

namespace kuarasy.Models.SqlManager
{
    public class SqlManagerProduto
    {
        public static string GetSql(TSql tsql)
        {
            var sql = "";
            var orderby = "preco"+" asc";
            switch(tsql)
            {  
                case TSql.LISTAR_PRODUTO:
                    sql = "select p.id_produto, p.nome, preco, descricao, quantidade, peso, tp.nome, imagem, p.desconto from produto p inner join tipo tp on p.id_tipo = tp.id_tipo ORDER BY "+orderby+
                            " OFFSET @offset ROWS"+
                            " FETCH NEXT @porPaginas ROWS ONLY";
                    break;
                case TSql.CONTAGEM_PRODUTO:
                    sql = "select count(id_produto) from produto";
                    break;
                case TSql.CONTAGEM_PRODUTO_PESQUISA:
                    sql = "select count(p.id_produto) from produto p " +
                    "inner join tipo tp on p.id_tipo = tp.id_tipo " +
                    "inner join categoria ct on tp.id_categoria = ct.id_categoria WHERE p.nome like '%'+@inputSearch+'%' or tp.nome like '%'+@inputSearch+'%' or ct.nome like '%'+@inputSearch+'%'";
                    break;
                case TSql.PESQUISAR_PRODUTO:
                    sql = "select id_produto, nome, preco, descricao, quantidade, peso, imagem, p.id_tamanho, tm.altura, tm.largura, tm.comprimento, p.historia, p.desconto from produto p inner join tamanho tm on p.id_tamanho = tm.id_tamanho where id_produto = @id";
                    break;
                case TSql.ATUALIZAR_PRODUTO:
                    sql = "update produto set nome = @nome, preco = @preco, descricao = @descricao, quantidade = @quantidade, peso = @peso, historia = @historia, desconto = @desconto, imagem = @imagem from produto where id_produto = @id";
                    break;
                case TSql.EXCLUIR_PRODUTO:
                    sql = "delete from produto where id_produto = @id";
                    break;
                case TSql.CADASTRAR_PRODUTO:
                    sql = "insert into produto (nome, preco, descricao, quantidade, peso, id_tipo, imagem, id_tamanho, historia, desconto) " +
                        "values (@nome, @preco, @descricao, @quantidade, @peso, @id_tipo, @imagem, @id_tamanho, @historia, @desconto)";
                    break;
                case TSql.CADASTRAR_TAMANHO:
                    sql = "insert into tamanho (altura, largura, comprimento) values (@altura, @largura, @comprimento)";
                    break;
                case TSql.ULTIMO_REGISTRO_TAMANHO:
                    sql = "SELECT (id_tamanho) FROM tamanho WHERE id_tamanho = (SELECT max(id_tamanho) FROM tamanho)";
                    break;
                case TSql.PESQUISAR:
                    sql = "select p.id_produto, p.nome, preco, descricao, quantidade, peso, tp.nome, imagem, p.desconto from produto p " +
                    "inner join tipo tp on p.id_tipo = tp.id_tipo " +
                    "inner join categoria ct on tp.id_categoria = ct.id_categoria WHERE p.nome like '%'+@inputSearch+'%' or tp.nome like '%'+@inputSearch+'%' or ct.nome like '%'+@inputSearch+'%' "+
                    "Order by preco asc OFFSET @offset ROWS FETCH NEXT @porPaginas ROWS ONLY";
                    break;
                case TSql.LISTAR_TIPOS_CATEGORIA:
                    sql = "select tp.id_tipo, tp.nome, ct.nome from tipo tp inner join categoria ct on tp.id_categoria = ct.id_categoria where ct.nome = @area";
                    break;
                case TSql.LISTAR_TIPOS:
                    sql = "select tp.id_tipo, tp.nome, ct.nome from tipo tp inner join categoria ct on tp.id_categoria = ct.id_categoria";
                    break;
                case TSql.CONTAGEM_TIPO:
                    sql = "select count(id_produto) from produto where id_tipo = @id_tipo";
                    break;
                case TSql.BUSCAR_CATEGORIA:
                    sql = "select ct.nome from tipo tp inner join categoria ct on tp.id_categoria = ct.id_categoria where tp.nome = @tipo";
                    break;
                case TSql.ULTIMO_REGISTRO_PRODUTO:
                    sql = "SELECT (id_produto) FROM produto WHERE id_produto = (SELECT max(id_produto) FROM produto)";
                    break;
                case TSql.CADASTRAR_ORIGEM_PRODUTO:
                    sql = "insert into origem_produto (id_produto, id_origem) values (@id_produto, @id_origem)";
                    break;
                case TSql.EXCLUIR_ORIGEM_PRODUTO:
                    sql = "delete origem_produto WHERE id_produto = @id_produto";
                    break;
            }
            return sql;
        }
    }

}