using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BALChitFundManagementSystem.BE;
using BALChitFundManagementSystem.BL;
using System.Data;
using System.Text;
public partial class Admin_UpdateChit : System.Web.UI.Page
{
    BLMangeChit objBlChit=new BLMangeChit();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    protected void BindGrid()
    {
        try
        {
            GridView1.DataSource = objBlChit.GetChitDetails(0);
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("ShowPopup"))
            {
                LinkButton btndetails = (LinkButton)e.CommandSource;
                GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
                txtChitId.Text = GridView1.DataKeys[gvrow.RowIndex].Value.ToString();
                txtChitName.Text = gvrow.Cells[1].Text;
                txtnoOfMonths.Text = gvrow.Cells[2].Text;
                txtnoOfCustomer.Text = gvrow.Cells[3].Text;
                txtchitValue.Text = gvrow.Cells[4].Text;
                txtchitGroupStartDate.Text = gvrow.Cells[5].Text;
                txtchitGroupEndDate.Text = gvrow.Cells[6].Text;
                txtchitGroupAuctionDay.Text = gvrow.Cells[7].Text;
                txtpreviousSanctionNumber.Text = gvrow.Cells[8].Text;
                txtpreviousSanctionDate.Text = gvrow.Cells[9].Text;
                txtCCBNumber.Text = gvrow.Cells[10].Text;
                txtCCBDate.Text = gvrow.Cells[11].Text;
                txtsummary.Text = gvrow.Cells[12].Text;
                txtregistrationNumber.Text = gvrow.Cells[13].Text;
                txtActiveMembers.Text = objBlChit.GetChitMembers(Convert.ToInt32(txtChitId.Text)).ToString();
                int i = Convert.ToInt16(gvrow.Cells[14].Text);
                if (i == 0)
                    rbStatusD.Checked = true;
                else
                    rbStatusA.Checked = true;
                txtuserId.Text = gvrow.Cells[15].Text;
                //ScriptManager.RegisterStartupScript(this, GetType(), "Popup Edit", "ShowPopup();", true);
                Popup(true);
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    void Popup(bool isDisplay)
    {
        try
        {
            StringBuilder builder = new StringBuilder();
            if (isDisplay)
            {
                builder.Append("<script language=JavaScript> ShowPopup(); </script>\n");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowPopup", "ShowPopup();", true);
            }
            else
            {
                builder.Append("<script language=JavaScript> HidePopup(); </script>\n");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "HidePopup", builder.ToString(), true);
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            BE_Chit objChit = new BE_Chit();
            if (rbStatusA.Checked == true)
            {
                DateTime startDate = Convert.ToDateTime(txtchitGroupStartDate.Text);
                DataTable dt = objBlChit.subscriberdocid(Convert.ToInt32(txtChitId.Text));
                DateTime date = new DateTime(startDate.Year, startDate.Month, 01);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    objBlChit.CreateFirstInstallment(Convert.ToInt32(dt.Rows[i][0].ToString()), Convert.ToInt32(txtchitValue.Text) / Convert.ToInt32(txtnoOfCustomer.Text), date);
                }
            }
            objChit.ChitId = Convert.ToInt32(txtChitId.Text);
            objChit.ChitName = txtChitName.Text;
            objChit.NoOfMonths = Convert.ToInt32(txtnoOfMonths.Text);
            objChit.TotalNoOfCustomers = Convert.ToInt32(txtnoOfCustomer.Text);
            objChit.ChitValue = Convert.ToDouble(txtchitValue.Text);
            objChit.ChitGroupStartDate = txtchitGroupStartDate.Text;
            objChit.chitGroupEndDate = txtchitGroupEndDate.Text;
            objChit.chitGroupAuctionDay = txtchitGroupAuctionDay.Text;
            objChit.PreviousSanctionNumber = txtpreviousSanctionNumber.Text;
            objChit.PreviousSanctionDate = txtpreviousSanctionDate.Text;
            objChit.CCBNumber = txtCCBNumber.Text;
            objChit.CCBDate = txtCCBDate.Text;
            objChit.Summary = txtsummary.Text;
            objChit.RegistrationNumber = txtregistrationNumber.Text;
            if (rbStatusD.Checked)
                objChit.Status = 0;
            else
                objChit.Status = 1;

            objBlChit.UpdateChit(objChit);
            Popup(false);
            BindGrid();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }



    }
