using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Security;
using System.Web.UI.WebControls;
using static Common;
using static Tour;

public partial class Admin_Create : System.Web.UI.Page
{
    private string userName;

    private static readonly string TABLE_TOUR = "tbltourpackages";
    private static readonly string TABLE_CATEGORY = "tblCategories";
    private static readonly string TABLE_TYPE = "tblTourTypes";

    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser currentUser = Membership.GetUser();
        userName = currentUser.UserName;

        SetList(tourType, TABLE_TYPE, "TYPEID", "Type");
        SetList(category, TABLE_CATEGORY, "CATID", "Category");
    }

    protected void CmdAdd_Click(object sender, EventArgs e)
    {
        if (imgUp.HasFile)
        {
            UploadPhoto();
            ExecuteNonQuery(SetValues(), InsertCmd(ColumnNames(typeof(Tour)), TABLE_TOUR));
        }
    }

    protected void CmdUpdate_Click(object sender, EventArgs e)
    {
        if (imgUp.HasFile)
        {
            UploadPhoto();
           ExecuteNonQuery(SetValues(), UpdateCmd(ColumnNames(typeof(Tour)), TABLE_TOUR, "2"));
        }
    }

    protected void CmdDelete_Click(object sender, EventArgs e)
    {
        Delete(TABLE_TOUR, "6");
    }

    private void UploadPhoto()
    {
        imgUp.SaveAs(Server.MapPath("~\\Images") + "/" + imgUp.FileName);
    }

    private Dictionary<Column, object> SetValues()
    {
        var values = new Dictionary<Column, object>
        {
            { PackageName, txtPackName.Text },
            { TourType, tourType.SelectedValue },
            { Category, category.SelectedValue },
            { Duration, duration.Text},
            { InDate, DateTime.Now.ToString() },
            { City, city.Text },
            { Country, country.Text },
            { DesUrl, link.Text },
            { ImageUrl, ImagePath(imgUp.FileName) },
            { Description, description.Text },
            { Username, userName }
        };

        return values;
    }
}