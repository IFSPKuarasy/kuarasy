using kuarasy.Models.Dtos;
using kuarasy.Models.Entidades;
using System.Collections.Generic;

namespace kuarasy.Models.Contracts.Context
{
	public interface IContextData
	{
		void CadastrarProduto(Produto produto);
		List<Produto> ListarProduto();
		Produto PesquisarProdutoPorId(int id);
		void AtualizarProduto(Produto produto);
		void ExcluirProduto(int id);
	}

}