using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kuarasy.Models.Entidades{

	public class Origem{
        public int Id_origem { get; set; }
        public string Pais { get; set; }
        public string Continente { get; set; }
        public string Descricao_origem { get; set; }
        public string Imagem_origem { get; set; }  
	}
}