using System;
using System.Collections.Generic;

namespace EF0_2;

public partial class Order
{
    public int Id { get; set; }

    public decimal? TotalPrice { get; set; }

    public int? Quantity { get; set; }

    public int? BillId { get; set; }

    public int? ClientId { get; set; }

    public virtual Bill? Bill { get; set; }

    public virtual Client? Client { get; set; }

    public virtual ICollection<Item> Items { get; set; } = new List<Item>();
}
