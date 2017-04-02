using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using BALChitFundManagementSystem.BE;
using BALChitFundManagementSystem.BL;

public partial class Report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static BEAdmin[] GetAdminName()
    {
        try
        {
            DataTable dt = new DataTable();
            List<BEAdmin> record = new List<BEAdmin>();
            BLReport objblreport = new BLReport();
            dt = objblreport.AdminDDLList();
            foreach (DataRow dtrow in dt.Rows)
            {
                BEAdmin user = new BEAdmin();
                user.AdminId = Convert.ToInt32(dtrow["userId"]);
                user.AdminName = dtrow["firstName"].ToString();
                record.Add(user);
            }
            return record.ToArray();
        }
        catch (Exception ex)
        {
            //Response.Write("<script>alert('" + ex.Message + "')</script>");
            throw ex;
        }
    }

    [WebMethod]
    public static BEAgent[] GetAgentName()
    {
        try
        {
            DataTable dt = new DataTable();
            List<BEAgent> record = new List<BEAgent>();
            BLReport objblreport = new BLReport();
            dt = objblreport.AgentDDLList();
            foreach (DataRow dtrow in dt.Rows)
            {
                BEAgent user = new BEAgent();
                user.AgentId = Convert.ToInt32(dtrow["userId"]);
                user.AgentName = dtrow["firstName"].ToString();
                record.Add(user);
            }
            return record.ToArray();
        }
        catch (Exception ex)
        {
            throw ex;
            // Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    [WebMethod]
    public static BEOperator[] GetoperatorName()
    {
        try
        {
            DataTable dt = new DataTable();
            List<BEOperator> record = new List<BEOperator>();
            BLReport objblreport = new BLReport();
            dt = objblreport.OperatorDDLList();
            foreach (DataRow dtrow in dt.Rows)
            {
                BEOperator user = new BEOperator();
                user.OperatorId = Convert.ToInt32(dtrow["userId"]);
                user.Operatorname = dtrow["firstName"].ToString();
                record.Add(user);
            }
            return record.ToArray();
        }
        catch (Exception ex)
        {
            throw ex;
            //Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
    }
    [WebMethod]
    public static BE_Area[] GetAreaWise()
    {
        try
        {
            DataTable dt = new DataTable();
            List<BE_Area> record = new List<BE_Area>();
            BLReport objblreport = new BLReport();
            dt = objblreport.AreaDDLList();
            foreach (DataRow dtrow in dt.Rows)
            {
                BE_Area user = new BE_Area();
                user.AreaId = Convert.ToInt32(dtrow["addressId"]);
                user.AreaName = dtrow["area"].ToString();
                record.Add(user);
            }
            return record.ToArray();
        }
        catch (Exception ex)
        {
            throw ex;
    }
     
    
                  // Response.Write("<script>alert('" + ex.Message + "')</script>");
        
            }
}