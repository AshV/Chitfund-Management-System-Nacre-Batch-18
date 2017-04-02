using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using BALChitFundManagementSystem.BL;
using BALChitFundManagementSystem.BE;
using BALChitFundManagementSystem;
using System.Web.Services;
using System.IO;

public partial class ManageCust : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static List<string> GetAutoCompleteData(string username)
    {
        try
        {
            List<string> result = new List<string>();
            BLSubscriber bl = new BLSubscriber();
            BE_Customer be = new BE_Customer();
            be.CustomerName = username;
            MySqlDataReader dr = bl.Auto(be);
            while (dr.Read())
            {
                result.Add(string.Format("{0}/{1}", dr["customerName"], dr["customerid"]));
            }
            return result;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    public static subscriber[] GetAllData(int custid)
    {
        try
        {
            BLSubscriber bl = new BLSubscriber();
            BE_Customer be = new BE_Customer();
            be.CustomerId = custid;
            List<subscriber> result = new List<subscriber>();
            MySqlDataReader dr = bl.display(be);
            while (dr.Read())
            {
                subscriber obj = new subscriber();
                obj.customerid = dr["customerid"].ToString();
                obj.customerName = dr["customerName"].ToString();
                obj.dob = dr.GetDateTime("dob").ToString("yyy-MM-dd");

                obj.mobno = dr["mobileNo"].ToString();
                obj.altrmobno = dr["alternateNo"].ToString();
                obj.spouse = dr["spouse"].ToString();
                obj.emailid = dr["emailId"].ToString();
                obj.contactperson = dr["contactPerson"].ToString();
                obj.addid = dr["addressid"].ToString();


                obj.addName = dr["area"].ToString();
                obj.houseNo = dr["houseNo"].ToString();
                obj.street = dr["street"].ToString();
                obj.Zip = dr["zip"].ToString();
                obj.state = dr["state"].ToString();
                obj.stateId = dr["stateId"].ToString();
                obj.city = dr["city"].ToString();
                obj.cityId = dr["cityId"].ToString();
                result.Add(obj);
            }
            return result.ToArray();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    public static GetCityState[] GetStateName()
    {
        try
        {
            List<GetCityState> record = new List<GetCityState>();
            BLSubscriber b = new BLSubscriber();
            MySqlDataReader dr = b.GetStateName();
            while (dr.Read())
            {
                GetCityState user = new GetCityState();
                user.stateId = Convert.ToInt32(dr["stateId"]);
                user.state = dr["state"].ToString();
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
    public static GetCityState[] GetCityName(string StateId)
    {
        try
        {
            List<GetCityState> record = new List<GetCityState>();
            BLSubscriber b = new BLSubscriber();
            BE_Customer be = new BE_Customer();
            be.stateid = StateId;
            MySqlDataReader dr = b.GetCityName(be);
            while (dr.Read())
            {
                GetCityState user = new GetCityState();
                user.cityId = Convert.ToInt32(dr["cityId"]);
                user.city = dr["city"].ToString();
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
    public static GetCityState[] GetAddProof(int custid)
    {
        try
        {
            List<GetCityState> record = new List<GetCityState>();
            BLSubscriber b = new BLSubscriber();
            BE_Customer be = new BE_Customer();
            be.CustomerId = custid;
            MySqlDataReader dr = b.GetAddProof(be);
            while (dr.Read())
            {
                GetCityState user = new GetCityState();
                user.addProofId = (dr["addressProofId"]).ToString();
                user.addProofName = dr["addressProofName"].ToString();
                user.addProofDoc = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["addressProofDoc"]);
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
    public static GetCityState[] GetIdProof(int custid)
    {
        try
        {
            List<GetCityState> record = new List<GetCityState>();
            BLSubscriber b = new BLSubscriber();
            BE_Customer be = new BE_Customer();
            be.CustomerId = custid;
            MySqlDataReader dr = b.GetIdProof(be);
            while (dr.Read())
            {
                GetCityState user = new GetCityState();
                user.IdPTypeId = (dr["idProofId"]).ToString();
                user.IdPTypeName = dr["idProofName"].ToString();
                user.idProofDoc = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["idProofDoc"]);
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
    public static GetCityState[] GetAddType()
    {
        try
        {
            List<GetCityState> record = new List<GetCityState>();
            BLSubscriber b = new BLSubscriber();
            MySqlDataReader dr = b.GetAddType();
            while (dr.Read())
            {
                GetCityState user = new GetCityState();
                user.addProofId = (dr["addressProofId"]).ToString();
                user.addProofName = dr["addressProofName"].ToString();
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
    public static GetCityState[] GetIdType()
    {
        try
        {
            List<GetCityState> record = new List<GetCityState>();
            BLSubscriber b = new BLSubscriber();
            MySqlDataReader dr = b.GetIdType();
            while (dr.Read())
            {
                GetCityState user = new GetCityState();
                user.IdPTypeId = (dr["idProofId"]).ToString();
                user.IdPTypeName = dr["idProofName"].ToString();
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
    public static subscriber[] GetSubscriber(int custid)
    {
        try
        {
            //BLClass bl = new BLClass();
            List<subscriber> result = new List<subscriber>();
            ConnectionStringSettings connStrSettings = ConfigurationManager.ConnectionStrings["Database"];
            MySqlConnection con = new MySqlConnection(connStrSettings.ConnectionString);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT image  from tbl_subscriber where customerId= " + custid + "", con);
            MySqlDataReader dr = cmd.ExecuteReader();
            //MySqlDataReader dr = bl.getSubscriber(custid);
            while (dr.Read())
            {
                subscriber obj = new subscriber();
                obj.houseNo = "12";
                obj.imgurl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["image"]);
                result.Add(obj);
            }
            return result.ToArray();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

   [WebMethod]
    public static int Insert_Data(int  custid, string cp,string sp, string addid, string cityid, string stateId, string addptypeid, string img, string docAdd,string idptypeid, string docId, string name, string dob, string mobNo, string aMobNo, string emailId, string area, string houseNO, string street, string zip)
    {
        try
        {
            byte[] img1 = null;
            char[] delimiterChars = { ',' };
            if (img != "null")
            {
                string[] photo = img.Split(delimiterChars);
                img1 = (byte[])Convert.FromBase64String(photo[1]);
            }

            byte[] docAdd1 = null;
            if (docAdd != "null")
            {
                string[] docadd = docAdd.Split(delimiterChars);
                docAdd1 = (byte[])Convert.FromBase64String(docadd[1]);
            }
            else
            {
                addptypeid = null;
            }
            byte[] docId1 = null;
            if (docId != "null")
            {
                string[] docid = docId.Split(delimiterChars);
                docId1 = (byte[])Convert.FromBase64String(docid[1]);
            }
            else
                idptypeid = null;

            BE_Customer be = new BE_Customer();
            be.CustomerId= custid;
            be.CustomerName = name;
            be.AddressId = addid;
            be.cityid = cityid;
            be.stateid = stateId;
            be.AddresspTypeId = addptypeid;
            be.Imgage = img1;
            be.Docid = docId1;
            be.Doc = docAdd1;
            be.Spouse = sp;
            be.DOB = dob;
            be.MobileNo = mobNo;
            be.AlternateMobileNo = aMobNo;
            be.EmailId = emailId;
            be.Area = area;
            be.Houseno = houseNO;
            be.Street = street;
            be.ContactPerson = cp;
            be.IdpTypeId = idptypeid;
            be.Zip = zip;
            BLSubscriber obj = new BLSubscriber();
            int res = obj.insertData(be);
            return res;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}