using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace EF0_2;

public partial class PharmacySystemContext : DbContext
{
    public PharmacySystemContext()
    {
    }

    public PharmacySystemContext(DbContextOptions<PharmacySystemContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Accountant> Accountants { get; set; }

    public virtual DbSet<Bill> Bills { get; set; }

    public virtual DbSet<Cash> Cashes { get; set; }

    public virtual DbSet<Client> Clients { get; set; }

    public virtual DbSet<Company> Companies { get; set; }

    public virtual DbSet<CompanyOwner> CompanyOwners { get; set; }

    public virtual DbSet<Credit> Credits { get; set; }

    public virtual DbSet<DigitalMarkter> DigitalMarkters { get; set; }

    public virtual DbSet<Drug> Drugs { get; set; }

    public virtual DbSet<Employee> Employees { get; set; }

    public virtual DbSet<Hr> Hrs { get; set; }

    public virtual DbSet<Item> Items { get; set; }

    public virtual DbSet<Manger> Mangers { get; set; }

    public virtual DbSet<MedicalEquipment> MedicalEquipments { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<Payment> Payments { get; set; }

    public virtual DbSet<Pharmacist> Pharmacists { get; set; }

    public virtual DbSet<SystemAdmin> SystemAdmins { get; set; }

    public virtual DbSet<Tax> Taxes { get; set; }

    public virtual DbSet<UseMedicalEquipment> UseMedicalEquipments { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server = . ; Database = Pharmacy_system ; Integrated Security = SSPI ; TrustServerCertificate = True ");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Accountant>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Accounta__3214EC27C09950A5");

            entity.ToTable("Accountant", "Cairo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Address)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.BirthDay).HasColumnName("Birth_day");
            entity.Property(e => e.EMail)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("E_mail");
            entity.Property(e => e.Gender)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.HireDate).HasColumnName("Hire_date");
            entity.Property(e => e.ManagerId).HasColumnName("manager_id");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(11)
                .IsUnicode(false);
            entity.Property(e => e.Ssn).HasColumnName("SSN");

            entity.HasOne(d => d.Manager).WithMany(p => p.Accountants)
                .HasForeignKey(d => d.ManagerId)
                .HasConstraintName("FK__Accountan__manag__46E78A0C");
        });

        modelBuilder.Entity<Bill>(entity =>
        {
            entity.HasKey(e => e.BillId).HasName("PK__Bill__CF6E7D4332E95D71");

            entity.ToTable("Bill", "Cairo");

            entity.Property(e => e.BillId).HasColumnName("Bill_ID");
            entity.Property(e => e.ClientId).HasColumnName("client_id");
            entity.Property(e => e.DateTime)
                .HasColumnType("datetime")
                .HasColumnName("Date_Time");
            entity.Property(e => e.MedicationDetails)
                .IsUnicode(false)
                .HasColumnName("Medication_Details");
            entity.Property(e => e.NotesComments)
                .IsUnicode(false)
                .HasColumnName("Notes_Comments");
            entity.Property(e => e.PatientInformation)
                .IsUnicode(false)
                .HasColumnName("Patient_Information");
            entity.Property(e => e.PharmacyDetails).IsUnicode(false);
            entity.Property(e => e.PrescriptionDetails)
                .IsUnicode(false)
                .HasColumnName("Prescription_Details");
            entity.Property(e => e.Price).HasColumnType("decimal(10, 1)");

            entity.HasOne(d => d.Client).WithMany(p => p.Bills)
                .HasForeignKey(d => d.ClientId)
                .HasConstraintName("FK__Bill__client_id__20C1E124");
        });

        modelBuilder.Entity<Cash>(entity =>
        {
            entity.HasKey(e => new { e.CashId, e.PaymentId }).HasName("PK__Cash__6B801A4B03734CD8");

            entity.ToTable("Cash", "Cairo");

            entity.Property(e => e.CashId)
                .ValueGeneratedOnAdd()
                .HasColumnName("CashID");
            entity.Property(e => e.PaymentId).HasColumnName("payment_id");

            entity.HasOne(d => d.Payment).WithMany(p => p.Cashes)
                .HasForeignKey(d => d.PaymentId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Cash__payment_id__32E0915F");
        });

        modelBuilder.Entity<Client>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Client__3214EC27D519E8AD");

            entity.ToTable("Client", "Cairo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Address)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.BirthDay).HasColumnName("Birth_day");
            entity.Property(e => e.EMail)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("E_mail");
            entity.Property(e => e.Gender)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.PharmacistId).HasColumnName("Pharmacist_id");
            entity.Property(e => e.Phone)
                .HasMaxLength(11)
                .IsUnicode(false);
            entity.Property(e => e.Ssn).HasColumnName("SSN");

            entity.HasOne(d => d.Pharmacist).WithMany(p => p.Clients)
                .HasForeignKey(d => d.PharmacistId)
                .HasConstraintName("FK__Client__Pharmaci__1A14E395");
        });

        modelBuilder.Entity<Company>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Company__3214EC27E5AE1528");

            entity.ToTable("Company", "Cairo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CompEmail)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Comp_Email");
            entity.Property(e => e.CompLocation)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Comp_Location");
            entity.Property(e => e.CompName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Comp_Name");
        });

        modelBuilder.Entity<CompanyOwner>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Company___3214EC279A54A77C");

            entity.ToTable("Company_Owner", "Cairo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Address)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.BirthDay).HasColumnName("Birth_day");
            entity.Property(e => e.Company)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.CompanyId).HasColumnName("Company_id");
            entity.Property(e => e.EMail)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("E_mail");
            entity.Property(e => e.Gender)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.HireDate).HasColumnName("Hire_date");
            entity.Property(e => e.ManagerId).HasColumnName("manager_id");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(11)
                .IsUnicode(false);
            entity.Property(e => e.Ssn).HasColumnName("SSN");

            entity.HasOne(d => d.CompanyNavigation).WithMany(p => p.CompanyOwners)
                .HasForeignKey(d => d.CompanyId)
                .HasConstraintName("FK__Company_O__Compa__4222D4EF");

            entity.HasOne(d => d.Manager).WithMany(p => p.CompanyOwners)
                .HasForeignKey(d => d.ManagerId)
                .HasConstraintName("FK__Company_O__manag__4316F928");
        });

        modelBuilder.Entity<Credit>(entity =>
        {
            entity.HasKey(e => e.CreditId).HasName("PK__Credit__0FE0B336BE02AB98");

            entity.ToTable("Credit", "Cairo");

            entity.Property(e => e.CreditId).HasColumnName("Credit_ID");
            entity.Property(e => e.PaymentId).HasColumnName("payment_id");

            entity.HasOne(d => d.Payment).WithMany(p => p.Credits)
                .HasForeignKey(d => d.PaymentId)
                .HasConstraintName("FK__Credit__payment___35BCFE0A");
        });

        modelBuilder.Entity<DigitalMarkter>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Digital___3214EC27DEA12D17");

            entity.ToTable("Digital_Markter", "Cairo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Address)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.BirthDay).HasColumnName("Birth_day");
            entity.Property(e => e.CompanyId).HasColumnName("Company_id");
            entity.Property(e => e.EMail)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("E_mail");
            entity.Property(e => e.Gender)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.HireDate).HasColumnName("Hire_date");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(11)
                .IsUnicode(false);
            entity.Property(e => e.Ssn).HasColumnName("SSN");

            entity.HasOne(d => d.Company).WithMany(p => p.DigitalMarkters)
                .HasForeignKey(d => d.CompanyId)
                .HasConstraintName("FK__Digital_M__Compa__3B75D760");
        });

        modelBuilder.Entity<Drug>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Drug__3214EC27F6102744");

            entity.ToTable("Drug", "Cairo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.ClientId).HasColumnName("client_id");
            entity.Property(e => e.CompanyId).HasColumnName("Company_ID");
            entity.Property(e => e.DrugName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Drug_Name");
            entity.Property(e => e.Druginformation).IsUnicode(false);
            entity.Property(e => e.ExpDate).HasColumnName("Exp_Date");
            entity.Property(e => e.MfgDate).HasColumnName("Mfg_Date");
            entity.Property(e => e.PharmacistId).HasColumnName("pharmacist_id");
            entity.Property(e => e.Price).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.SideEffect)
                .IsUnicode(false)
                .HasColumnName("Side_effect");

            entity.HasOne(d => d.Client).WithMany(p => p.Drugs)
                .HasForeignKey(d => d.ClientId)
                .HasConstraintName("FK__Drug__client_id__1CF15040");

            entity.HasOne(d => d.Pharmacist).WithMany(p => p.Drugs)
                .HasForeignKey(d => d.PharmacistId)
                .HasConstraintName("FK__Drug__pharmacist__1DE57479");
        });

        modelBuilder.Entity<Employee>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Employee__3214EC27231423CE");

            entity.ToTable("Employee", "Cairo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Address)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.BirthDay).HasColumnName("Birth_day");
            entity.Property(e => e.EMail)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("E_mail");
            entity.Property(e => e.Gender)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.HireDate).HasColumnName("Hire_date");
            entity.Property(e => e.JopTitle)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("Jop_Title");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(11)
                .IsUnicode(false);
            entity.Property(e => e.Ssn).HasColumnName("SSN");
            entity.Property(e => e.TimeWork).HasColumnName("Time_Work");

            entity.HasOne(d => d.HrNavigation).WithMany(p => p.Employees)
                .HasForeignKey(d => d.Hr)
                .HasConstraintName("FK__Employee__Hr__5535A963");
        });

        modelBuilder.Entity<Hr>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__HR__3214EC27CD5686CD");

            entity.ToTable("HR", "Cairo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Address)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.BirthDay).HasColumnName("Birth_day");
            entity.Property(e => e.EMail)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("E_mail");
            entity.Property(e => e.Gender)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.HireDate).HasColumnName("Hire_date");
            entity.Property(e => e.ManagerId).HasColumnName("manager_id");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(11)
                .IsUnicode(false);
            entity.Property(e => e.Ssn).HasColumnName("SSN");
            entity.Property(e => e.TimeWork).HasColumnName("Time_Work");

            entity.HasOne(d => d.Manager).WithMany(p => p.Hrs)
                .HasForeignKey(d => d.ManagerId)
                .HasConstraintName("FK__HR__manager_id__5165187F");
        });

        modelBuilder.Entity<Item>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Item__3214EC27072FA707");

            entity.ToTable("Item", "Cairo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.OrderId).HasColumnName("order_id");

            entity.HasOne(d => d.Order).WithMany(p => p.Items)
                .HasForeignKey(d => d.OrderId)
                .HasConstraintName("FK__Item__order_id__276EDEB3");
        });

        modelBuilder.Entity<Manger>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Manger__3214EC27B853AC69");

            entity.ToTable("Manger", "Cairo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Address)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.BirthDay).HasColumnName("Birth_day");
            entity.Property(e => e.Department)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.EMail)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("E_mail");
            entity.Property(e => e.Gender)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.HireDate).HasColumnName("Hire_date");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(11)
                .IsUnicode(false);
            entity.Property(e => e.Ssn).HasColumnName("SSN");
        });

        modelBuilder.Entity<MedicalEquipment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Medical___3214EC2729B7C395");

            entity.ToTable("Medical_Equipment", "Cairo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Available)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.DeviceManufactureCompany)
                .IsUnicode(false)
                .HasColumnName("Device_manufacture_company");
            entity.Property(e => e.DeviceName)
                .IsUnicode(false)
                .HasColumnName("Device_Name");
            entity.Property(e => e.DeviceVersionNumber).HasColumnName("Device_version_number");
            entity.Property(e => e.MaintenanceRecords).HasColumnName("Maintenance_Records");
            entity.Property(e => e.UsageLogs).HasColumnName("Usage_Logs");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Orders__3214EC27DC36F8DC");

            entity.ToTable("Orders", "Cairo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.BillId).HasColumnName("bill_id");
            entity.Property(e => e.ClientId).HasColumnName("client_id");
            entity.Property(e => e.TotalPrice).HasColumnType("decimal(10, 2)");

            entity.HasOne(d => d.Bill).WithMany(p => p.Orders)
                .HasForeignKey(d => d.BillId)
                .HasConstraintName("FK__Orders__bill_id__239E4DCF");

            entity.HasOne(d => d.Client).WithMany(p => p.Orders)
                .HasForeignKey(d => d.ClientId)
                .HasConstraintName("FK__Orders__client_i__24927208");
        });

        modelBuilder.Entity<Payment>(entity =>
        {
            entity.HasKey(e => e.PayId).HasName("PK__Payment__EE8FCE2FD74547C3");

            entity.ToTable("Payment", "Cairo");

            entity.Property(e => e.PayId).HasColumnName("PayID");
            entity.Property(e => e.Amount).HasColumnType("decimal(10, 4)");
            entity.Property(e => e.BillId).HasColumnName("bill_id");

            entity.HasOne(d => d.Bill).WithMany(p => p.Payments)
                .HasForeignKey(d => d.BillId)
                .HasConstraintName("FK__Payment__bill_id__2A4B4B5E");
        });

        modelBuilder.Entity<Pharmacist>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Pharmaci__3214EC27B6A28DD6");

            entity.ToTable("Pharmacist", "Cairo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Address)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.BirthDay).HasColumnName("Birth_day");
            entity.Property(e => e.EMail)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("E_mail");
            entity.Property(e => e.Gender)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.HireDate).HasColumnName("Hire_date");
            entity.Property(e => e.JopTitle)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("Jop_Title");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(11)
                .IsUnicode(false);
            entity.Property(e => e.Ssn).HasColumnName("SSN");
            entity.Property(e => e.TimeWork).HasColumnName("Time_Work");
        });

        modelBuilder.Entity<SystemAdmin>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__System_A__3214EC2745182553");

            entity.ToTable("System_Admin", "Cairo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Address)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.BirthDay).HasColumnName("Birth_day");
            entity.Property(e => e.EMail)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("E_mail");
            entity.Property(e => e.Gender)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.HireDate).HasColumnName("Hire_date");
            entity.Property(e => e.ManagerId).HasColumnName("manager_id");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(11)
                .IsUnicode(false);
            entity.Property(e => e.Ssn).HasColumnName("SSN");
            entity.Property(e => e.TimeWork).HasColumnName("Time_Work");

            entity.HasOne(d => d.Manager).WithMany(p => p.SystemAdmins)
                .HasForeignKey(d => d.ManagerId)
                .HasConstraintName("FK__System_Ad__manag__4D94879B");
        });

        modelBuilder.Entity<Tax>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__TAX__3214EC27A7160441");

            entity.ToTable("TAX", "Cairo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AccountantId).HasColumnName("Accountant_id");
            entity.Property(e => e.Expenses).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.Revenues).HasColumnType("decimal(10, 2)");

            entity.HasOne(d => d.Accountant).WithMany(p => p.Taxes)
                .HasForeignKey(d => d.AccountantId)
                .HasConstraintName("FK__TAX__Accountant___49C3F6B7");
        });

        modelBuilder.Entity<UseMedicalEquipment>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("Use_Medical_Equipment", "Cairo");

            entity.Property(e => e.MedicalId).HasColumnName("medical_id");
            entity.Property(e => e.PharmacistId).HasColumnName("pharmacist_id");

            entity.HasOne(d => d.Medical).WithMany()
                .HasForeignKey(d => d.MedicalId)
                .HasConstraintName("FK__Use_Medic__medic__15502E78");

            entity.HasOne(d => d.Pharmacist).WithMany()
                .HasForeignKey(d => d.PharmacistId)
                .HasConstraintName("FK__Use_Medic__pharm__164452B1");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
