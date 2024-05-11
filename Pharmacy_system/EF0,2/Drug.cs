using System;
using System.Collections.Generic;

namespace EF0_2;

public partial class Drug
{
    public int Id { get; set; }

    public string? DrugName { get; set; }

    public int? CompanyId { get; set; }

    public DateOnly? MfgDate { get; set; }

    public DateOnly? ExpDate { get; set; }

    public int? Quantity { get; set; }

    public decimal? Price { get; set; }

    public string? SideEffect { get; set; }

    public string? Druginformation { get; set; }

    public int? ClientId { get; set; }

    public int? PharmacistId { get; set; }

    public virtual Client? Client { get; set; }

    public virtual Pharmacist? Pharmacist { get; set; }
}
