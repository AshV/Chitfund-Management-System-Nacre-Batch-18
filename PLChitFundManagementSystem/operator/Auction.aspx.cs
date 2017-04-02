using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BAL.BL;
using MySql.Data.MySqlClient;
public partial class operator_Auction : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    BLAuction bobj = new BLAuction();

    protected void Page_Load(object sender, EventArgs e)
    {
        try{
        Session["User"] = User.Identity.Name;

        if (!IsPostBack)
        {
           
                dt = bobj.GetChitName();
                ddlChitName.DataSource = dt;
                ddlChitName.DataTextField = "chitName";
                ddlChitName.DataValueField = "chitId";
                ddlChitName.DataBind();
                ddlChitName.Items.Insert(0, new ListItem("--Select--", "0"));
                dt.Clear();
            }
        }
            catch (MySqlException ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        
    }
    
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
    protected void ddlChitName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            lblMessage.Text = "";
            int chitId = Convert.ToInt32(ddlChitName.SelectedValue);
           
            dt = bobj.getcustomerId(chitId);
            ddlSubName.DataSource = dt;
            ddlSubName.DataTextField = "customerName";
            ddlSubName.DataValueField = "customerId";
            ddlSubName.DataBind();
            ddlSubName.Items.Insert(0, new ListItem("--Select--", "0"));
            dt.Clear();
            dt = bobj.auctionNo(chitId);
            txtAuctionNo.Text = (dt.Rows[0][0].ToString());

            int chitId1 = Convert.ToInt32(ddlChitName.SelectedValue.ToString());
            dt = bobj.chitValue(chitId1);// getting total Amount
            HiddenField1.Value = dt.Rows[0][1].ToString();// No ofr cust;
            double chitvalue = Convert.ToDouble(dt.Rows[0][0].ToString());// chit value
            txtTotalAmount.Text = chitvalue.ToString();
        }
        catch (MySqlException ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }

    }
    protected void ddlSubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtCustId.Text = ddlSubName.SelectedValue;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            dt.Clear();
            double paidamount = Convert.ToDouble(txtBiddingAmount.Text);
            double divident = Convert.ToDouble(txtDividend.Text);
            DateTime auctiondate = Convert.ToDateTime(txtDate.Text);
            double companyprofit = Convert.ToDouble(txtCommision.Text);
            int auctionno = Convert.ToInt32(txtAuctionNo.Text);
            int chitid2 = Convert.ToInt32(ddlChitName.SelectedValue.ToString());
            int customerid = Convert.ToInt32(ddlSubName.SelectedValue.ToString());
            int row = bobj.insertData(paidamount, divident, auctiondate, companyprofit, auctionno, chitid2, customerid);

            //inserting data into tbl_monthlypaiment

            dt = bobj.subscriberdocid(chitid2);
            int count = dt.Rows.Count, rows = 0;

            auctiondate = auctiondate.AddMonths(1);
            int month = auctiondate.Month;
            int year = auctiondate.Year;
            DateTime date = new DateTime(year, month, 01);
            for (int i = 0; i < count; i++)
            {
                int j = bobj.insertMonthlypayment(Convert.ToInt32(dt.Rows[i][0].ToString()), Convert.ToDouble(txtAmountPay.Text), date);
                rows = rows + j;
            }
            if (row > 0 && rows == count)
            {
                lblMessage.Text = "Auction Details are Added Sucessfully....";
                ClearFields(Form.Controls);
            }
            else
                lblMessage.Text = "Auction Details filed to add...";
        }
        catch (MySqlException ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }
         public static void ClearFields(ControlCollection pageControls)
    {
        try
        {
            foreach (Control contl in pageControls)
            {
                string strCntName = (contl.GetType()).Name;
                switch (strCntName)
                {
                    case "TextBox":
                        TextBox tbSource = (TextBox)contl;
                        tbSource.Text = "";
                        break;
                    case "DropDownList":
                        DropDownList ddlSource = (DropDownList)contl;
                        ddlSource.SelectedIndex = -1;
                        break;
                }
                ClearFields(contl.Controls);
            }
        }
        catch (Exception ex)
        {
            throw ex;
           
        }
          }
    }