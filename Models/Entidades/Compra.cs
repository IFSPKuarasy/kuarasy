using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kuarasy.Models.Entidades{

	public class Compra{
        public int Id_compra { get; set; }
        public DateTime Data_compra { get; set; }
        public string Observacao { get; set; }
        public string Valor_total { get; set; }
        public DateTime Data_entrega { get; set; }  
        public string Id_produtos { get; set; }
        public int QuantidadeComprado { get; set; }
          
	}
}