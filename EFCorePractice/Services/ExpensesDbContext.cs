using Microsoft.EntityFrameworkCore;

namespace EFCorePractice
{
    public partial class ExpensesDbContext : DbContext
    {
        public ExpensesDbContext()
        {
        }

        public ExpensesDbContext(DbContextOptions<ExpensesDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Charges> Charges { get; set; }
        public virtual DbSet<Employees> Employees { get; set; }
        public virtual DbSet<ExpenseItems> ExpenseItems { get; set; }
        public virtual DbSet<ExpenseReports> ExpenseReports { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=desktop-go1uddd;Initial Catalog=Expenses;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Charges>(entity =>
            {
                entity.Property(e => e.Notes).IsUnicode(false);

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.Charges)
                    .HasForeignKey(d => d.EmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Charges_Employees");
            });

            modelBuilder.Entity<Employees>(entity =>
            {
                entity.Property(e => e.EmployeeId).ValueGeneratedNever();
            });

            modelBuilder.Entity<ExpenseItems>(entity =>
            {
                entity.Property(e => e.ExpenseType).HasDefaultValueSql("((1))");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.ExpenseItems)
                    .HasForeignKey(d => d.EmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ExpenseItems_Employees");

                entity.HasOne(d => d.ReportNumberNavigation)
                    .WithMany(p => p.ExpenseItems)
                    .HasForeignKey(d => d.ReportNumber)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ExpenseItems_ExpenseReports");
            });

            modelBuilder.Entity<ExpenseReports>(entity =>
            {
                entity.Property(e => e.ReportNumber).ValueGeneratedNever();

                entity.Property(e => e.EmployeeName).IsUnicode(false);

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.ExpenseReports)
                    .HasForeignKey(d => d.EmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ExpenseReports_Employees");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
