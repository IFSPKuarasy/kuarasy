using kuarasy.Models;
using kuarasy.Models.Contracts.Services;
using kuarasy.Models.Entidades;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace kuarasy.Controllers
{
    public class ProdutoController : Controller
    {
        private readonly IProdutoService _produtoService;
        private readonly IWebHostEnvironment WebHostEnvironment;

        public ProdutoController(IProdutoService produtoService, IWebHostEnvironment webHostEnvironment)
        {
            _produtoService = produtoService;
            WebHostEnvironment = webHostEnvironment;
        }
        [HttpGet]
        public IActionResult Index(string InputSearch)
        {
            try
            {
                var produtos = _produtoService.Pesquisar(InputSearch);
                return View(produtos);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public IActionResult List()
        {
            try
            {
                var produtos = _produtoService.Listar();
                return View(produtos);
            }
            catch (Exception)
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
        public IActionResult Create(Produto pd)
        {
            try
            {
                string stringFileName = UploadFile(pd);
                pd.Imagem = stringFileName;
                _produtoService.Cadastrar(pd);
            }
            catch (Exception)
            {
                throw;
            }
            return RedirectToAction("List");
        }
        private string UploadFile(Produto pd)
        {
            string fileName = null;
            if (pd.ProfileImage != null)
            {
                string uploadDir = Path.Combine(WebHostEnvironment.WebRootPath, "productsImage");
                fileName = pd.Nome + "-" + pd.ProfileImage.FileName;
                string filePath = Path.Combine(uploadDir, fileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    pd.ProfileImage.CopyTo(fileStream);
                }
            }
            return fileName;
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
        public IActionResult Edit([Bind("Id, Nome, Preco, Descricao, Quantidade, Peso, ")] Produto produto)
        {
            int? id = produto.Id;
            if (id == null)
                return NotFound();

            try
            {
                _produtoService.Atualizar(produto);
                return RedirectToAction("List");
            }
            catch (Exception)
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
        public IActionResult Delete([Bind("Id")] Produto produto)
        {
            _produtoService.Excluir(produto.Id);
            return RedirectToAction("List");

        }
    }
}
