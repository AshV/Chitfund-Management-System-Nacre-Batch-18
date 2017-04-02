using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using BALChitFundManagementSystem.BE;
using BALChitFundManagementSystem.BL;
using MySql.Data.MySqlClient;
public partial class operator_AddRegisteredSubscriber : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static BE_Chit[] GetChitInfo(int id)
    {
        try
        {
            List<BE_Chit> record = new List<BE_Chit>();

            BLMangeChit b = new BLMangeChit();
            BE_Chit g = new BE_Chit();
            g.ChitId = id;
            MySqlDataReader dr = b.GetChitInfo(g);
            while (dr.Read())
            {
                BE_Chit user = new BE_Chit();
                user.ChitGroupStartDate = dr.GetDateTime(4).ToString("dd-MMM-yyyy");
                user.NoOfMonths = int.Parse(dr[1].ToString());
                user.AvailableSlots = int.Parse(dr[5].ToString());
                user.ChitValue = double.Parse(dr[2].ToString());
                user.MonthlyInstallment = double.Parse(dr[3].ToString());
                record.Add(user);
            }
            return record.ToArray();
        }
        catch(Exception ex)
        {
            throw;
         
        }
    }
    [WebMethod]
    public static BE_IdProofType[] GetIdProofData()
    {
        try
        {
            List<BE_IdProofType> record = new List<BE_IdProofType>();

            BLMangeChit b = new BLMangeChit();
            MySqlDataReader dr = b.GetIdProofData();
            while (dr.Read())
            {
                BE_IdProofType user = new BE_IdProofType();
                user.IdProofId = int.Parse(dr[0].ToString());
                user.IdProofName = dr[1].ToString();
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
    public static BE_Nominee[] GetNominee(int customerId)
    {
        try
        {
            List<BE_Nominee> record = new List<BE_Nominee>();

            BLMangeChit b = new BLMangeChit();
            BE_Customer c = new BE_Customer();
            c.CustomerId = customerId;
            MySqlDataReader dr = b.GetNominee(c);
            while (dr.Read())
            {
                BE_Nominee user = new BE_Nominee();
                user.NomineeId = int.Parse(dr[0].ToString());
                user.NomineeName = dr[1].ToString();
                record.Add(user);
            }
            return record.ToArray();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //[WebMethod]
    //public static Subscriber[] GetSubscriber()
    //{
    //    try
    //    {
    //        List<Subscriber> record = new List<Subscriber>();

    //        BLClass b = new BLClass();
    //        MySqlDataReader dr = b.GetSubscriber();
    //        while (dr.Read())
    //        {
    //            Subscriber user = new Subscriber();
    //            user.SubscriberId = int.Parse(dr[0].ToString());
    //            user.SubsciberName = dr[1].ToString();
    //            record.Add(user);
    //        }
    //        return record.ToArray();
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}

    [WebMethod]
    public static BE_Guaranter[] GetGuarantor(int Id)
    {
        try
        {
            List<BE_Guaranter> record = new List<BE_Guaranter>();

            BLMangeChit b = new BLMangeChit();
            BE_Customer c = new BE_Customer();
            c.CustomerId = Id;
            MySqlDataReader dr = b.GetGuarantor(c);
            while (dr.Read())
            {
                BE_Guaranter user = new BE_Guaranter();
                user.GuaranterId = int.Parse(dr[0].ToString());
                user.GuaranterName = dr[1].ToString();
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
    public static List<string> GetAutoCompleteData(int chitId, string username)
    {
        try
        {
            List<string> result = new List<string>();
            BLMangeChit bl = new BLMangeChit();
            BE_Customer cust = new BE_Customer();
            cust.CustomerName = username;
            BE_Chit chit = new BE_Chit();
            chit.ChitId = chitId;
            //Subscriber be = new Subscriber();
            //be.SubscriberName = username;
            MySqlDataReader dr = bl.Auto(chit, cust);
            while (dr.Read())
            {
                result.Add(string.Format("{0}/{1}", dr[1], dr[0]));
            }
            return result;
        }
        catch(Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    public static int InsertNominee(string name, string relation, string dob, int age, string contactNo)
    {
        try
        {
            BE_Nominee n = new BE_Nominee();
            n.NomineeName = name;
            n.Relation = relation;
            n.DOB = Convert.ToDateTime(dob).ToString("yyyy/MM/dd");
            n.Age = age;
            n.ContactNumber = contactNo;
            BLMangeChit b = new BLMangeChit();
            return b.InsertNominee(n);
        }
        catch(Exception ex)
        {
            throw ex;
        }
    }
    [WebMethod]
    public static BE_Nominee[] GetNewNominee()
    {
        try
        {
            List<BE_Nominee> record = new List<BE_Nominee>();
            BLMangeChit b = new BLMangeChit();
            MySqlDataReader dr = b.GetNewNomineeIdName();
            while (dr.Read())
            {
                BE_Nominee user = new BE_Nominee();
                user.NomineeId = int.Parse(dr[0].ToString());
                user.NomineeName = dr[1].ToString();
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
    public static BE_AddressProofType[] GetAddressProofIdName()
    {
        try
        {
            List<BE_AddressProofType> record = new List<BE_AddressProofType>();
            BLMangeChit b = new BLMangeChit();
            MySqlDataReader dr = b.GetAddressProofIdName();
            while (dr.Read())
            {
                BE_AddressProofType user = new BE_AddressProofType();
                user.AddressProofId = int.Parse(dr[0].ToString());
                user.AddressProofName = dr[1].ToString();
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
    public static int InsertGuarantor(string name, string date, int age, string relation, string contactNo, int idProofId, string idProofDoc, int addProofId, string addProofDoc, string occupation, string company, double income)
    {
        try
        {
            char[] delimiterChars = { ',' };
            byte[] idProofData = null;
            if (idProofDoc != "null")
            {
                string[] idProof = idProofDoc.Split(delimiterChars);
                idProofData = (byte[])Convert.FromBase64String(idProof[1]);
            }
            byte[] addressProofData = null;
            if (addProofDoc != "null")
            {
                string[] addressProof = addProofDoc.Split(delimiterChars);
                addressProofData = (byte[])Convert.FromBase64String(addressProof[1]);
            }
            BE_Guaranter guarantor = new BE_Guaranter();
            guarantor.GuaranterName = name;
            guarantor.DOB = Convert.ToDateTime(date).ToString("yyyy/MM/dd");
            guarantor.Age = age;
            guarantor.Relation = relation;
            guarantor.ContactNumber = contactNo;
            guarantor.IdProofId = idProofId;
            guarantor.IdProofDoc = idProofData;
            guarantor.AddressProofId = addProofId;
            guarantor.AddressProofDoc = addressProofData;
            guarantor.Occupation = occupation;
            guarantor.Company = company;
            guarantor.AnualIncome = income;
            BLMangeChit b = new BLMangeChit();
            return b.InsertGuarantor(guarantor);
        }
        catch(Exception ex)
        {
            throw ex;
        }
    }
    [WebMethod]
    public static BE_Guaranter[] GetNewGuarantor()
    {
        try
        {
            List<BE_Guaranter> record = new List<BE_Guaranter>();
            BLMangeChit b = new BLMangeChit();
            MySqlDataReader dr = b.GetNewGuarantorIdName();
            while (dr.Read())
            {
                BE_Guaranter user = new BE_Guaranter();
                user.GuaranterId = int.Parse(dr[0].ToString());
                user.GuaranterName = dr[1].ToString();
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
    public static int InsertCustomerToChit(int customerId, int chitId, int nomineeId, int guarantorId, string applicationDoc, string authorizationDoc, string bidOfferDoc, string agreementDoc)
    {
       
        try
        {
            char[] delimiterChars = { ',' };
            byte[] appDocData = null;
            if (applicationDoc != "null")
            {
                string[] appDoc = applicationDoc.Split(delimiterChars);
                appDocData =(byte[]) Convert.FromBase64String(appDoc[1]);
            }
            byte[] authDocData = null;
            if (authorizationDoc != "null")
            {
                string[] authDoc = authorizationDoc.Split(delimiterChars);
                authDocData =(byte[])Convert.FromBase64String(authDoc[1]);
            }

            byte[] bidDocData = null;
            if (bidOfferDoc != "null")
            {
                string[] bidDoc = bidOfferDoc.Split(delimiterChars);
                 bidDocData =(byte[]) Convert.FromBase64String(bidDoc[1]);
            }
            byte[] agreeDocData = null;
            if (agreementDoc != "null")
            {
                string[] agreeDoc = agreementDoc.Split(delimiterChars);
                agreeDocData = (byte[])Convert.FromBase64String(agreeDoc[1]);
            }
            BE_Customer customer = new BE_Customer();
            customer.CustomerId = customerId;
            BE_Nominee nominee = new BE_Nominee();
            nominee.NomineeId = nomineeId;
            BE_Guaranter guarantor = new BE_Guaranter();
            guarantor.GuaranterId = guarantorId;
            BE_Chit chit = new BE_Chit();
            chit.ChitId = chitId;
            BE_CustomerDocument document = new BE_CustomerDocument();
            document.ApplicationDoc = appDocData;
            document.AuthorizationDoc = authDocData;
            document.BidOfferDoc = bidDocData;
            document.AgreementDoc = agreeDocData;
            BLMangeChit b = new BLMangeChit();
            return b.InsertCustomerToChit(document, nominee, guarantor, customer, chit);
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
    [WebMethod]
    public static BE_CustomerFromChit[] GetCustomerFromChit(int chitId)
    {
        try
        {
            List<BE_CustomerFromChit> record = new List<BE_CustomerFromChit>();
            BE_Chit chit = new BE_Chit();
            chit.ChitId = chitId;
            BLMangeChit b = new BLMangeChit();
            MySqlDataReader dr = b.CustomerFromChit(chit);
            while (dr.Read())
            {
                BE_CustomerFromChit user = new BE_CustomerFromChit();
                user.ChitId = int.Parse(dr[0].ToString());
                user.CustomerId = int.Parse(dr[1].ToString());
                user.CustomerName = dr[2].ToString();
                if (dr[3].ToString() == "")
                    user.GuaranterId = null;
                else
                    user.GuaranterId = int.Parse(dr[3].ToString());

                user.MobileNo = dr[4].ToString();
                user.SubscriberDocId = int.Parse(dr[5].ToString());
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