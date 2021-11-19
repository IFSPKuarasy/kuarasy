using kuarasy.Models;
using kuarasy.Models.Contracts.Services;
using kuarasy.Models.Dtos;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace kuarasy.Controllers
{
    public class ProdutoController : Controller
    {
        private readonly IProdutoService _produtoService;

        public ProdutoController(IProdutoService produtoService)
        {
            _produtoService = produtoService;
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult List()
        {
            try
            {
                var produtos = _produtoService.Listar();
                return View(produtos);
            }
            catch(Exception)
            {
                throw;
            }
        }
        public IActionResult Create()
        { 
                return View(); 
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind("Nome, Preco, Descricao, Quantidade, Peso, Id_tipo")] ProdutoDto produto)
        { 
            try
            {
                _produtoService.Cadastrar(produto);
                return RedirectToAction("List");
            }
            catch (Exception)
            {
                throw;
            }
        }
        public IActionResult Edit(int? id)
        {
     
            if (id == null)
                return NotFound();
            var produto = _produtoService.PesquisarPorId(Convert.ToInt32(id));
            if (produto == null)
                return NotFound();
            return View(produto);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit([Bind("Id, Nome, Preco, Descricao, Quantidade, Peso")]ProdutoDto produto)
        {
            int? id = produto.Id;
            if (id == null)
                return NotFound();

            try
            {
                _produtoService.Atualizar(produto);
                return RedirectToAction("List");
            }
            catch(Exception)
            {
                throw;
            }
            
        }
        public IActionResult Details(int? id)
        {
            if (id == null)
                return NotFound();

            var produto = _produtoService.PesquisarPorId(Convert.ToInt32(id));
            if (produto == null)
                return NotFound();
            return View(produto);
        }
        public IActionResult Delete(int? id)
        {
            if (id == null)
                return NotFound();

            var produto = _produtoService.PesquisarPorId(Convert.ToInt32(id));
            if (produto == null)
                return NotFound();
            return View(produto);
        }
        [HttpPost]
        public IActionResult Delete([Bind("Id, Nome, Preco, Descricao, Quantidade, Peso")] ProdutoDto produto)
        {
            _produtoService.Excluir(produto.Id);
            return RedirectToAction("List");

        }
    }
}
