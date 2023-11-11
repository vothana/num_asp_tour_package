using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

public class TourType : Column
{
    public static readonly Column TypeId = Create("typeId", SqlDbType.Int);
    public static readonly Column TypeName = Create("type", SqlDbType.NVarChar);
}