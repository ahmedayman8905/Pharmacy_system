using System;
using System.Collections.Generic;

namespace EF0_2;

public partial class Tax
{
    public int Id { get; set; }

    public decimal? Revenues { get; set; }

    public decimal? Expenses { get; set; }

    public int? AccountantId { get; set; }

    public virtual Accountant? Accountant { get; set; }
}
