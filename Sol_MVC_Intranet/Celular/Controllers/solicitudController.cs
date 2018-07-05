using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Celular.Controllers
{
    public class solicitudController : Controller
    {
        // GET: solicitud
        public ActionResult Index(string id)
        {
            ViewBag.idProyecto = id;
            ViewBag.Titulo = "Solicitud de Inspección";



            return View("solicitud");
        }
    }
}