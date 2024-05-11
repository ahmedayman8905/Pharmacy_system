using System;
using System.Collections.Generic;

namespace EF0_2;

public partial class Credit
{
    public int CreditId { get; set; }

    public int? PaymentId { get; set; }

    public virtual Payment? Payment { get; set; }
}
