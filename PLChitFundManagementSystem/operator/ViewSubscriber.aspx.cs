using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;
using BALChitFundManagementSystem.BE;
using BALChitFundManagementSystem.BL;
using MySql.Data.MySqlClient;
using System.Configuration;
public partial class _ViewSubscriber : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    [WebMethod]
    public static BE_Address[] GetAddress()
    {
        try
        {
            List<BE_Address> record = new List<BE_Address>();
            BLMangeChit b = new BLMangeChit();
            MySqlDataReader dr = b.GetArea();
            while (dr.Read())
            {
                BE_Address user = new BE_Address();
                user.AddressId = Convert.ToInt32(dr["addressId"]);
                user.Area = dr["area"].ToString();
                record.Add(user);
            }
            return record.ToArray();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    [WebMethod]
    public static BE_User[] GetAgent()
    {
        try
        {
            List<BE_User> record = new List<BE_User>();
            BLMangeChit b = new BLMangeChit();
            MySqlDataReader dr = b.GetAgent();
            while (dr.Read())
            {
                BE_User user = new BE_User();
                user.UserId = Convert.ToInt32(dr["userId"]);
                user.FirstName = dr["firstName"].ToString();
                record.Add(user);
            }
            return record.ToArray();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    public static BE_Chit[] GetChit()
    {
        try
        {
            List<BE_Chit> record = new List<BE_Chit>();
            BLMangeChit b = new BLMangeChit();
            DataTable dt = b.GetChit();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                BE_Chit user = new BE_Chit();
                user.ChitId = Convert.ToInt32(dt.Rows[i]["chitId"]);
                user.ChitName = dt.Rows[i]["chitName"].ToString();
                record.Add(user);
            }
            return record.ToArray();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    [WebMethod]
    public static BE_Customer[] GetData(int id, string type)
    {
        try
        {
            List<BE_Customer> record = new List<BE_Customer>();
            BLMangeChit b = new BLMangeChit();
            AreaAgentChit a = new AreaAgentChit();
            a.Id = id;
            a.Type = type;
            MySqlDataReader dr = b.SubscriberAgentAreaChitWise(a);
            while (dr.Read())
            {
                BE_Customer user = new BE_Customer();
                user.CustomerId = Convert.ToInt32(dr[0]);
                user.CustomerName = dr[1].ToString();
                user.DOB = dr.GetDateTime(2).ToString("dd-MMM-yyyy");
                user.DOJ = dr.GetDateTime(3).ToString("dd-MMM-yyyy");
                user.MobileNo = dr[4].ToString();
                user.EmailId = dr[5].ToString();
                record.Add(user);
            }
            return record.ToArray();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}