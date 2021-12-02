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
        private readonly IOrigemService _origemService;
        private readonly IWebHostEnvironment WebHostEnvironment;

        public ProdutoController(IProdutoService produtoService, IOrigemService origemService, IWebHostEnvironment webHostEnvironment)
        {
            _produtoService = produtoService;
            _origemService = origemService;
            WebHostEnvironment = webHostEnvironment;
        }
        [HttpGet]
        public IActionResult Index(string InputSearch, string area, string tipo)
        {
            var model = new HomeIndexViewModel();
            try
            {
                if (area != null)
                {
                    ViewBag.Categoria = area;
                    model.ListTipo = _produtoService.ListarTipo(area);
                    model.ListProduto = _produtoService.Pesquisar(area);
                    return View(model);
                }
                if (InputSearch != null)
                {
                    ViewBag.Pesquisa = InputSearch;
                    model.ListTipo = _produtoService.ListarTipo(InputSearch);
                    if (model.ListTipo != null)
                    {
                        ViewBag.Categoria = InputSearch;
                        ViewBag.Pesquisa = "";
                    }
                    model.ListProduto = _produtoService.Pesquisar(InputSearch);
                    return View(model);
                }
                if(tipo != null)
                {
                    ViewBag.Categoria = _produtoService.Categoria(tipo);
                    model.ListTipo = _produtoService.ListarTipo(ViewBag.Categoria);
                    model.ListProduto = _produtoService.Pesquisar(tipo);
                    return View(model);
                }
                else
                {
                    model.ListProduto = _produtoService.Listar();
                    return View(model);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public IActionResult List()
        {
            return null;
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
            return RedirectToAction("Index");
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
           var model = new HomeIndexViewModel();
            if (id == null)
                return NotFound();

            model.Produto = _produtoService.PesquisarPorId(Convert.ToInt32(id));
            if (model.Produto == null)
                return NotFound();

            model.Origem = _origemService.Pesquisar(Convert.ToInt32(id));

            return View(model);
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
