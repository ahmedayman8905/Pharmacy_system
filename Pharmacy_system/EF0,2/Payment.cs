using System;
using System.Collections.Generic;

namespace EF0_2;

public partial class Payment
{
    public int PayId { get; set; }

    public decimal Amount { get; set; }

    public int? BillId { get; set; }

    public virtual Bill? Bill { get; set; }

    public virtual ICollection<Cash> Cashes { get; set; } = new List<Cash>();

    public virtual ICollection<Credit> Credits { get; set; } = new List<Credit>();
}
