using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kuarasy.Models.Entidades;

namespace kuarasy.Models.Contracts.Repositories
{
    public interface IProdutoRepository
    {
        List<Produto> Listar(int porPaginas, int paginaAtual, string Order, string By);
        void Cadastrar(Produto produto);
        Produto PesquisarPorId(int id);
        List<Produto> Pesquisar(string inputSearch, int porPaginas, int paginaAtual, string Order, string By);
        void Atualizar(Produto produto);
        void Excluir(int id);
        List<Tipo> ListarTipo(string area);
        string Categoria(string tipo);
        int Contagem(string inputSearch);
    }

}
