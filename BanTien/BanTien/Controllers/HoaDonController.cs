﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using BanTien.Models;

namespace BanTien.Controllers
{
    public class HoaDonController : Controller
    {
        BANTIENEntities db = new BANTIENEntities();
        /* Detailed receipt */
        [Authorize]
        [HttpGet]
        public ActionResult Index()
        {
            var hoadon = db.HoaDons.ToList();
            return View(hoadon);
        }

        /* Detailed receipt */
        [Authorize]
        [HttpGet]
        public ActionResult Delete(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            return RedirectToAction("Index");
        }

        /* Detailed receipt */
        //hoa don
        [HttpGet]
        [Authorize]
        public ActionResult Invoice(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var hoadon = (from u in db.HoaDons
                          where u.MaHD == id
                          select u).FirstOrDefault();
            InvoiceDetail inv = new InvoiceDetail();
            inv.MaDH = id;
            inv.MaKH = hoadon.MaKH;
            inv.Ho_TenKH = hoadon.TenKhach;
            inv.SDTDatHang = hoadon.SDTDatHang;
            inv.EmailXacNhan = hoadon.EmailXacNhan;
            inv.DiaChiNhanHang = hoadon.DiaChiNhanHang;
            inv.NgayLapHD = hoadon.NgayLapHD;
            inv.NgayNhan = hoadon.NgayNhanHang;
            inv.TrangThai = hoadon.TrangThai;
            inv.SachDaMua = new List<ItemPayment>();
            var giohang = (from u in db.GioHangs
                           where u.MaDH == id
                           select u).ToList();
            for (int i = 0; i < giohang.Count; i++)
            {
                ItemPayment item = new ItemPayment();
                item.STT = i + 1;
                item.TenTien = giohang[i].SanPham.TenTien;
                item.SoLuong = giohang[i].SoLuong;
                item.DonGia = giohang[i].SanPham.DonGia;
                item.ThanhTien = giohang[i].ThanhTien;
                inv.SachDaMua.Add(item);
            }
            inv.GiamGia = hoadon.GiamGia;
            inv.TongTien = hoadon.TongTien;
            inv.TongThanhToan = hoadon.TongThanhToan;
            return View(inv);
        }
        /* Cancel */
        //huy hoa don
        [HttpPost]
        [Authorize]
        public ActionResult Cancel(int idDon, int idKhach)
        {
            var giohang = (from u in db.GioHangs
                           where u.MaDH == idDon
                           select u).ToList();
            var hoadon = db.HoaDons.Find(idDon);
            // Hoàn lại toàn bộ số lượng vào kho và xóa giỏ
            foreach(var item in giohang)
            {
                item.SanPham.SoLuong += item.SoLuong;
                db.Entry(item.SanPham).State = EntityState.Modified;
                db.GioHangs.Remove(item);
            }
            db.HoaDons.Remove(hoadon);
            var khach = db.KhachHangs.Find(idKhach);
            khach.SoLanHuyDon ++;
            if(khach.SoLanHuyDon >= 4)
            {
                var block_user = db.TaiKhoans.Find(khach.UsernameKH);
                block_user.block = true;
                db.Entry(block_user).State = EntityState.Modified;
            }
            db.Entry(khach).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "Home");
        }
        /* Get shopping history */
        //lich su thanh toan
        [HttpGet]
        [Authorize]
        public ActionResult PaymentHistory(int? id)
        {
            if(id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var hoadon = (from u in db.HoaDons
                          where u.MaKH == id
                          select u).ToList();
            return View(hoadon);
        }
        /* Create new payment */
        [HttpPost]
        [Authorize]
        public ActionResult Create(CreateReceipt model)
        {
            var giohang = (from u in db.GioHangs
                           where u.MaKH == model.MaKH && u.MaDH == null
                           select u).ToList();

            HoaDon hd = new HoaDon();
            hd.MaKH = model.MaKH;
            hd.TenKhach = model.Ho_TenKH;
            hd.NgayLapHD = DateTime.Now;
            hd.SDTDatHang = model.SDTDatHang;
            hd.EmailXacNhan = model.EmailXacNhan;
            hd.DiaChiNhanHang = model.DiaChiNhanHang;
            hd.GiamGia = model.GiamGia;
            hd.TongTien = model.TongTien;
            hd.TongThanhToan = model.TongThanhToan;
            hd.TrangThai = "Đã nhận đơn";
            hd.NgayNhanHang = DateTime.Today.AddDays(5);
            db.HoaDons.Add(hd);
            db.SaveChanges();
            foreach(var item in giohang)
            {
                item.MaDH = hd.MaHD;
                db.Entry(item).State = EntityState.Modified;
            }
            db.SaveChanges();
           
            return RedirectToAction("Index", "Home");
        }
        //trang thai hoa don    
        [Authorize]
        public ActionResult NextProcess(int? id, int type)
        {
            var donhang = db.HoaDons.Find(id);
            if(type == 1)
                donhang.TrangThai = "Đang xử lý";
            else
                if(type == 2)
                    donhang.TrangThai = "Đã giao hàng";
            db.Entry(donhang).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "HoaDon");
        }
        //admin xoa hoa don
        [Authorize]
        public ActionResult AdminDelete(int? id)
        {
            var donhang = db.HoaDons.Find(id);
            db.HoaDons.Remove(donhang);
            db.SaveChanges();
            return RedirectToAction("Index", "HoaDon");
        }
    }
}