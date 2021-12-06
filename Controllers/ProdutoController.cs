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
        public IActionResult Index(string InputSearch, string area, string tipo, string Order, string By)
        {
            var model = new HomeIndexViewModel();
            try
            {
                if (area != null)
                {
                    ViewBag.Categoria = area;
                    model.ListTipo = _produtoService.ListarTipo(area);
                    model.ListProduto = _produtoService.Pesquisar(area);
                    ViewBag.Filtro = "?area="+area+"&";
                    if (Order == "desc" && By == "Name")
                        model.ListProduto = model.ListProduto.OrderByDescending(p => p.Nome);
                    if (Order == "asc" && By == "Name")
                        model.ListProduto = model.ListProduto.OrderBy(p => p.Nome);
                    if (Order == "desc" && By == "Preco")
                        model.ListProduto = model.ListProduto.OrderByDescending(p => p.Preco);
                    if (Order == "asc" && By == "Preco")
                        model.ListProduto = model.ListProduto.OrderBy(p => p.Preco);
                    return View(model);
                }
                if (InputSearch != null)
                {
                    ViewBag.Pesquisa = InputSearch;
                    model.ListTipo = _produtoService.ListarTipo(InputSearch);
                    ViewBag.Filtro = "?InputSearch=" + InputSearch + "&";
                    if (model.ListTipo != null)
                    {
                        ViewBag.Categoria = InputSearch;
                        ViewBag.Pesquisa = "";
                    }
                    model.ListProduto = _produtoService.Pesquisar(InputSearch);
                     if (Order == "desc" && By == "Name")
                        model.ListProduto = model.ListProduto.OrderByDescending(p => p.Nome);
                    if (Order == "asc" && By == "Name")
                        model.ListProduto = model.ListProduto.OrderBy(p => p.Nome);
                    if (Order == "desc" && By == "Preco")
                        model.ListProduto = model.ListProduto.OrderByDescending(p => p.Preco);
                    if (Order == "asc" && By == "Preco")
                        model.ListProduto = model.ListProduto.OrderBy(p => p.Preco);
                    return View(model);
                }
                if(tipo != null)
                {
                    ViewBag.Categoria = _produtoService.Categoria(tipo);
                    model.ListTipo = _produtoService.ListarTipo(ViewBag.Categoria);
                    model.ListProduto = _produtoService.Pesquisar(tipo);
                     ViewBag.Filtro = "?Tipo=" + tipo + "&";
                    if (Order == "desc" && By == "Name")
                        model.ListProduto = model.ListProduto.OrderByDescending(p => p.Nome);
                    if (Order == "asc" && By == "Name")
                        model.ListProduto = model.ListProduto.OrderBy(p => p.Nome);
                    if (Order == "desc" && By == "Preco")
                        model.ListProduto = model.ListProduto.OrderByDescending(p => p.Preco);
                    if (Order == "asc" && By == "Preco")
                        model.ListProduto = model.ListProduto.OrderBy(p => p.Preco);
                    return View(model);
                }
                else
                {
                    model.ListProduto = _produtoService.Listar();
                    ViewBag.QuantidadeProduto = _produtoService.Contagem();
                    ViewBag.Filtro = "?Tipo=" + tipo + "&";
                    if (Order == "desc" && By == "Name")
                        model.ListProduto = model.ListProduto.OrderByDescending(p => p.Nome);
                    if (Order == "asc" && By == "Name")
                        model.ListProduto = model.ListProduto.OrderBy(p => p.Nome);
                    if (Order == "desc" && By == "Preco")
                        model.ListProduto = model.ListProduto.OrderByDescending(p => p.Preco);
                    if (Order == "asc" && By == "Preco")
                        model.ListProduto = model.ListProduto.OrderBy(p => p.Preco);
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
            var area = "create";
            var model = new HomeIndexViewModel();
            model.ListOrigem = _origemService.Listar();
            model.ListTipo = _produtoService.ListarTipo(area);
            return View(model);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(HomeIndexViewModel pd)
        {
            try
            {
                string stringFileName = UploadFile(pd.Produto);
                pd.Produto.Imagem = stringFileName;
                _produtoService.Cadastrar(pd.Produto);
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
            else{
                fileName = pd.Imagem;
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
        public IActionResult Edit([Bind("Id, Nome, Preco, Descricao, Quantidade, Peso, ProfileImage, Imagem, Historia, Desconto")] Produto pd)
        {
            int? id = pd.Id;
            if (id == null)
                return NotFound();

            try
            {
                string stringFileName = UploadFile(pd);
                pd.Imagem = stringFileName;
                _produtoService.Atualizar(pd);
                return RedirectToAction("Index");
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
