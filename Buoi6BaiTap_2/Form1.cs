using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Buoi6BaiTap_2.Model;
using Microsoft.Reporting.WinForms;
namespace Buoi6BaiTap_2
{
    public partial class Form1 : Form
    {
        SanPhamContext contextDB;
        public Form1()
        {
            InitializeComponent();
            contextDB = new SanPhamContext();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {           
        }

        private void rdoNgay_CheckedChanged(object sender, EventArgs e)
        {
            dtpNgay.Enabled = true;
            dtpThang.Enabled = false;
            dtpTuNgay.Enabled = false;
            dtpDenNgay.Enabled = false;
        }

        private void rdoThang_CheckedChanged(object sender, EventArgs e)
        {
            dtpNgay.Enabled = false;
            dtpThang.Enabled = true;
            dtpTuNgay.Enabled = false;
            dtpDenNgay.Enabled = false;
        }

        private void rdoTuNgay_CheckedChanged(object sender, EventArgs e)
        {
            dtpNgay.Enabled = false;
            dtpThang.Enabled = false;
            dtpTuNgay.Enabled = true;
            dtpDenNgay.Enabled = true;
        }

        private void btnXem_Click(object sender, EventArgs e)
        {
            this.reportViewer1.Visible = true;
            if(rdoNgay.Checked == true)
            {
                List<HoaDon> listHoaDon = contextDB.HoaDons.ToList();
                List<ReportThongKe> listReportThongKe = new List<ReportThongKe>();
                foreach(HoaDon item in listHoaDon)
                {
                    if(item.ChiTietHoaDon.NgayGiaoHang == dtpNgay.Value.Date)
                    {
                        ReportThongKe reportThongKe = new ReportThongKe();
                        reportThongKe.NgayGiaoHang = item.ChiTietHoaDon.NgayGiaoHang;
                        reportThongKe.SoHoaDon = item.SoHoaDon;
                        reportThongKe.TongTien = item.DonGia * item.SoLuong;
                        listReportThongKe.Add(reportThongKe);
                    }
                    this.reportViewer1.LocalReport.ReportPath = "./Report/ReportThongKe.rdlc";
                    var ReportDataSource = new ReportDataSource("DataSet1", listReportThongKe);
                    this.reportViewer1.LocalReport.DataSources.Clear();
                    this.reportViewer1.LocalReport.DataSources.Add(ReportDataSource);
                }
            }
            else if(rdoThang.Checked == true)
            {
                List<HoaDon> listHoaDon = contextDB.HoaDons.ToList();
                List<ReportThongKe> listReportThongKe = new List<ReportThongKe>();
                foreach (HoaDon item in listHoaDon)
                {
                    if (item.ChiTietHoaDon.NgayGiaoHang.Month == dtpThang.Value.Month)
                    {
                        ReportThongKe reportThongKe = new ReportThongKe();
                        reportThongKe.NgayGiaoHang = item.ChiTietHoaDon.NgayGiaoHang;
                        reportThongKe.SoHoaDon = item.SoHoaDon;
                        reportThongKe.TongTien = item.DonGia * item.SoLuong;
                        listReportThongKe.Add(reportThongKe);
                    }
                    this.reportViewer1.LocalReport.ReportPath = "./Report/ReportThongKe.rdlc";
                    var ReportDataSource = new ReportDataSource("DataSet1", listReportThongKe);
                    this.reportViewer1.LocalReport.DataSources.Clear();
                    this.reportViewer1.LocalReport.DataSources.Add(ReportDataSource);
                }
            }
            else
            {
                List<HoaDon> listHoaDon = contextDB.HoaDons.ToList();
                List<ReportThongKe> listReportThongKe = new List<ReportThongKe>();
                foreach (HoaDon item in listHoaDon)
                {
                    if (item.ChiTietHoaDon.NgayGiaoHang >= dtpTuNgay.Value.Date && item.ChiTietHoaDon.NgayGiaoHang <= dtpDenNgay.Value.Date)
                    {
                        ReportThongKe reportThongKe = new ReportThongKe();
                        reportThongKe.NgayGiaoHang = item.ChiTietHoaDon.NgayGiaoHang;
                        reportThongKe.SoHoaDon = item.SoHoaDon;
                        reportThongKe.TongTien = item.DonGia * item.SoLuong;
                        listReportThongKe.Add(reportThongKe);
                    }
                    this.reportViewer1.LocalReport.ReportPath = "./Report/ReportThongKe.rdlc";
                    var ReportDataSource = new ReportDataSource("DataSet1", listReportThongKe);
                    this.reportViewer1.LocalReport.DataSources.Clear();
                    this.reportViewer1.LocalReport.DataSources.Add(ReportDataSource);
                }
            }

            this.reportViewer1.RefreshReport();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult p = MessageBox.Show("Bạn muốn thoát khỏi phần mềm?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if(p == DialogResult.Yes)
            {
                this.Close();
            }
            else
            {
                return;
            }
        }
    }
}
