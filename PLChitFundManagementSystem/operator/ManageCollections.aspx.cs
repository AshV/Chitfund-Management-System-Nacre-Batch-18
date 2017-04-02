using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using MySql.Data.MySqlClient;

using System.Data;
using System.Configuration;
using System.Web.Services;
using BALChitFundManagementSystem.BE;
using BALChitFundManagementSystem.BL;

public partial class operator_ManageCollections : System.Web.UI.Page
{

    BLSubscriber objBLSubscriber = new BLSubscriber();
    MySqlDataReader dr;
    MonthlyInstallment objMonthlyInstallment = new MonthlyInstallment();
    bool flag = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
                BLSubscriber objBLSubscriber = new BLSubscriber();
                ddlBank.DataSource = objBLSubscriber.GetBankName();

                ddlBank.DataTextField = "bankName";
                ddlBank.DataValueField = "bankId";
                ddlBank.DataBind();
                ddlBank.Items.Insert(0, new ListItem("Select Bank", "0"));

            }
            if (rbtCheque.Checked)
            {
                pn1.Visible = true;
            }
            else if (rbtCash.Checked)
            {
                pn1.Visible = false;
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        
        }

    }

    protected void GetChits()
    {
        try
        {
             BE_Customer  c = new BE_Customer ();
        c.CustomerId = int.Parse(txtCustomerId.Text);
        BLSubscriber b = new BLSubscriber();
        GridView1.DataSource = b.GetCustomer(c);
        GridView1.DataBind();
        lblMessage.Visible = true;
        DataTable dt = objBLSubscriber.GetBalance(c);
        lblBalance.Text = dt.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            
            ClientScript.RegisterStartupScript(Page.GetType(), "alert message", "<script language='javascript'>alert(' check Customer ID ..')</script>");
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            flag = true;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridView gv = (GridView)e.Row.Cells[3].FindControl("GridView2");
                int chitId = Convert.ToInt32(e.Row.Cells[0].Text);
                gv.DataSource = objBLSubscriber.ChitInstallments(Convert.ToInt32(txtCustomerId.Text), chitId);

                gv.DataBind();
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        
        }
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button btn = (Button)e.Row.Cells[6].FindControl("btnPay");
                int due = Convert.ToInt32(e.Row.Cells[5].Text);
                if (due == 0)
                {
                    btn.Enabled = false;
                    btn.Text = "Paid";
                }
                else
                {
                    if (flag == true && due != 0)
                    {

                        flag = false;
                        btn.Enabled = true;
                        btn.Text = "Pay";
                    }
                    else if (!flag)
                    {
                        btn.Text = "Pay";
                        btn.Enabled = false;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        
        }
    }
    protected void btnPay_Click(object sender, EventArgs e)
    {

    }
    protected void ddlBank_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int bankId = Convert.ToInt32(ddlBank.SelectedValue);
            ddlBranch.DataSource = objBLSubscriber.Getbranch(bankId);
            ddlBranch.DataTextField = "branchName";
            ddlBranch.DataValueField = "branchId";
            ddlBranch.DataBind();
            ddlBranch.Items.Insert(0, new ListItem("BRANCH", "0"));
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        
        }
    }

    protected void btnAddCollection_Click(object sender, EventArgs e)
    {
        try
        {
            if (rbtCheque.Checked)
            {

                BE_Customer objCustomer = new BE_Customer();
                int userID = Convert.ToInt32(HttpContext.Current.User.Identity.Name);
                objCustomer.CustomerId = Convert.ToInt32(txtCustomerId.Text);
                objCustomer.receiptNumber = txt_rcptNo.Text;
                objCustomer.dateOfPayment = TxtDate.Text;
                objCustomer.amountCollected = Convert.ToInt32(txtAmount.Text);
                objCustomer.dateOfEntry = Convert.ToDateTime(DateTime.Now).ToString("yyyy/MM/dd");
                objCustomer.checkNumber = Convert.ToInt32(txtCheckNo.Text);
                objCustomer.branchId = Convert.ToInt32(ddlBranch.SelectedValue);
                objCustomer.DOIssue = txtIssuedt.Text;
                objCustomer.validUpTo = txtValidUpto.Text;

                BLSubscriber b = new BLSubscriber();
                b.insertCollectionByCheck(objCustomer, userID);
                //lblmessage1.Visible = false;
                //lblmessage2.Visible = true;
                ClientScript.RegisterStartupScript(Page.GetType(), "alert message", "<script language='javascript'>alert('Amount Adeed to Collection sucessfully By Cheque')</script>");

            }



            if (rbtCash.Checked)
            {

                BE_Customer objCustomer = new BE_Customer();
                // int userID = Convert.ToInt32(Session["UserId"]);
                int userID = 10;
                objCustomer.CustomerId = Convert.ToInt32(txtCustomerId.Text);
                objCustomer.receiptNumber = txt_rcptNo.Text;
                objCustomer.dateOfPayment = TxtDate.Text;
                objCustomer.amountCollected = Convert.ToInt32(txtAmount.Text);
                objCustomer.dateOfEntry = Convert.ToDateTime(DateTime.Now).ToString("yyyy/MM/dd");

                BLSubscriber b = new BLSubscriber();
                b.insertCollectionByCash(objCustomer, userID);
                //lblmessage2.Visible = false;
                //lblmessage1.Visible = true;
                ClientScript.RegisterStartupScript(Page.GetType(), "alert message", "<script language='javascript'>alert('Amount Adeed to Collection sucessfully By Cash')</script>");

                txt_rcptNo.Text = "";
                TxtDate.Text = "";
                txtAmount.Text = "";

                txtCheckNo.Text = "";
                txtIssuedt.Text = "";
                txtValidUpto.Text = "";
            }
        }
        
             catch(Exception ex)
        {
                   Response.Write("<script>alert('" + ex.Message + "')</script>");
        
            
        }
    }

    protected void btnShowDetails_Click(object sender, EventArgs e)
    {
        GetChits();

    }



    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            if (e.CommandName == "Pay")
            {

                GridViewRow gvr = ((GridViewRow)((GridViewRow)e.CommandSource).Parent.Parent.NamingContainer);
                int chitId = Convert.ToInt32(gvr.Cells[0].Text.ToString());
                int CustomerId = Convert.ToInt32(txtCustomerId.Text);
                BE_Customer c = new BE_Customer();
                c.CustomerId = CustomerId;
                if (objMonthlyInstallment.due <= Convert.ToInt32(lblBalance.Text))
                {
                    objBLSubscriber.PayForChit(c, objMonthlyInstallment, chitId);
                    GetChits();

                    ClientScript.RegisterStartupScript(Page.GetType(), "alert message", "<script language='javascript'>alert('" + CustomerId + " Payment is updated..')</script>");
                }
                ClientScript.RegisterStartupScript(Page.GetType(), "alert message", "<script language='javascript'>alert('" + CustomerId + " have no enough balance..')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            GridViewRow gvr = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            string date = gvr.Cells[0].Text.ToString();
            decimal due = Convert.ToDecimal(gvr.Cells[5].Text);
            objMonthlyInstallment.date = Convert.ToDateTime(date);
            objMonthlyInstallment.due = due;
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    protected void btnPay_Command(object sender, CommandEventArgs e)
    {

    }
  
}