using kuarasy.Models.Entidades;
using System.Collections.Generic;

namespace kuarasy.Models.Contracts.Context
{
	public interface IContextDataCompra
	{
		void CadastrarCompra(Compra compra);
	}

}