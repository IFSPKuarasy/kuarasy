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
    public class CarrinhoController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IProdutoService _produtoService;
        private readonly IOrigemService _origemService;

        public CarrinhoController(IProdutoService produtoService, IOrigemService origemService, ILogger<HomeController> logger)
        {
            _produtoService = produtoService;
            _origemService = origemService;
            _logger = logger;
        }

        public IActionResult Index(int? area)
        {
           var model = new HomeIndexViewModel();
            if (area == null)
                return View();

            model.Produto = _produtoService.PesquisarPorId(Convert.ToInt32(area));
            if (model.Produto == null)
                return NotFound();

            model.Origem = _origemService.Pesquisar(Convert.ToInt32(area));

            return View(model);
        }

        public IActionResult Pagamento()
        {
            
            return View();
        }
    }
}
