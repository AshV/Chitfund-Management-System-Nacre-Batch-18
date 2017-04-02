using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BALChitFundManagementSystem.BL;
using BALChitFundManagementSystem.BE;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web.Services;
public partial class SubRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                BindStates();
                BindAddressProof();
                BindIdProof();
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    public void BindStates()
    {
        try
        {
            BLRegistration b = new BLRegistration();
            DropDownList4.DataSource = b.GetStates();
            DropDownList4.DataTextField = "state";
            DropDownList4.DataValueField = "stateId";
            DropDownList4.DataBind();
            DropDownList4.Items.Insert(0, new ListItem("--Select--", ""));
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    public void BindAddressProof()
    {
        try
        {
            BLRegistration b = new BLRegistration();
            DropDownList2.DataSource = b.GetAddressProofIdName();
            DropDownList2.DataTextField = "addressProofName";
            DropDownList2.DataValueField = "addressProofId";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, new ListItem("--Select--", ""));
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    public void BindIdProof()
    {
        try
        {
            BLRegistration b = new BLRegistration();
            DropDownList3.DataSource = b.GetIdProofData();
            DropDownList3.DataTextField = "idProofName";
            DropDownList3.DataValueField = "idProofId";
            DropDownList3.DataBind();
            DropDownList3.Items.Insert(0, new ListItem("--Select--", ""));
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        try
        {
            BE_Customer cust = new BE_Customer();
            BE_City objCity = new BE_City();
            BE_IdProofType objIdProofType = new BE_IdProofType();
            BE_CustomerIdProof objCustomerIdProof = new BE_CustomerIdProof();
            cust.CustomerName = txtName.Text;
            cust.DOB = Convert.ToDateTime(txtDob.Text).ToString("yyyy/MM/dd");
            cust.DOJ = DateTime.Today.ToString("yyyy/MM/dd");
            cust.MobileNo = txtMobileNo.Text;
            cust.AlternateMobileNo = txtAlternateNo.Text;
            cust.Spouse = txtSpouse.Text;
            cust.EmailId = txtEmailId.Text;
            cust.ContactPerson = txtContactPerson.Text;
            cust.Area = txtArea.Text;
            cust.Houseno = txtHouseNo.Text;
            cust.Street = txtStreet.Text;
            cust.ZipNo = int.Parse(txtZip.Text);
            cust.PStateID = int.Parse(DropDownList4.SelectedItem.Value);
            cust.StateName = DropDownList4.SelectedItem.Text;
            objCity.CityId = int.Parse(DropDownList5.SelectedItem.Value);
            objCity.CityName = DropDownList5.SelectedItem.Text;
            objIdProofType.IdProofId = int.Parse(DropDownList3.SelectedItem.Value);
            objIdProofType.IdProofName = DropDownList3.SelectedItem.Text;
            objCustomerIdProof.AddressProofId = int.Parse(DropDownList2.SelectedItem.Value);
            objCustomerIdProof.AddressProofName = DropDownList2.SelectedItem.Text;

            //Take frm session
            cust.UserID = 10;
            if (fucIdProofType.HasFile)
                objIdProofType.IdProofDoc = fucIdProofType.FileBytes;
            else
            {
                Response.Write("<script>alert('Select Id Proof Document')</script>");
                return;
            }

            if (fucAddressProofType.HasFile)
                objCustomerIdProof.AddressProofDoc = fucAddressProofType.FileBytes;
            else
            {
                Response.Write("<script>alert('Select Address Proof Document')</script>");
                return;
            }

            if (fucPhoto.HasFile)
                cust.Imgage = fucPhoto.FileBytes;
            else
            {
                Response.Write("<script>alert('Select Address Proof Document')</script>");
                return;
            }
            if (RadioButton1.Checked == true)
            {

                //COpy same as enquiry form to insert new record in 
                //And inser photo and document in subscriber, customerIdProof, customerAddrProof with newly added customer Id
                BLRegistration b = new BLRegistration();
                if (b.insertNewCustomer(cust, objIdProofType, objCustomerIdProof, objCity) > 0)
                    Response.Write("<script>alert('Record Added')</script>");
                else
                    Response.Write("<script>alert('Failed')</script>");
            }
            else if (RadioButton2.Checked == true)
            {
                cust.AddressId = (txtAddressId.Text).ToString();
                cust.CustomerId = int.Parse(txtCustomerId.Text);
                BLRegistration b = new BLRegistration();
                if (b.UpdateNewCustomer(cust, objIdProofType, objCustomerIdProof, objCity) > 0)
                    Response.Write("<script>alert('Record Updated')</script>");
                else
                    Response.Write("<script>alert('Updation Failed')</script>");
                //
                //And inser photo and documents for given customer id in textbox in subscriber, customerIdProof, customerAddrProof
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {

        divCustomer.Visible = true;
    }
    
    [WebMethod]
    public static List<string> GetAutoCompleteData(string username)
    {
        try
        {
            List<string> result = new List<string>();
            BLRegistration bl = new BLRegistration();
            BE_Customer cust = new BE_Customer();
            cust.CustomerName = username;
            MySqlDataReader dr = bl.Auto(cust);
            while (dr.Read())
            {
                result.Add(string.Format("{0}/{1}", dr[1], dr[0]));
            }
            return result;
        }
        catch (Exception ex)
        {
            throw ex;
            //Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        
        try
        {
            if (txtCustomerId.Text == "")
                Response.Write("<script>alert('Enter Customer Id')</script>");
            else
            {
                BLRegistration bl = new BLRegistration();
                BE_Customer be = new BE_Customer();
                be.CustomerId = int.Parse(txtCustomerId.Text);
                MySqlDataReader dr = bl.display(be);
                //DropDownList4.DataSource = DropDownList5.DataSource = dr;
                //DropDownList4.DataTextField = "state";
                //DropDownList4.DataValueField = "stateId";
                //DropDownList4.DataBind();
                DropDownList5.DataSource = dr;
                DropDownList5.DataTextField = "city";
                DropDownList5.DataValueField = "cityId";
                DropDownList5.DataBind();
                DropDownList5.Items.Insert(0, new ListItem("--Select--", ""));
                dr.Read();
                txtName.Text = dr["customerName"].ToString();
                txtDob.Text =Convert.ToDateTime(dr["dob"].ToString()).ToString("dd-MMM-yyyy");
                txtMobileNo.Text = dr["mobileNo"].ToString();
                txtAlternateNo.Text = dr["alternateNo"].ToString();
                txtSpouse.Text = dr["spouse"].ToString();
                txtEmailId.Text = dr["emailId"].ToString();
                txtContactPerson.Text = dr["contactPerson"].ToString();
                txtAddressId.Text = dr["addressId"].ToString();
                txtArea.Text = dr["area"].ToString(); ;
                txtHouseNo.Text = dr["houseNo"].ToString(); ;
                txtStreet.Text = dr["street"].ToString(); ;
                txtZip.Text = dr["zip"].ToString(); ;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            BLRegistration b = new BLRegistration();
            BE_State st = new BE_State();
            st.StateId = int.Parse(DropDownList4.SelectedItem.Value);
            DropDownList5.DataSource = b.GetCity(st);
            DropDownList5.DataTextField = "city";
            DropDownList5.DataValueField = "cityId";
            DropDownList5.DataBind();
            DropDownList5.Items.Insert(0, new ListItem("--Select--", ""));
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        divCustomer.Visible = false;
    }
}