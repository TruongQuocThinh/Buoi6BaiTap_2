namespace Buoi6BaiTap_2.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoaDon")]
    public partial class HoaDon
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string SoHoaDon { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int STT { get; set; }

        [Required]
        [StringLength(20)]
        public string MaSanPham { get; set; }

        [StringLength(100)]
        public string TenSanPham { get; set; }

        [StringLength(20)]
        public string DonViTinh { get; set; }

        public decimal DonGia { get; set; }

        public int SoLuong { get; set; }

        public virtual ChiTietHoaDon ChiTietHoaDon { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
