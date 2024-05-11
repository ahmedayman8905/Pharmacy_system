using System;
using System.Collections.Generic;

namespace EF0_2;

public partial class CompanyOwner
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

    public string? Company { get; set; }

    public int? CompanyId { get; set; }

    public int? ManagerId { get; set; }

    public virtual Company? CompanyNavigation { get; set; }

    public virtual Manger? Manager { get; set; }
}
