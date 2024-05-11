using System;
using System.Collections.Generic;

namespace EF0_2;

public partial class Company
{
    public int Id { get; set; }

    public string CompName { get; set; } = null!;

    public string CompEmail { get; set; } = null!;

    public string CompLocation { get; set; } = null!;

    public virtual ICollection<CompanyOwner> CompanyOwners { get; set; } = new List<CompanyOwner>();

    public virtual ICollection<DigitalMarkter> DigitalMarkters { get; set; } = new List<DigitalMarkter>();
}
