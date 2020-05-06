using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EFCorePractice
{
    public partial class Employees
    {
        public Employees()
        {
            Charges = new HashSet<Charges>();
            ExpenseItems = new HashSet<ExpenseItems>();
            ExpenseReports = new HashSet<ExpenseReports>();
        }

        [Key]
        public int EmployeeId { get; set; }
        [Required]
        [StringLength(50)]
        public string Name { get; set; }
        [Required]
        [StringLength(25)]
        public string Alias { get; set; }
        public byte[] Image { get; set; }
        [StringLength(25)]
        public string Manager { get; set; }

        [InverseProperty("Employee")]
        public virtual ICollection<Charges> Charges { get; set; }
        [InverseProperty("Employee")]
        public virtual ICollection<ExpenseItems> ExpenseItems { get; set; }
        [InverseProperty("Employee")]
        public virtual ICollection<ExpenseReports> ExpenseReports { get; set; }
    }
}
