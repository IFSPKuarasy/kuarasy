using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kuarasy.Models.Entidades;

namespace kuarasy.Models.Contracts.Services
{
	public interface IProdutoService
    {
        List<Produto> Listar();
        void Cadastrar(Produto produto);
        Produto PesquisarPorId(int id);
        void Atualizar(Produto produto);
        void Excluir(int id);
        List<Produto> Pesquisar(string inputSearch);
        List<Tipo> ListarTipo(string area);
        string Categoria(string tipo);
        int Contagem();
    }
}