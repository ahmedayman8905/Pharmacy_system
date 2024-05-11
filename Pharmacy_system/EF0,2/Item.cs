using System;
using System.Collections.Generic;

namespace EF0_2;

public partial class Item
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public int? Quantity { get; set; }

    public int? OrderId { get; set; }

    public virtual Order? Order { get; set; }
}
