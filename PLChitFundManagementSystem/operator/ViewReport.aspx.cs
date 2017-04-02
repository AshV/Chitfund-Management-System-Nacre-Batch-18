using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BALChitFundManagementSystem.BE;
using BALChitFundManagementSystem.BL;
using System.Data;
using MySql.Data.MySqlClient;
using System.IO;
using System.Web.UI.HtmlControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;


public partial class ViewReport : System.Web.UI.Page
{
    BLReport obj = new BLReport();
    DataTable dt = new DataTable();
    MySqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["Report"] == "Admin")
            {

                if (Request.QueryString["By"] == "All")
                {
                    dr = obj.AdminByAll();

                }
                else if (Request.QueryString["By"] == "Id")
                {
                    BEAdmin objBEAdmin = new BEAdmin();
                    objBEAdmin.AdminId = Convert.ToInt32(Request.QueryString["Value"]);
                    dr = obj.AdminById(objBEAdmin);
                }
                if (dr.VisibleFieldCount == 0)
                    Response.Write("No Record Found");
                else
                {
                    gvShowReport.DataSource = dr;
                    gvShowReport.DataBind();
                }
            }
            else if (Request.QueryString["Report"] == "Agent")
            {
                if (Request.QueryString["By"] == "All")
                {
                    dr = obj.AgentByAll();

                }
                else if (Request.QueryString["By"] == "Id")
                {
                    BEAgent objBEAgent = new BEAgent();
                    objBEAgent.AgentId = Convert.ToInt32(Request.QueryString["Value"]);
                    dr = obj.AgentById(objBEAgent);
                }
                if (dr.VisibleFieldCount == 0)
                    Response.Write("No Record Found");
                else
                {
                    gvShowReport.DataSource = dr;
                    gvShowReport.DataBind();
                }
            }
            else if (Request.QueryString["Report"] == "Operator")
            {
                if (Request.QueryString["By"] == "All")
                    dr = obj.OperatorByAll();
                else if (Request.QueryString["By"] == "Id")
                {
                    BEOperator objBEOperator = new BEOperator();
                    objBEOperator.OperatorId = Convert.ToInt32(Request.QueryString["Value"]);
                    dr = obj.OperatorById(objBEOperator);
                }

                if (dr.VisibleFieldCount == 0)
                    Response.Write("No Record Found");
                else
                {
                    gvShowReport.DataSource = dr;
                    gvShowReport.DataBind();
                }
            }
            else if (Request.QueryString["Report"] == "Subscriber")
            {
                if (Request.QueryString["By"] == "All")
                    dt = obj.GetAllSubscibers();
                else if (Request.QueryString["By"] == "SubscriberId")
                {
                    BE_Subscriber objBESubscriber = new BE_Subscriber();
                    objBESubscriber.SubscriberId = Convert.ToInt32(Request.QueryString["Value"]);
                    dt = obj.GeTSubscriberById(objBESubscriber);
                }
                else if (Request.QueryString["By"] == "AgentId")
                {
                    BEAgent objBESubAgent = new BEAgent();
                    objBESubAgent.AgentId = Convert.ToInt32(Request.QueryString["Value"]);
                    dt = obj.SubsciberByAgent(objBESubAgent);
                }
                else if (Request.QueryString["By"] == "Payment Due")
                {
                    BE_Chit objBEdue = new BE_Chit();
                    dt = obj.SubscriberByDue();
                }
                else if (Request.QueryString["By"] == "AreaId")
                {
                    BE_Area objBESubArea = new BE_Area();
                    objBESubArea.AreaId = Convert.ToInt32(Request.QueryString["Value"]);
                    dt = obj.SubsciberByArea(objBESubArea);
                }
                if (dt.Rows.Count == 0)
                    Response.Write("No Record Found");
                else
                {
                    gvShowReport.DataSource = dt;
                    gvShowReport.DataBind();
                }
            }
            else if (Request.QueryString["Report"] == "Chit")
            {
                if (Request.QueryString["By"] == "Amount")
                {
                    if (Request.QueryString["By"] == "Id")
                    {
                        BE_Chit objamount = new BE_Chit();
                        objamount.ChitValue = Convert.ToInt32(Request.QueryString["Value"]);
                        dt = obj.ChitAmount(objamount);
                    }
                }
                else if (Request.QueryString["By"] == "ActiveChit")
                {
                    dt = obj.ActiveChit();
                }
                else if (Request.QueryString["By"] == "InActiveChit")
                {
                    dt = obj.InActiveChit();
                }
                else if (Request.QueryString["By"] == "Monthly")
                {
                    BE_Collection objBEcollection = new BE_Collection();
                    objBEcollection.collect = (Request.QueryString["Value"]);
                    dt = obj.monthlyamountcollection(objBEcollection);
                }
                else if (Request.QueryString["By"] == "Yearly")
                {
                    BE_Collection objBEcollection = new BE_Collection();
                    objBEcollection.collect = (Request.QueryString["Value"]);
                    dt = obj.yearlyamountcollection(objBEcollection);
                }
                if (dt.Rows.Count == 0)
                    Response.Write("No Record Found");
                else
                {
                    gvShowReport.DataSource = dt;
                    gvShowReport.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Record Not Found \n" + ex.Message + "')</script>");

        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Export.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            HtmlForm frm = new HtmlForm();
            gvShowReport.Parent.Controls.Add(frm);
            frm.Attributes["runat"] = "server";
            frm.Controls.Add(gvShowReport);
            frm.RenderControl(hw);
            StringReader sr = new System.IO.StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
}