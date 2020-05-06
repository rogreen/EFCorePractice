using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EFCorePractice
{
    public partial class ExpenseReports
    {
        public ExpenseReports()
        {
            ExpenseItems = new HashSet<ExpenseItems>();
        }

        [Key]
        public int ReportNumber { get; set; }
        public int EmployeeId { get; set; }
        [Column(TypeName = "smallmoney")]
        public decimal? Amount { get; set; }
        [Required]
        [StringLength(50)]
        public string Purpose { get; set; }
        [StringLength(25)]
        public string Approver { get; set; }
        public int? CostCenter { get; set; }
        [StringLength(250)]
        public string Notes { get; set; }
        [Column(TypeName = "date")]
        public DateTime? DateSubmitted { get; set; }
        public int Status { get; set; }
        [Column(TypeName = "date")]
        public DateTime? DateResolved { get; set; }
        [Column(TypeName = "smallmoney")]
        public decimal? OwedToCreditCard { get; set; }
        [Column(TypeName = "smallmoney")]
        public decimal? OwedToEmployee { get; set; }
        [Column(TypeName = "date")]
        public DateTime? DateSaved { get; set; }
        [StringLength(50)]
        public string EmployeeName { get; set; }

        [ForeignKey(nameof(EmployeeId))]
        [InverseProperty(nameof(Employees.ExpenseReports))]
        public virtual Employees Employee { get; set; }
        [InverseProperty("ReportNumberNavigation")]
        public virtual ICollection<ExpenseItems> ExpenseItems { get; set; }
    }
}
