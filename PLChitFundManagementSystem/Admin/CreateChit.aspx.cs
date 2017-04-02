using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BALChitFundManagementSystem.BE;
using BALChitFundManagementSystem.BL;


public partial class Admin_CreateChit : System.Web.UI.Page
{
    Byte[] bytes = null;
    BLMangeChit objManageChit = new BLMangeChit();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDropDownData();

        }

    }

    public void FillDropDownData()
    {
        try
        {
            ddlGetDocumentProof.DataSource = objManageChit.GetDocProofType();
            ddlGetDocumentProof.DataTextField = "documentName";
            ddlGetDocumentProof.DataValueField = "documentproofId";
            ddlGetDocumentProof.DataBind();
            ddlGetDocumentProof.Items.Insert(0, new ListItem("--selectdocument--", "0"));

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }



    protected void btnChitCreationSubmit_Click(object sender, EventArgs e)
    {
        try
        {

//Byte[] documents = docFileUpload.FileBytes;


            BE_Chit objBE = new BE_Chit()
            {
                ChitName = txtChitGroupName.Text,
                ChitValue = Convert.ToDouble(txtChitValue.Text),
                NoOfMonths = Convert.ToInt32(txtNoOfMonths.Text),
                TotalNoOfCustomers = Convert.ToInt32(txtTotalChitMembers.Text),
                ChitGroupStartDate = txtStartDate.Text,
                chitGroupEndDate = txtChitEndDate.Text,
                chitGroupAuctionDay = txtAuctionDay.Text,
                PreviousSanctionNumber = txtPSNo.Text,
                PreviousSanctionDate = txtPSDate.Text,
                CCBNumber = Convert.ToString(txtCCBNo.Text),
                CCBDate = txtCCBDate.Text,
                Summary = txtSummary.Text,
                RegistrationNumber = txtChitRegistrationNo.Text,
                Status = 0,
                UserId = Convert.ToInt32(HttpContext.Current.User.Identity.Name)

            };
            objManageChit.CreateChit(objBE);
            try
            {
                BE_ChitdocumentproofId obj = new BE_ChitdocumentproofId();
                HttpFileCollection files = Request.Files;
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile file = files[i];
                    if (file.ContentLength > 0)
                    {

                         obj.DocumentProofId = Convert.ToInt32(ddlGetDocumentProof.SelectedValue);

                        obj.Description = "sdsdd";

                        int length = file.ContentLength;
                        byte[] imagearray = new byte[length];
                        obj.Document = imagearray;
                       // BLMangeChit objm = new BLMangeChit();
                        objManageChit.UploadDocuments(obj);
                    }
                }
            }
               
            catch
            {
                Label1.Text = " Record Insertion Faild";
            }

            Label1.Text = "Successfully Inserted";
            Label1.ForeColor = System.Drawing.Color.Green;
            txtChitGroupName.Text = "";
            txtChitValue.Text = "";
            txtNoOfMonths.Text = "";
            txtTotalChitMembers.Text = "";
            txtStartDate.Text = "";
            txtChitEndDate.Text = "";
            txtCCBDate.Text = "";
            txtCCBNo.Text = "";
            txtPSDate.Text = "";
            txtPSNo.Text = "";
            txtSummary.Text = "";
            txtChitRegistrationNo.Text = "";
            txtAuctionDay.Text = "";
        }
        catch
        {
            Label1.Text = " Record Insertion Faild";
            Label1.ForeColor = System.Drawing.Color.Red;
        }

    }


    protected void ddlGetDocumentProof_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnClearn_Click(object sender, EventArgs e)
    {
        txtChitGroupName.Text = "";
        txtChitValue.Text = "";
        txtNoOfMonths.Text = "";
        txtTotalChitMembers.Text = "";
        txtStartDate.Text = "";
        txtChitEndDate.Text = "";
        txtCCBDate.Text = "";
        txtCCBNo.Text = "";
        txtPSDate.Text = "";
        txtPSNo.Text = "";
        txtSummary.Text = "";
        txtChitRegistrationNo.Text = "";
        //   rbtnChitStatus.SelectedValue = "";
        txtAuctionDay.Text = "";
    }
    protected void txtChitGroupName_TextChanged(object sender, EventArgs e)
    {

    }
}
