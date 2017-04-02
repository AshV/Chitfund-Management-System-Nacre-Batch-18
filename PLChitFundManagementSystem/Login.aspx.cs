using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql;
using MySql.Data.MySqlClient;
using MySql.Data;
using BALChitFundManagementSystem.BE;
using BALChitFundManagementSystem.BL;
using System.Web.Security;
using System.Configuration;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void lbnForget_Click1(object sender, EventArgs e)
    {

        this.mpe1.Show();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BE_Login BAL_BE_obj = new BE_Login()
        {
            LoginId = txtEmailId.Text,
            Password = txtPassword.Text
        };
      
        BLRegistration BAL_BL_obj = new BLRegistration();
        BE_Names BAL_BE_objNames = BAL_BL_obj.authentication(BAL_BE_obj);
        var rolename = (BAL_BE_objNames.RoleName);
        Session["rolename"] = rolename;
        if (BAL_BE_objNames.UserName == "0")
            lblError.Text = "Invalid LoginId or Password";
            
        else
        {
            Session["UserFirstName"] = BAL_BE_objNames.UserName;
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, BAL_BE_objNames.userId.ToString(), DateTime.Now, DateTime.Now.AddMinutes(10), CheckBox1.Checked, BAL_BE_objNames.RoleName, FormsAuthentication.FormsCookiePath);
            string hash = FormsAuthentication.Encrypt(ticket);
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);

            if (ticket.IsPersistent)
            {
                cookie.Expires = ticket.Expiration;
            }
            Response.Cookies.Add(cookie);
            Response.Redirect(FormsAuthentication.GetRedirectUrl(txtEmailId.Text, CheckBox1.Checked));
        }

    }

    protected void btnGetPassword_Click(object sender, EventArgs e)
    {
        BE_User objUser = new BE_User()
        {
            LoginId = txtOldEmailId.Text,
            SecurityQuestionId = Convert.ToInt32(ddlQuestions.SelectedValue),
            //SecurityQuestionId = Convert.ToInt32(ddlQuestions.SelectedIndex) + 1,
            SecurityAnswer = txtAnswer.Text,
        };
        BLRegistration objLogin = new BLRegistration();
        BE_Login objLog = objLogin.ForgetPassword(objUser);
        if (objLog.Password == "1")
        {
            this.mpe1.Show();
            lblPassword.Text = "Give correct answer";
        }
        else
        {
            this.mpe1.Show();
            lblPassword.Text = "Your Password is :" + objLog.Password;
        }
    }
}