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
        MembershipUser currentUser = Membership.GetUser();
        userName = currentUser.UserName;

        SetList(tourType, TourType.Table.Name, TourType.TypeId.Name, TourType.TypeName.Name);
        SetList(category, TourCategory.Table.Name, TourCategory.CatId.Name, TourCategory.Category.Name);

        tourId = Request.QueryString.Get("pid");
        cmdDelete.Enabled = false;
        cmdSubmit.Enabled = false;

        if (!string.IsNullOrEmpty(tourId))
        {
            cmdDelete.Visible = true;
            cmdSubmit.Text = "Update";

            if (!IsPostBack)
            {
                PopulateData();
            }
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
        if ((imgUp.PostedFile.ContentLength > 0) && cmdSubmit.Text != "Update")
        {
            UploadPhoto();
            bool result = ExecuteNonQuery(SetValues(), InsertCmd(ColumnNames(typeof(Tour)), Tour.Table.Name));
            if (result) {
                sucessLeel.Visible = true;
                Clear();
            }
            else
            {
                sucessLeel.Visible = true;
                sucessLeel.Text = "Fail";
            }
        }
    }


    private void Update()
    {
        var fileName = imgUp.PostedFile.FileName;
        if ((imgUp.PostedFile.ContentLength > 0) && (fileName != imageName))
        {
            var file = "~\\" + imageName;
            bool exists = System.IO.File.Exists(Server.MapPath(file));
            if (exists)
            {
                Log("DELETING FILE: " + file);
                System.IO.File.Delete(Server.MapPath(file));
            }

            UploadPhoto();
        }

        bool result =  ExecuteNonQuery(SetValues(), UpdateCmd(ColumnNames(typeof(Tour)), Tour.Table.Name, tourId));
        if (result)
        {
            sucessLeel.Visible = true;
            Clear();
        }
        else
        {
            sucessLeel.Visible = true;
            sucessLeel.Text = "Fail";
        }
    }

    protected void DeleteRecord(object sender, EventArgs e)
    {
       var result = Delete(Tour.Table.Name, tourId);
        if (result)
        {
            Response.Redirect("~\\Admin\\Index.aspx");
        }
    }

    protected void Cancel(object sender, EventArgs e)
    {
        Response.Redirect("~\\Admin\\Index.aspx");
    }

    private void UploadPhoto()
    {
        var folder = "~\\Images";
        bool exists = System.IO.Directory.Exists(Server.MapPath(folder));
        if (!exists)
            System.IO.Directory.CreateDirectory(Server.MapPath(folder));

        Log("IMAGE : " + imgUp.PostedFile.FileName);
        imageName = imgUp.PostedFile.FileName;
        imgUp.PostedFile.SaveAs(Server.MapPath(folder) + "/" + imageName);
    }

    private void PopulateData()
    {
        if (!string.IsNullOrEmpty(tourId))
        {
            string whereCondition = " WHERE " + Tour.ID.Name + " = " + tourId;
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
            { Tour.TourType, tourType.SelectedValue},
            { Category, category.SelectedValue },
            { Duration, duration.Text},
            { InDate, DateTime.Now },
            { City, city.Text },
            { Country, country.Text },
            { DesUrl, link.Text },
            { ImageUrl, ImagePath(imageName) },
            { Description, description.Text },
            { Username, userName }
        };

        return values;
    }

    private void Clear()
    {
        txtPackName.Text =
            duration.Text =
            country.Text =
             city.Text =
             description.Text =
             link.Text =
            string.Empty;
        chkAgr.Checked = false;
    }
}