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
    private string tourId;
    private string imageName;

    protected void Page_Load(object sender, EventArgs e)
    {
        // MembershipUser currentUser = Membership.GetUser();
        //userName = currentUser.UserName;
        userName = "Vothana";

        SetList(tourType, TourType.Table.Name, TourType.TypeId.Name, TourType.TypeName.Name);
        SetList(category, TourCategory.Table.Name, TourCategory.CatId.Name, TourCategory.Category.Name);

        tourId = Request.QueryString.Get("pid");
        if (!string.IsNullOrEmpty(tourId))
        {
            chkAgr.Visible = false;
            cmdDelete.Visible = true;
            mImgUrl.Visible = true;
            cmdSubmit.Text = "Update";

            if (!IsPostBack)
            {
                PopulateData();
            }
        }

        if (!IsPostBack)
        {
            chkAgr.Checked = false;
            cmdSubmit.Enabled = false;
            cmdDelete.Enabled = false;
        }
    }

    protected void chkAgr_CheckedChanged(object sender, EventArgs e)
    {
        if (chkAgr.Checked == true)
        {
            cmdDelete.Enabled = true;
            cmdSubmit.Enabled = true;
        }
        else
        {
            cmdDelete.Enabled = false;
            cmdSubmit.Enabled = false;
        }
    }

    protected void CmdSubmit_Click(object sender, EventArgs e)
    {
        if (cmdSubmit.Text == "Update")
            Update();
        else
            AddNew();
    }

    private void AddNew()
    {
        if (imgUp.HasFile && cmdSubmit.Text != "Update")
        {
            UploadPhoto();
            ExecuteNonQuery(SetValues(), InsertCmd(ColumnNames(typeof(Tour)), Tour.Table.Name));
        }
    }

    private void Update()
    {
        if (imgUp.HasFile &&  imgUp.FileName != imageName)
        {
            var file = "~\\" + imageName;
            bool exists = System.IO.File.Exists(Server.MapPath(file));
            if(exists)
            {
                Log("DELETING FILE: " + file);
                System.IO.File.Delete(Server.MapPath(file));
            }

            UploadPhoto();
        }

        ExecuteNonQuery(SetValues(), UpdateCmd(ColumnNames(typeof(Tour)), Tour.Table.Name, tourId));
    }

    protected void DeleteRecord(object sender, EventArgs e)
    {
        Delete(Tour.Table.Name, tourId);
    }

    private void UploadPhoto()
    {
        var folder = "~\\Images";
        bool exists = System.IO.Directory.Exists(Server.MapPath(folder));
        if (!exists)
            System.IO.Directory.CreateDirectory(Server.MapPath(folder));

        Log("IMAGE : " + imgUp.FileName);
        imgUp.SaveAs(Server.MapPath(folder) + "/" + imgUp.FileName);
    }

    private void PopulateData()
    {
        if (!string.IsNullOrEmpty(tourId))
        {
            Log("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
            string whereCondition = Tour.ID.Name + " = " + tourId;
            DataTable dataTable = SelectAll(Tour.Table.Name, whereCondition);
            var data = dataTable.Rows[0];
            if (data != null)
            {
                txtPackName.Text = data[PackageName.Name].ToString();
                tourType.Text = data[Tour.TourType.Name].ToString();
                category.Text = data[Category.Name].ToString();
                duration.Text = data[Duration.Name].ToString();
                city.Text = data[City.Name].ToString();
                country.Text = data[Country.Name].ToString();
                link.Text = data[DesUrl.Name].ToString();
                description.Text = data[Description.Name].ToString();

                imageName = data[ImageUrl.Name].ToString();
                mImgUrl.ImageUrl = "~/" + imageName;
            }
        }
    }

    private Dictionary<Column, object> SetValues()
    {
        var values = new Dictionary<Column, object>
        {
            { PackageName, txtPackName.Text },
            { Tour.TourType, tourType.SelectedValue },
            { Category, category.SelectedValue },
            { Duration, duration.Text},
            { InDate, DateTime.Now },
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