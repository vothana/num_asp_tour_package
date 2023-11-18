using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_Footer : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool IsAuthenticated = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
        if (IsAuthenticated)
        {
            clientSide.InnerText = "Client Side";
            clientSide.HRef = "~\\User\\Index.aspx";

            createBtn.InnerText = "Create";
            createBtn.HRef ="~\\Admin\\Create.aspx";

            logOutBtn.InnerText = "Logout";
            logOutBtn.HRef = "~\\Admin\\Login.aspx";
        }
    }

    protected void clickLogout(object sender, EventArgs e)
    {
        if (logOutBtn.InnerText == "Logout")
        {
            Session.Clear();
            clientSide.InnerText = "Awards";
            clientSide.HRef = "#";

            createBtn.InnerText = "Home";
            createBtn.HRef = "#";

            logOutBtn.InnerText = "Login";
            logOutBtn.HRef = "~\\Admin\\Login.aspx";
            Response.Redirect("~\\Admin\\Login.aspx");
        }
        else
        {
            Response.Redirect("~\\Admin\\Login.aspx");
        }
    }
}