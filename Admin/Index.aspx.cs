using System;
using System.Data;
using System.Web.Security;
using System.Web.UI.WebControls;
using static Common;

public partial class Admin_Index : System.Web.UI.Page
{

    private string search;
    private string catId;
    private string sqlStr;
    private string userName;

    protected void Page_Load(object sender, EventArgs e)
    {

        MembershipUser currentUser = Membership.GetUser();
        userName = currentUser.UserName;


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

        search = Request.QueryString.Get("search");
        if (!string.IsNullOrEmpty(search))
        {
            string main = Tour.Table.Name;
            string join1 = TourType.Table.Name;
            string join2 = TourCategory.Table.Name;
            string joinOn1 = Tour.TourType.Name;
            string joinOn2 = TourCategory.CatId.Name;

            sqlStr = String.Format("{0} AS {0} INNER JOIN {1} AS {1} ON {0}.{2} = {1}.{2} INNER JOIN {3} AS {3} ON {0}.{4} = {3}.{4}",
            main, join1, joinOn1, join2, joinOn2);

            // Should not place value in here search, catId
            sqlStr += String.Format(" WHERE {0}.{1} LIKE '%{2}%'", main, Tour.PackageName.Name, search);


            sqlStr += string.IsNullOrEmpty(catId) ? "" : String.Format(" AND {0}.{1} = '%{2}%'", main, Tour.Category.Name, catId);

            Log("SQL String: " + sqlStr);
        }

        catId = Request.QueryString.Get("catId");
        var byAdmin = String.Format(" {0}.{1} = '{2}'", Tour.Table.Name, Tour.Username.Name, userName);
        var orderBy = byAdmin + "  ORDER BY " + Tour.ID.Name + "  DESC";

        string whereCondition = " WHERE " + Tour.Table.Name + "." + Tour.Category.Name + "=" + catId + " AND " + orderBy;
        DataTable dataTable = SelectAll(
            !string.IsNullOrEmpty(sqlStr) ? sqlStr  + " AND " + orderBy : JoinTable(Tour.Table.Name, TourType.Table.Name, Tour.TourType.Name) ,
            !string.IsNullOrEmpty(catId) && string.IsNullOrEmpty(sqlStr) ? whereCondition : " WHERE " + orderBy);

        ListView1.DataSource = dataTable;
        ListView1.DataBind();

        DataTable categories = SelectAll(TourCategory.Table.Name, null);

        CategoryRepeater.DataSource = categories;
        CategoryRepeater.DataBind();
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        TextBox tId = (TextBox)e.Item.FindControl("txtId");
        //Response.Redirect("proDetail.aspx?pid=" + tId.Text);
            Response.Redirect("Create.aspx?pId=" + tId.Text);
    }
}