using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kuarasy.Models.Entidades
{

    public class Tipo
    {
        public int Id_tipo { get; set; }
        public string Nome_tipo { get; set; }
        public int Id_categoria { get; set; }
        public string Nome_categoria { get; set; }
        public int  Contagem_tipo { get; set; }

        public Tipo()
        {

        }
    public Tipo(string nome_categoria)
        {
            this.Nome_categoria = nome_categoria;
        }
    }
}
