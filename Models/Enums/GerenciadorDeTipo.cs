using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kuarasy.Models.Enums
{

    public class GerenciadorDeTipo
    {
        private static List<TipoProduto> tipoProdutoList = new List<TipoProduto>
        {
            TipoProduto.ANEL,
            TipoProduto.APARADOR
        };
        public static TipoProduto PesquisarTipoDoProdutoPorId(int id)
        {
            var tipo = tipoProdutoList.FirstOrDefault(p => p.GetHashCode().Equals(id));
            return tipo;
        }
        public static TipoProduto PesquisarTipoDoProdutoPeloNome(string nome)
        {
            var nomePesquisa = nome.ToUpper().Replace(" ", "_");
                var tipo = tipoProdutoList.FirstOrDefault(p => p.ToString().Equals(nomePesquisa));
                return tipo;
            
        }
    }
}