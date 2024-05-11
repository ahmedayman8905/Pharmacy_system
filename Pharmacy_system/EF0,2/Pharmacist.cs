using System;
using System.Collections.Generic;

namespace EF0_2;

public partial class Pharmacist
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public string? Phone { get; set; }

    public string? Address { get; set; }

    public string? Gender { get; set; }

    public string? EMail { get; set; }

    public DateOnly? BirthDay { get; set; }

    public int? Ssn { get; set; }

    public DateOnly? HireDate { get; set; }

    public int? Salary { get; set; }

    public int? TimeWork { get; set; }

    public int? DepartId { get; set; }

    public string? JopTitle { get; set; }

    public int? LicenseNum { get; set; }

    public virtual ICollection<Client> Clients { get; set; } = new List<Client>();

    public virtual ICollection<Drug> Drugs { get; set; } = new List<Drug>();
}
