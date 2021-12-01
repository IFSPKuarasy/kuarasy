using kuarasy.Models.Enums;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kuarasy.Models.Entidades{

    public class Produto {
        public int Id { get; set; }
        public string Nome { get; set; }
        public float Preco { get; set; }
        public string Descricao { get; set; }
        public int Quantidade { get; set; }
        public float Peso { get; set; }
        public int Id_tipo { get; set; }
        public string Nome_tipo { get; set; }
        public string Imagem { get; set; }
        public int Id_tamanho { get; set; }
        public float Altura { get; set; }
        public float Largura { get; set; }
        public float Comprimento { get; set; }
        public string InputSearch { get; set; }
        public int Id_origem { get; set; }
        public string Nome_origem { get; set; }
        public IFormFile ProfileImage { get; set; }

        public Produto()
        {
            
        }
        public Produto(int id, string nome, float preco, string descricao, int quantidade, float peso, int id_tipo, string nome_tipo, string imagem,
            int id_tamanho, float altura, float largura, float comprimento,
            string inputSearch)
        {
            this.Id = id;
            this.Nome = nome;
            this.Preco = preco;
            this.Descricao = descricao;
            this.Quantidade = quantidade;
            this.Peso = peso;
            this.Id_tipo = id_tipo;
            this.Nome_tipo = nome_tipo;
            this.Id_tamanho = id_tamanho;
            this.Altura = altura;
            this.Largura = largura;
            this.Comprimento = comprimento;
            this.InputSearch = inputSearch;
        }
    }
}