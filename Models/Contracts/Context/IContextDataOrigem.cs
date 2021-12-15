using kuarasy.Models.Entidades;
using System.Collections.Generic;

namespace kuarasy.Models.Contracts.Context
{
	public interface IContextDataOrigem
	{
		List<Origem> ListarOrigem();
		Origem PesquisarOrigemProduto(int id);
		List<Produto> ListarProdutosOrigem(string continente);
	}

}