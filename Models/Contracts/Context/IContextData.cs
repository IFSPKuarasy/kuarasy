using kuarasy.Models.Entidades;
using System.Collections.Generic;

namespace kuarasy.Models.Contracts.Context
{
	public interface IContextData
	{
		void CadastrarProduto(Produto produto);
		List<Produto> ListarProduto();
		List<Origem> ListarOrigem();
		Produto PesquisarProdutoPorId(int id);
		List<Produto> PesquisarProduto(string inputSearch);
		void AtualizarProduto(Produto produto);
		void ExcluirProduto(int id);
		List<Tipo> ListarTipoDaCategoria(string area);
		string BuscarCategoria(string tipo);
		Origem PesquisarOrigem(int id);
	}

}