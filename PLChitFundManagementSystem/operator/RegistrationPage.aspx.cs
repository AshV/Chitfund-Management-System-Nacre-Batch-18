using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BALChitFundManagementSystem.BE;
using BALChitFundManagementSystem.BL;
using System.Data.Linq;
using System.Web.Services;
using MySql.Data.MySqlClient;
public partial class RegistrationPage : System.Web.UI.Page
{
    BLSubscriber objBLSubscriber = new BLSubscriber();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
                BLMangeChit objBLSubscriber = new BLMangeChit();
                ddlUserTypeId.DataSource = objBLSubscriber.GetRole();

                ddlUserTypeId.DataTextField = "typeName";
                ddlUserTypeId.DataValueField = "userTypeId";
                ddlUserTypeId.DataBind();
                ddlUserTypeId.Items.Insert(0, new ListItem("Select User Type", "0"));

            }
            //  var rolename = Session["rolename"].ToString();
            var rolename = "operator";
            if (rolename == "operator")
            {
                ddlUserTypeId.Items.Remove("Admin");
            }

            // ddl1.Items.FindByText("Item1").Enabled = false;

            BLRegistration BAL_BL_obj = new BLRegistration();
            if (!Page.IsPostBack)
            {
                MySqlDataReader dr = objBLSubscriber.GetStateName();

                ddlState.DataSource = dr;

                ddlState.DataTextField = "state";
                ddlState.DataValueField = "stateId";
                ddlState.DataBind();
                ddlState.Items.Insert(0, new ListItem("Select state", "0"));

            }
            //ddlSecurityQuestion.DataSource = BAL_BL_obj.GetQuestions();
            //ddlSecurityQuestion.DataTextField = "question";
            //ddlSecurityQuestion.DataValueField = "questionId";
            //ddlSecurityQuestion.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            #region
            //string Output = string.Empty;
            //if (txtPassword.Text == txtConfirmNewPassword.Text)
            //{
            //    BE_User objUserBEL = new BE_User();

            //    objUserBEL.FirstName = txtFirstName.Text;
            //    objUserBEL.MiddleName = txtMiddleName.Text;
            //    objUserBEL.LastName = txtLastName.Text;
            //    objUserBEL.MobileNo = txtMobileNo.Text;
            //    objUserBEL.LoginId = txtLoginId.Text;
            //    objUserBEL.Password = txtPassword.Text;
            //    //objUserBEL.Gender = Convert.ToByte(ddlGender.SelectedItem.ToString());
            //    objUserBEL.Dob = Convert.ToDateTime(txtDOB.Text);
            //    objUserBEL.DoJ = Convert.ToDateTime(txtDOJ.Text);
            //    objUserBEL.UsertypeId = Convert.ToInt32(ddlUserTypeId.SelectedItem.ToString());
            //    objUserBEL.AddressId = Convert.ToInt32(txtAddressId.Text);
            //    objUserBEL.SecurityQuestionId = Convert.ToInt32(txtSecurityQuestionId.Text);
            //    objUserBEL.SecurityAnswer = ddlSecurityAnswer.SelectedItem.ToString();
            //    //objUserBEL.Image=Convert.ToByte[](FileUpload1.ToString());
            //    BL_User objUserBAL = new BL_User();
            //   int  i = objUserBAL.InsertUser(objUserBEL);
            //   if (i > 0)
            //   {
            //       Label1.Text = "Data inserted successfully";
            //   }
            //}

            //else
            //{
            //    Page.RegisterStartupScript("UserMsg", "<Script language='javascript'>alert('" + "Password mismatch" + "');</script>");
            //}
            #endregion
            //Byte[] data = FileUpload1.FileBytes;
            //Binary bin = new Binary(data);
            BE_Address objAddress = new BE_Address();
            BE_City objCity = new BE_City();
            // BE_State objState = new BE_State();

            BE_User objUser = new BE_User()
            {

                FirstName = txtFirstName.Text,
                MiddleName = txtMiddleName.Text,
                LastName = txtLastName.Text,
                MobileNo = txtMobileNo.Text,
                LoginId = txtLoginId.Text,
                Password = txtPassword.Text,
                Gender = Convert.ToBoolean(Convert.ToInt32(ddlGender.SelectedValue)),
                //Gender = true,
                DOB = txtDOB.Text,

                UserTypeId = Convert.ToInt32(ddlUserTypeId.SelectedValue),
                //    AddressId = Convert.ToInt32(txtAddressId.Text),
                SecurityQuestionId = Convert.ToInt32(ddlSecurityQuestion.SelectedValue) + 1,
                SecurityAnswer = txtSecurityAnswer.Text,
                Image = FileUpload1.FileBytes
            };

            objCity.CityId = Convert.ToInt32(ddlCity.SelectedValue);
            objAddress.Area = txtArea.Text.ToString();
            objAddress.HouseNo = txtAddress.Text.ToString();
            objAddress.Street = txtStreet.Text.ToString();
            objAddress.Zip = Convert.ToInt32(txtZip.Text);
            BLRegistration objLogin = new BLRegistration();
            objLogin.RegisterAddress(objCity, objAddress);
            objLogin.UserRegistration(objUser);
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            txtFirstName.Text = txtLastName.Text = txtLoginId.Text = txtMiddleName.Text = txtMobileNo.Text = txtPassword.Text = txtSecurityAnswer.Text = txtAddress.Text = txtConfirmNewPassword.Text = txtDOB.Text = "";
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            BE_State objState = new BE_State();

            int stateId = Convert.ToInt32(ddlState.SelectedValue);
            objState.StateId = stateId;
            MySqlDataReader dr = objBLSubscriber.GetCity(objState);

            ddlCity.DataSource = dr;
            ddlCity.DataTextField = "city";
            ddlCity.DataValueField = "cityId";
            ddlCity.DataBind();
            ddlCity.Items.Insert(0, new ListItem("City", "0"));

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    protected void txtConfirmNewPassword_TextChanged(object sender, EventArgs e)
    {

    }
}

