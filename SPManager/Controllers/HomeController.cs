using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SPManager.Models;
using SPManager.Views;

namespace SPManager.Controllers
{
    public class HomeController : Controller
    {
        private SPDBEntities db = new SPDBEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            IQueryable<StatsGroup> data = from university in db.Universities
                                                   group university by university.Name into statsGroup
                                                   select new StatsGroup()
                                                   {
                                                       UniversityName = statsGroup.Key,
                                                       UniversityCount = statsGroup.Count()
                                                   };

            return View(data.ToList());
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}