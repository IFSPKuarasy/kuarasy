using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using kuarasy.Models;
using kuarasy.Models.Contracts.Services;
using kuarasy.Models.Entidades;

namespace kuarasy.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IProdutoService _produtoService;
        private readonly IOrigemService _origemService;

        public HomeController(IProdutoService produtoService, IOrigemService origemService, ILogger<HomeController> logger)
        {
            _produtoService = produtoService;
            _origemService = origemService;
            _logger = logger;
        }

        public IActionResult Index()
        {
            try
            {
                var model = new HomeIndexViewModel();
                model.ListProduto = _produtoService.Listar(20, 0, "asc", "id_produto");
                model.ListOrigem = _origemService.Listar();
                return View(model);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public IActionResult Origin(string area)
        {
            var model = new HomeIndexViewModel();
            ViewBag.Continente = area; 
            model.ListOrigem = _origemService.Listar();
            model.ListProduto = _origemService.ListarProdutos(area);
            return View(model);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
