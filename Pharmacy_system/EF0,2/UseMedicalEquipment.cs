using System;
using System.Collections.Generic;

namespace EF0_2;

public partial class UseMedicalEquipment
{
    public int? MedicalId { get; set; }

    public int? PharmacistId { get; set; }

    public virtual MedicalEquipment? Medical { get; set; }

    public virtual Pharmacist? Pharmacist { get; set; }
}
