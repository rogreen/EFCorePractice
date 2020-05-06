using Microsoft.EntityFrameworkCore;

namespace EFCorePractice
{
    public partial class WinesDbContext : DbContext
    {
        public WinesDbContext()
        {
        }

        public WinesDbContext(DbContextOptions<WinesDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Region> Region { get; set; }
        public virtual DbSet<Varietal> Varietal { get; set; }
        public virtual DbSet<Wine> Wine { get; set; }
        public virtual DbSet<Winery> Winery { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=desktop-go1uddd;Initial Catalog=rogreenwines_db;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Region>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .HasName("PK__Region__3213E83EC07A1F46")
                    .IsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("__createdAt")
                    .IsClustered();

                entity.Property(e => e.Id).HasDefaultValueSql("(CONVERT([nvarchar](255),newid(),(0)))");

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(CONVERT([datetimeoffset](3),sysutcdatetime(),(0)))");

                entity.Property(e => e.Version)
                    .IsRowVersion()
                    .IsConcurrencyToken();
            });

            modelBuilder.Entity<Varietal>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .HasName("PK__Varietal__3213E83E1C7874F0")
                    .IsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("__createdAt")
                    .IsClustered();

                entity.Property(e => e.Id).HasDefaultValueSql("(CONVERT([nvarchar](255),newid(),(0)))");

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(CONVERT([datetimeoffset](3),sysutcdatetime(),(0)))");

                entity.Property(e => e.Version)
                    .IsRowVersion()
                    .IsConcurrencyToken();
            });

            modelBuilder.Entity<Wine>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .HasName("PK__Wine__3213E83E8D398EF3")
                    .IsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("__createdAt")
                    .IsClustered();

                entity.Property(e => e.Id).HasDefaultValueSql("(CONVERT([nvarchar](255),newid(),(0)))");

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(CONVERT([datetimeoffset](3),sysutcdatetime(),(0)))");

                entity.Property(e => e.Version)
                    .IsRowVersion()
                    .IsConcurrencyToken();

                entity.HasOne(d => d.Region)
                    .WithMany(p => p.Wines)
                    .HasForeignKey(d => d.RegionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Wines_Regions");

                entity.HasOne(d => d.Varietal)
                    .WithMany(p => p.Wines)
                    .HasForeignKey(d => d.VarietalId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Wines_Varietals");

                entity.HasOne(d => d.Winery)
                    .WithMany(p => p.Wines)
                    .HasForeignKey(d => d.WineryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Wines_Wineries");
            });

            modelBuilder.Entity<Winery>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .HasName("PK__Winery__3213E83EF5FC7C7F")
                    .IsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("__createdAt")
                    .IsClustered();

                entity.Property(e => e.Id).HasDefaultValueSql("(CONVERT([nvarchar](255),newid(),(0)))");

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(CONVERT([datetimeoffset](3),sysutcdatetime(),(0)))");

                entity.Property(e => e.Version)
                    .IsRowVersion()
                    .IsConcurrencyToken();
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
