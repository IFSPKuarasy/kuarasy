using kuarasy.Models.Entidades;
using kuarasy.Models.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kuarasy.Models.Dtos{
	public class ProdutoDto
    {
        public int Id{ get; set; }
        public string Nome{ get; set; }
        public float Preco{ get; set; }
        public string Descricao{ get; set; }
        public int Quantidade{ get; set; }
        public float Peso{ get; set; }
        public int Id_tipo { get; set; }
        public string Tipo{ get; set; }
        //public int Id{ get; set; }

        public ProdutoDto()
        {

        }
        public Produto ConverterParaEntidade()
        {
            return new Produto
            {
                Id = this.Id,
                Nome = this.Nome,
                Preco = this.Preco,
                Descricao = this.Descricao,
                Quantidade = this.Quantidade,
                Peso = this.Peso,
                TipoProduto = GerenciadorDeTipo.PesquisarTipoDoProdutoPorId(this.Id_tipo)
            };
        }       
    }
}