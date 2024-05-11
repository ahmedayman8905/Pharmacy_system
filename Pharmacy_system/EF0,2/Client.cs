using System;
using System.Collections.Generic;

namespace EF0_2;

public partial class Client
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public string? Phone { get; set; }

    public string? Address { get; set; }

    public string? Gender { get; set; }

    public string? EMail { get; set; }

    public DateOnly? BirthDay { get; set; }

    public int? Ssn { get; set; }

    public int? PharmacistId { get; set; }

    public virtual ICollection<Bill> Bills { get; set; } = new List<Bill>();

    public virtual ICollection<Drug> Drugs { get; set; } = new List<Drug>();

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();

    public virtual Pharmacist? Pharmacist { get; set; }
}
