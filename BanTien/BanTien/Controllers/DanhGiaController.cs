using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BanTien.Models;
namespace BanTien.Controllers
{
    public class DanhGiaController : Controller
    {
        BANTIENEntities db = new BANTIENEntities();

        [HttpPost]
        public ActionResult Add(int id_khach, int id_sach, string review)
        {
            DanhGiaTien dg = new DanhGiaTien();
            dg.MaKH = id_khach;
            dg.MaTien = id_sach;
            dg.NoiDungDanhGia = review;
            dg.ThoiGianDang = DateTime.Now;
            db.DanhGiaTiens.Add(dg);
            db.SaveChanges();
            return RedirectToAction("Details", "SanPhams", new { id = id_sach });
        }

        [HttpPost]
        public ActionResult Delete(int id_khach, int id_sach)
        {
            var dg = (from u in db.DanhGiaTiens
                      where u.MaKH == id_khach && u.MaTien == id_sach
                      select u).FirstOrDefault();
            db.DanhGiaTiens.Remove(dg);
            db.SaveChanges();
            return RedirectToAction("Details", "SanPhams", new { id = id_sach });
        }
    }
}