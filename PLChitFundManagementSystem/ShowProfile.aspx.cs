using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BALChitFundManagementSystem.BE;
using BALChitFundManagementSystem.BL;
using MySql.Data.MySqlClient;
public partial class ShowProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            GetDetails();

    }
     void GetDetails()
    {
        try
        {
            BE_User objUser = new BE_User()
            {
                UserId = Convert.ToInt32(HttpContext.Current.User.Identity.Name)
            };
            BLRegistration objRegistration = new BLRegistration();
            MySql.Data.MySqlClient.MySqlDataReader dr = objRegistration.GetUserProfileById(objUser);
            dr.Read();
            if (dr[0].ToString() == "")
            {
                ImgMsg.Visible = true;
                Image1.Visible = false;
                ImgMsg.Text = "No image available";
            }
            else
            {
                ImgMsg.Visible = false;
                Image1.Visible = true;
                Image1.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr[0]);
            }
            txtFName.Text = dr[1].ToString();
            txtMName.Text = dr[2].ToString();
            txtLName.Text = dr[3].ToString();
            txtMobileNo.Text = dr[4].ToString();
            txtAddress.Text = dr[5].ToString();
            txtArea.Text = dr[6].ToString();
            txtStreet.Text = dr[7].ToString();
            txtZip.Text = dr[8].ToString();
            txtCity.Text = dr[9].ToString();
            txtState.Text = dr[10].ToString();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }

    
    protected void btnchange_Click(object sender, EventArgs e)
    {
        try
        {
            BE_User objUser = new BE_User()
             {
                 UserId = Convert.ToInt32(User.Identity.Name),
                 FirstName = txtFName.Text,
                 MiddleName = txtMName.Text,
                 LastName = txtLName.Text,
                 MobileNo = txtMobileNo.Text,
                 Image = FileUpload1.FileBytes,
             };
            BE_Address objAddress = new BE_Address()
            {
                HouseNo = txtAddress.Text,
                Area = txtArea.Text,
                Street = txtStreet.Text,
                Zip = Convert.ToInt32(txtZip.Text)
            };
            BE_City objCity = new BE_City()
            {
                CityName = txtCity.Text
            };
            BE_State objState = new BE_State()
            {
                StateName = txtState.Text
            };
            BLRegistration objRegistration = new BLRegistration();
            Label1.Text = objRegistration.UpdateUserProfile(objUser, objAddress, objCity, objState);

            GetDetails();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
}
}
