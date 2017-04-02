using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BALChitFundManagementSystem.BE;
using BALChitFundManagementSystem.BL;


public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            BLRegistration objLogin = new BLRegistration();
            BE_Login objLog = new BE_Login()
            {
                LoginId = Page.User.Identity.Name,
                OldPassword = txtOldPassword.Text,
                Password = txtNewPassword.Text,
            };
            lblMessage.Text = objLogin.ChangePassword(objLog);

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
}