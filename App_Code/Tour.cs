using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

public class Tour : Column
{
    public static readonly Column Table = Create("tbltourpackages", true);
    public static readonly  Column ID = Create("id", SqlDbType.Int, true);
    public static readonly  Column PackageName = Create("packagename", SqlDbType.NVarChar);
    public static readonly Column TourType = Create("typeid", SqlDbType.Int);
    public static readonly Column Category = Create("catid", SqlDbType.Int);
    public static readonly Column Duration = Create("duration", SqlDbType.Int);
    public static readonly Column InDate = Create("in_date", SqlDbType.DateTime);
    public static readonly Column City = Create("city", SqlDbType.NVarChar);
    public static readonly Column Country = Create("country", SqlDbType.NVarChar);
    public static readonly Column DesUrl = Create("desurl", SqlDbType.NVarChar);
    public static readonly Column ImageUrl = Create("image_url", SqlDbType.NVarChar);
    public static readonly Column Description = Create("description", SqlDbType.NVarChar);
    public static readonly Column Username = Create("username", SqlDbType.NVarChar);
}