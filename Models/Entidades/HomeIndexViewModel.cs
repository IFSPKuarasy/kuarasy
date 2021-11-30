using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kuarasy.Models.Entidades;

namespace kuarasy.Models.Entidades{

	public class HomeIndexViewModel{

        public Origem Origem { get; set; }
        public Produto Produto {get; set;}
        public IEnumerable<Produto> ListProduto { get; set; }
        public IEnumerable<Origem> ListOrigem { get; set; }
    }   
}