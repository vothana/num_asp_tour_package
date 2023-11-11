using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


public class TourCategory : Column
{
    public static readonly Column CatId = Create("catId", SqlDbType.Int);
    public static readonly Column Category = Create("category", SqlDbType.NVarChar);
}