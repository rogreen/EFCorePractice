using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EFCorePractice
{
    public partial class Charges
    {
        [Key]
        public int Id { get; set; }
        public int EmployeeId { get; set; }
        [Column(TypeName = "date")]
        public DateTime ExpenseDate { get; set; }
        [Required]
        [StringLength(50)]
        public string Merchant { get; set; }
        [StringLength(50)]
        public string Location { get; set; }
        [Column(TypeName = "smallmoney")]
        public decimal BilledAmount { get; set; }
        [Column(TypeName = "smallmoney")]
        public decimal TransactionAmount { get; set; }
        [StringLength(250)]
        public string Description { get; set; }
        public int? Category { get; set; }
        public int? AccountNumber { get; set; }
        public bool ReceiptRequired { get; set; }
        public int ExpenseType { get; set; }
        [StringLength(250)]
        public string Notes { get; set; }

        [ForeignKey(nameof(EmployeeId))]
        [InverseProperty(nameof(Employees.Charges))]
        public virtual Employees Employee { get; set; }
    }
}
