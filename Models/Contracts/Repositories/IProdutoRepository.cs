using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kuarasy.Models.Entidades;

namespace kuarasy.Models.Contracts.Repositories
{
    public interface IProdutoRepository
    {
        List<Produto> Listar();
        void Cadastrar(Produto produto);
        Produto PesquisarPorId(int id);
        List<Produto> Pesquisar(string inputSearch);
        void Atualizar(Produto produto);
        void Excluir(int id);

    }

}
