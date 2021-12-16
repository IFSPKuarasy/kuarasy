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
        private readonly ICompraService _compraService;

        public CarrinhoController(IProdutoService produtoService, IOrigemService origemService, ICompraService compraService, ILogger<HomeController> logger)
        {
            _produtoService = produtoService;
            _origemService = origemService;
            _compraService = compraService;
            _logger = logger;
        }

        public IActionResult Index(int? area)
        {
           var model = new HomeIndexViewModel();
            if (area == null){
                ViewBag.Id = 1;
                return View();
            }
            else{
            ViewBag.Id = area;
            model.Produto = _produtoService.PesquisarPorId(Convert.ToInt32(area));
            if (model.Produto == null)
                return NotFound();

            model.Origem = _origemService.Pesquisar(Convert.ToInt32(area));

            return View(model);
            }
        }

        public IActionResult Pagamento()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
         public IActionResult Pagamento([Bind("Observacao, Valor_total , Data_entrega, QuantidadeComprado, Quantidade, Id_produtos")] Compra compra)
        {
            try
            {
                _compraService.Cadastrar(compra);
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
