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
using System.Net.Mail;
using System.Net;


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
         public IActionResult Pagamento([Bind("Observacao, Valor_total , Data_entrega, QuantidadeComprado, Quantidade, Id_produtos")] Compra post)
        {
            try
            {
                _compraService.Cadastrar(post);
                Compra compra = _compraService.PesquisarCompra();
                SendMail(compra);
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                throw;
            }
        }

         public bool SendMail(Compra compra)
        {
            try
            {
                // Estancia da Classe de Mensagem
                MailMessage _mailMessage = new MailMessage();
                // Remetente
                _mailMessage.From = new MailAddress("kuarasyOficial@gmail.com");

                string body = System.IO.File.ReadAllText("wwwroot/assets/html/Email.htm");
                body = body.Replace("#Id_compra#", compra.Id_compra.ToString()).Replace("#Nome#", "Kaiky").Replace("#Total#",compra.Valor_total);
                //Contrói o MailMessage
                _mailMessage.CC.Add("kaiky.br34@gmail.com");
                _mailMessage.Subject = "Confirmação de compra";
                _mailMessage.IsBodyHtml = true;
                _mailMessage.Body = body;
                //CONFIGURAÇÃO COM PORTA
                SmtpClient _smtpClient = new SmtpClient("smtp.gmail.com", Convert.ToInt32("587"));

                //CONFIGURAÇÃO SEM PORTA
                // SmtpClient _smtpClient = new SmtpClient(UtilRsource.ConfigSmtp);

                // Credencial para envio por SMTP Seguro (Quando o servidor exige autenticação)
                _smtpClient.UseDefaultCredentials = false;
                _smtpClient.Credentials = new NetworkCredential("kuarasyOficial@gmail.com", "KuarasyAGJKL2021");

                _smtpClient.EnableSsl = true;

                _smtpClient.Send(_mailMessage);

                return true;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
