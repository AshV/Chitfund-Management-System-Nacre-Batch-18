using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BALChitFundManagementSystem.BE;
using BALChitFundManagementSystem.BL;

public partial class ChitFund : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (HttpContext.Current.User.Identity.IsAuthenticated && Session["UserFirstName"] != null)
        {
            lblUser.Text = Session["UserFirstName"].ToString();
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    protected void lbnLogut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("~/Login.aspx");
    }
}
