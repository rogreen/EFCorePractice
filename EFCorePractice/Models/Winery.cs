using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EFCorePractice
{
    [Table("Winery", Schema = "rogreenwines")]
    public partial class Winery
    {
        public Winery()
        {
            Wines = new HashSet<Wine>();
        }

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
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string PhoneNumber { get; set; }
        public string Country { get; set; }
        public string Area { get; set; }
        public string WebSite { get; set; }
        public bool? WineClub { get; set; }
        public string Notes { get; set; }

        [InverseProperty("Winery")]
        public virtual ICollection<Wine> Wines { get; set; }
    }
}
