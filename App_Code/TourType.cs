using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

public class TourType : Column
{
    public static readonly Column Table = Create("tblTourTypes", true);
    public static readonly Column TypeId = Create("typeId", SqlDbType.Int, true);
    public static readonly Column TypeName = Create("type", SqlDbType.NVarChar);
}