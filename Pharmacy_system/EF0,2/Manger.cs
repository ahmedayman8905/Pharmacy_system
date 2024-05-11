using System;
using System.Collections.Generic;

namespace EF0_2;

public partial class Manger
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

    public string? Department { get; set; }

    public virtual ICollection<Accountant> Accountants { get; set; } = new List<Accountant>();

    public virtual ICollection<CompanyOwner> CompanyOwners { get; set; } = new List<CompanyOwner>();

    public virtual ICollection<Hr> Hrs { get; set; } = new List<Hr>();

    public virtual ICollection<SystemAdmin> SystemAdmins { get; set; } = new List<SystemAdmin>();
}
