using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EFCorePractice
{
    [Table("Wine", Schema = "rogreenwines")]
    public partial class Wine
    {
        [Key]
        [Column("id")]
        [StringLength(255)]
        public string Id { get; set; }
        [Column("__createdAt", TypeName = "datetimeoffset(3)")]
        public DateTimeOffset CreatedAt { get; set; }
        [Column("__updatedAt", TypeName = "datetimeoffset(3)")]
        public DateTimeOffset? UpdatedAt { get; set; }
        [Required]
        [Column("__version")]
        public byte[] Version { get; set; }
        public string Name { get; set; }
        public double? Vintage { get; set; }
        public double? Price { get; set; }
        public string ImagePath { get; set; }
        public double? DrinkBy { get; set; }
        public double? MyRating { get; set; }
        public string StorageLocation1 { get; set; }
        public string StorageLocation2 { get; set; }
        public string StorageLocation3 { get; set; }
        public string Notes { get; set; }
        [Required]
        [StringLength(255)]
        public string WineryId { get; set; }
        [Required]
        [StringLength(255)]
        public string RegionId { get; set; }
        [Required]
        [StringLength(255)]
        public string VarietalId { get; set; }
        [Column(TypeName = "smalldatetime")]
        public DateTime? WhenDrank { get; set; }

        [ForeignKey(nameof(RegionId))]
        [InverseProperty("Wines")]
        public virtual Region Region { get; set; }
        [ForeignKey(nameof(VarietalId))]
        [InverseProperty("Wines")]
        public virtual Varietal Varietal { get; set; }
        [ForeignKey(nameof(WineryId))]
        [InverseProperty("Wines")]
        public virtual Winery Winery { get; set; }
    }
}
