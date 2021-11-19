using kuarasy.Models.Dtos;
using kuarasy.Models.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kuarasy.Models.Entidades{

    public class Produto {
        public int Id { get; internal set; }
        public string Nome { get; set; }
        public float Preco { get; set; }
        public string Descricao { get; set; }
        public int Quantidade { get; set; }
        public float Peso { get; set; }
        public TipoProduto TipoProduto { get; set; }

        public void Cadastrar()
        {
            this.TipoProduto = TipoProduto.ANEL;
        }
        public ProdutoDto ConverterParaDto()
        {
            return new ProdutoDto
            {
                Id = this.Id,
                Nome = this.Nome,
                Preco = this.Preco,
                Descricao = this.Descricao,
                Quantidade = this.Quantidade,
                Peso = this.Peso,
                Id_tipo = this.TipoProduto.GetHashCode(),
                Tipo = this.TipoProduto.ToString()
            };
        }
        
    }
}