using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EFCorePractice
{
    [Table("Varietal", Schema = "rogreenwines")]
    public partial class Varietal
    {
        public Varietal()
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
        public string WineColor { get; set; }

        [InverseProperty("Varietal")]
        public virtual ICollection<Wine> Wines { get; set; }
    }
}
