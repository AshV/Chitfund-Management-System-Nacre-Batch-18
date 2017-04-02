using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using MySql.Data.MySqlClient;
using MySql.Data;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Configuration;
using BALChitFundManagementSystem.BE;
using BALChitFundManagementSystem.BL;
public partial class CustEnquiry : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                GetState();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
      
    }
    public void GetState()
    {
        try
        {
            BLRegistration b = new BLRegistration();
            ddlState.DataSource = b.GetStates();
            ddlState.Items.Add("select state..");
            ddlState.DataTextField = "state";
            ddlState.DataValueField = "stateId";

            ddlState.DataBind();
            ddlState.Items.Insert(0, new ListItem("--Select State--", ""));
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
            BE_State c = new BE_State();
            c.StateId = int.Parse(ddlState.SelectedItem.Value);
            BLRegistration b = new BLRegistration();



            ddlCity.DataSource = b.GetCity(c);
            ddlCity.DataTextField = "city";
            ddlCity.DataValueField = "cityId";
            ddlCity.DataBind();
            ddlCity.Items.Insert(0, new ListItem("--Select City--", ""));
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {

            BLRegistration b = new BLRegistration();
            BE_Address a = new BE_Address();
            a.Area = txtArea.Text;
            a.HouseNo = txtHouseNo.Text;
            a.Street = txtStreet.Text;
            a.CityId = int.Parse(ddlCity.SelectedItem.Value);
            a.Zip = int.Parse(txtZip.Text);
            BE_Customer c = new BE_Customer();
            c.CustomerName = txtCustomerName.Text;
            c.DOB = txtDob.Text;

            c.DOJ = DateTime.Today.ToString("yyyy/MM/dd");
            c.MobileNo = txtMobileNo.Text;
            c.AlternateMobileNo = txtAlternateNo.Text;
            c.Spouse = txtSpouse.Text;
            c.EmailId = txtEmailId.Text;
            c.ContactPerson = txtContactPerson.Text;
            b.InsertCustomer(c, a);
            Response.Write("<script> alert('Successfully record added.....)</script>");
            Response.Redirect("http://localhost:5294/Home.aspx");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        
        }
    }
}