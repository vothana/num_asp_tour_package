﻿using System;
using System.Data;
using System.Web.UI.WebControls;
using static Common;

public partial class Admin_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateData();
        }
    }

    protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        (ListView1.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        this.PopulateData();
    }

    private void PopulateData()
    {
        string whereCondition = Tour.Table.Name + "." + Tour.Category.Name + "=" + "1";
        DataTable dataTable = SelectAll(JoinTable(Tour.Table.Name, TourType.Table.Name, Tour.TourType.Name), null);
        ListView1.DataSource = dataTable;
        ListView1.DataBind();
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        TextBox tId = (TextBox)e.Item.FindControl("txtId");
        //Response.Redirect("proDetail.aspx?pid=" + tId.Text);
        if (e.CommandName == "editImage")
            Response.Redirect("editImage.aspx?pId=" + tId.Text);
        else
            Response.Redirect("Create.aspx?pId=" + tId.Text);
    }
}