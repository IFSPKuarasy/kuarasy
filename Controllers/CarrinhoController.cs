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

        public IActionResult Index()
        {
            var produtos = _produtoService.Listar(10, 1, "asc", "p.nome");
            return View(produtos);
        }

        public IActionResult Pagamento()
        {
            return View();
        }
    }
}
