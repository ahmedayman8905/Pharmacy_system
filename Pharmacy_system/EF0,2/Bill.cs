using System;
using System.Collections.Generic;

namespace EF0_2;

public partial class Bill
{
    public int BillId { get; set; }

    public string? PatientInformation { get; set; }

    public string? PrescriptionDetails { get; set; }

    public string? MedicationDetails { get; set; }

    public DateTime? DateTime { get; set; }

    public decimal? Price { get; set; }

    public string? PharmacyDetails { get; set; }

    public string? NotesComments { get; set; }

    public int? ClientId { get; set; }

    public virtual Client? Client { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();
}
