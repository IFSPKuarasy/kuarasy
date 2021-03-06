using kuarasy.Models.Entidades;
using System.Collections.Generic;

namespace kuarasy.Models.Contracts.Context
{
	public interface IContextData
	{
		void CadastrarProduto(Produto produto);
		List<Produto> ListarProduto(int porPaginas, int paginaAtual, string Order, string By);
		Produto PesquisarProdutoPorId(int id);
		List<Produto> PesquisarProduto(string inputSearch, int porPaginas, int paginaAtual, string Order, string By);
		void AtualizarProduto(Produto produto);
		void ExcluirProduto(int id);
		List<Tipo> ListarTipoDaCategoria(string area);
		string BuscarCategoria(string tipo);
		int ContagemProduto(string inputSearch);
	}

}