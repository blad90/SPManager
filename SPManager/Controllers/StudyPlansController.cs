using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SPManager.Models;

namespace SPManager.Controllers
{
    public class StudyPlansController : Controller
    {
        private SPDBEntities db = new SPDBEntities();

        // GET: StudyPlans
        public ActionResult Index()
        {
            var studyPlans = db.StudyPlans.Include(s => s.Program1);
            return View(studyPlans.ToList());
        }

        // GET: StudyPlans/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StudyPlan studyPlan = db.StudyPlans.Find(id);
            if (studyPlan == null)
            {
                return HttpNotFound();
            }
            return View(studyPlan);
        }

        // GET: StudyPlans/Create
        public ActionResult Create()
        {
            ViewBag.Program = new SelectList(db.Programs, "PID", "Name");
            return View();
        }

        // POST: StudyPlans/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SPID,ContentDesc,Status,Program")] StudyPlan studyPlan)
        {
            if (ModelState.IsValid)
            {
                db.StudyPlans.Add(studyPlan);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Program = new SelectList(db.Programs, "PID", "Name", studyPlan.Program);
            return View(studyPlan);
        }

        // GET: StudyPlans/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StudyPlan studyPlan = db.StudyPlans.Find(id);
            if (studyPlan == null)
            {
                return HttpNotFound();
            }
            ViewBag.Program = new SelectList(db.Programs, "PID", "Name", studyPlan.Program);
            return View(studyPlan);
        }

        // POST: StudyPlans/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SPID,ContentDesc,Status,Program")] StudyPlan studyPlan)
        {
            if (ModelState.IsValid)
            {
                db.Entry(studyPlan).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Program = new SelectList(db.Programs, "PID", "Name", studyPlan.Program);
            return View(studyPlan);
        }

        // GET: StudyPlans/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StudyPlan studyPlan = db.StudyPlans.Find(id);
            if (studyPlan == null)
            {
                return HttpNotFound();
            }
            return View(studyPlan);
        }

        // POST: StudyPlans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            StudyPlan studyPlan = db.StudyPlans.Find(id);
            db.StudyPlans.Remove(studyPlan);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
