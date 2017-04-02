using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections.Specialized;


using System.Configuration;

using BALChitFundManagementSystem.BL;

using BALChitFundManagementSystem.BE;

public partial class Removesubscriber : System.Web.UI.Page
{
    
    BLMangeChit objBLClass = new BLMangeChit();





    //BLchit_status objblchutstatus = new BLchit_status();



    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                try
                {

                    ddlChitGrp.DataSource = objBLClass.GetChitName_statuszero();
                    ddlChitGrp.DataTextField = "chitName";
                    ddlChitGrp.DataValueField = "chitId";
                    ddlChitGrp.DataBind();

                }
                catch (Exception)
                {
                    throw;
                }

                try
                {
                    //ddlChitGrp.DataSource=objblchutstatus.
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    private void SetData()
    {
        
        BE_Chit objChit = new BE_Chit();
        // objChit.ChitId = Convert.ToInt32( ddlChitGrp.SelectedValue);

        objChit.ChitId = Convert.ToInt32(ddlChitGrp.SelectedValue);
        try
        {

            gvAvailableSubscribers.DataSource = objBLClass.getsubDetails(objChit);
            gvAvailableSubscribers.DataBind();

        }
        catch
        {
            throw;
        }
    }

    protected void ddlChitGrp_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetData();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //BE_Customer objectcustomerId = new BE_Customer();
        //foreach (GridViewRow r in gvAvailableSubscribers.Rows)

        //{




        //    CheckBox cb = (CheckBox)r.FindControl("chkboxRemove");
        //   // List<objectcustomerId> cust = new List<objectcustomerId>();
        //    string customerIds ="";

        //    if (cb.Checked &&cb!=null)

        //    {
        //        Response.Write(r.Cells[1].Text);

        //      customerIds += Convert.ToString(r.Cells[0].Text + ",");
        //    }
        //    customerIds = customerIds.Remove(customerIds.Length - 1);

        //    objBLClass.RemoveCustomer(customerIds,Convert.ToInt32(ddlChitGrp.SelectedValue));

        //}
        //SetData();

        try
        {
            StringCollection objCollection = new StringCollection();
            string s = string.Empty;
            string strId = string.Empty;
            for (int i = 0; i < gvAvailableSubscribers.Rows.Count; i++)
            {
                CheckBox cb = (CheckBox)gvAvailableSubscribers.Rows[i].Cells[0].FindControl("chkboxRemove");
                if (cb != null & cb.Checked)
                {
                    strId = gvAvailableSubscribers.DataKeys[i].Value.ToString();
                    // strId += gvShowAllGroups.DataKeys[gvrow.RowIndex].Value.ToString();
                    //strId += gvAvailableSubscribers.Rows[i].Cells[3].Text;
                    // strId = gvShowAllGroups.Rows[].Cells[1].Text;
                    s += strId + ',';
                    strId = string.Empty;
                    // objCollection.Add(s);
                }

            }
            if (s != null)
            {
                int n = s.LastIndexOf(',');
                s = s.Remove(n, 1);

                int result = objBLClass.RemoveCustomers(s);
                //  gvShowAllContacts.DataSource = objDataTable;
                //gvShowAllGroups.DataBind();
                SetData();
                //gvShowAllGroups.DataBind();
            }
            else
            {
                lblMessage.Text = "please select any row to delete";
            }

        }
        catch (Exception ex)
        {
            // lblError.Text = ex.Message;
        }


    }


    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < gvAvailableSubscribers.Rows.Count; i++)
            {
                CheckBox cb = (CheckBox)gvAvailableSubscribers.Rows[i].FindControl("chkboxRemove");

                string customerId = "";

                if (cb.Checked == false)
                {

                    customerId += Convert.ToString(gvAvailableSubscribers.Rows[i].Cells[1].Text);
                }


                objBLClass.RemoveCustomer(customerId, Convert.ToInt32(ddlChitGrp.SelectedValue));

            }
            SetData();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }

}