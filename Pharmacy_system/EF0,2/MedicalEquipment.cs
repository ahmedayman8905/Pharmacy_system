using System;
using System.Collections.Generic;

namespace EF0_2;

public partial class MedicalEquipment
{
    public int Id { get; set; }

    public string? DeviceName { get; set; }

    public int? DeviceVersionNumber { get; set; }

    public string? DeviceManufactureCompany { get; set; }

    public DateOnly? MaintenanceRecords { get; set; }

    public DateOnly? UsageLogs { get; set; }

    public string? Available { get; set; }
}
