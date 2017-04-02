using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Configuration;
using DataAccessLayer;
using BALChitFundManagementSystem.BE;
namespace BALChitFundManagementSystem.BL
{
   public class BLMangeChit
    {
        MySqlDataReader dr;
         DataTable dt;
       
       public MySqlDataReader CustomerFromChit(BE_Chit chit)
       {
           try
           {
               MySqlParameter[] para = { new MySqlParameter("_chitId", MySqlDbType.Int32) { Value = chit.ChitId } };
               return ConnectionFactory.ExecuteCommand("sp_customerFromChit", CommandType.StoredProcedure, para);
           }
           catch
           {
               throw;
           }
       }
      
       public MySqlDataReader GetAgentAreaChitName()
       {
           try
           {
               
               return ConnectionFactory.ExecuteCommand("GetAreaAgentChit", CommandType.StoredProcedure);
           }
           catch
           {
               throw;
           }
       }
       public MySqlDataReader SubscriberAgentAreaChitWise(AreaAgentChit a)
       {
           try
           {
               string storedProcedure = string.Empty;
               MySqlParameter para = new MySqlParameter();
             
               if (a.Type == "DropDownList2")
               {
                   storedProcedure = "sp_subscriberAgentWise";
                   para = new MySqlParameter("AgentId", MySqlDbType.Int32) { Value = a.Id };
               }
               if (a.Type == "DropDownList1")
               {
                   storedProcedure = "sp_subscriberAreaWise";
                   para = new MySqlParameter("AddressId", MySqlDbType.Int32) { Value = a.Id };
               }
               if (a.Type == "DropDownList3")
               {
                   storedProcedure = "sp_subscriberChitWise";
                   para = new MySqlParameter("ChitId", MySqlDbType.Int32) { Value = a.Id };
               }
               MySqlParameter[] p1 = { para };
               return ConnectionFactory.ExecuteCommand(storedProcedure, CommandType.StoredProcedure, p1);
           }
           catch
           {
               throw;
           }
       }
       public MySqlDataReader GetArea()
       {
           try
           {
               
               return ConnectionFactory.ExecuteCommand("sp_getAreaName", CommandType.StoredProcedure);
           }
           catch
           {
               throw;
           }
       }
       public MySqlDataReader GetAgent()
       {
           try
           {
             
               return ConnectionFactory.ExecuteCommand("sp_getAgentName", CommandType.StoredProcedure);
           }
           catch
           {
               throw;
           }
       }
       public DataTable GetChit()
       {
           try
           {
               
               dr = ConnectionFactory.ExecuteCommand("sp_GetChitIdName", CommandType.StoredProcedure);
               dt = new DataTable();
               dt.Load(dr);
               dr.Close();
               return dt;
           }
           catch
           {
               throw;
           }
       }
         public MySqlDataReader GetRole()
       {
           try
           {
               
               return ConnectionFactory.ExecuteCommand("sp_GetRole", CommandType.StoredProcedure);
           }
           catch
           {
               throw;
           }
       }
       public MySqlDataReader GetChitInfo(BE_Chit g)
       {
           try
           {
            
               MySqlParameter[] para = { new MySqlParameter("_chitID", MySqlDbType.Int32) { Value = g.ChitId } };
               return ConnectionFactory.ExecuteCommand("sp_chitInfo", CommandType.StoredProcedure, para);
           }
           catch
           {
               throw;
           }
       }
       public MySqlDataReader GetIdProofData()
       {
           try
           {
          
               return ConnectionFactory.ExecuteCommand("sp_getIdProofData", CommandType.StoredProcedure);
           }
           catch
           {
               throw;
           }
       }
       public MySqlDataReader GetNominee(BE_Customer c)
       {
           try
           {
               
               MySqlParameter[] para = { new MySqlParameter("_customerId", MySqlDbType.Int32) { Value = c.CustomerId } };
               return ConnectionFactory.ExecuteCommand("sp_GetNomineeIdName", CommandType.StoredProcedure,para);
           }
           catch
           {
               throw;
           }
       }
       public MySqlDataReader GetSubscriber()
       {
           try
           {
             
               return ConnectionFactory.ExecuteCommand("", CommandType.StoredProcedure);
           }
           catch
           {
               throw;
           }
       }

       public MySqlDataReader GetGuarantor(BE_Customer c)
       {
           try
           {
          
               MySqlParameter[] para = { new MySqlParameter("_customerId", MySqlDbType.Int32) { Value = c.CustomerId } };
               return ConnectionFactory.ExecuteCommand("sp_GetGuarantorIdName", CommandType.StoredProcedure,para);
           }
           catch
           {
               throw;
           }
       }
       public MySqlDataReader Auto(BE_Chit chit,BE_Customer cust)
       {
           try
           {
               MySqlParameter[] my ={new MySqlParameter("_chitId",MySqlDbType.Int32){Value=chit.ChitId},
            new MySqlParameter("_str",MySqlDbType.VarChar){Value=cust.CustomerName}};
               return ConnectionFactory.ExecuteCommand("sp_GetCustomerIdName", CommandType.StoredProcedure, my);
           }
           catch
           {
               throw;
           }
       }
       public int InsertNominee(BE_Nominee e)
       {
           try
           {
             
               MySqlParameter[] my ={new MySqlParameter("_name",MySqlDbType.VarChar){Value=e.NomineeName},
            new MySqlParameter("_relation",MySqlDbType.VarChar){Value=e.Relation},
            new MySqlParameter("_dob",MySqlDbType.Date){Value=e.DOB},
            new MySqlParameter("_age",MySqlDbType.Int32){Value=e.Age},
            new MySqlParameter("_contactNumber",MySqlDbType.VarChar){Value=e.ContactNumber}};
               return ConnectionFactory.ExecuteUpdate("sp_InsertNominee", CommandType.StoredProcedure, my);
           }
           catch
           {
               throw;
           }
       }
       public MySqlDataReader GetNewNomineeIdName()
       {
           try
           {
             
               return ConnectionFactory.ExecuteCommand("GetNewNomineeIdName", CommandType.StoredProcedure);
           }
           catch
           {
               throw;
           }
       }
       public MySqlDataReader GetAddressProofIdName()
       {
           try
           {
            
               return ConnectionFactory.ExecuteCommand("sp_GetAddressProofIdName", CommandType.StoredProcedure);
           }
           catch
           {
               throw;
           }
       }
       public int InsertGuarantor(BE_Guaranter g)
       {
           try
           {
               MySqlParameter[] my ={new MySqlParameter("_guarantorName",MySqlDbType.VarChar){Value=g.GuaranterName},
              new MySqlParameter("_dob",MySqlDbType.Date){Value=g.DOB},
            new MySqlParameter("_age",MySqlDbType.Int32){Value=g.Age},
            new MySqlParameter("_relation",MySqlDbType.VarChar){Value=g.Relation},
            new MySqlParameter("_contactNumber",MySqlDbType.VarChar){Value=g.ContactNumber},
            new MySqlParameter("_idProofId",MySqlDbType.Int32){Value=g.IdProofId},
            new MySqlParameter("_idProofDoc",MySqlDbType.Blob){Value=g.IdProofDoc},
            new MySqlParameter("_addressProofId",MySqlDbType.Int32){Value=g.AddressProofId},
            new MySqlParameter("_addressProofDoc",MySqlDbType.Blob){Value=g.AddressProofDoc},
            new MySqlParameter("_occupation",MySqlDbType.VarChar){Value=g.Occupation},
            new MySqlParameter("_company",MySqlDbType.VarChar){Value=g.Company},
            new MySqlParameter("_annualIncome",MySqlDbType.Double){Value=g.AnualIncome}};
               return ConnectionFactory.ExecuteUpdate("sp_insertGuarantor", CommandType.StoredProcedure, my);
           }
           catch
           {
               throw;
           }
       }
       public MySqlDataReader GetNewGuarantorIdName()
       {
           try
           {
               
               return ConnectionFactory.ExecuteCommand("sp_GetNewGuarantorIdName", CommandType.StoredProcedure);
           }
           catch
           {
               throw;
           }
       }
       public int InsertCustomerToChit(BE_CustomerDocument document, BE_Nominee nominee, BE_Guaranter guarantor, BE_Customer customer, BE_Chit chit)
       {
           try
           {
            
               MySqlParameter[] my ={new MySqlParameter("_customerId",MySqlDbType.Int32){Value=customer.CustomerId},
              new MySqlParameter("_chitId",MySqlDbType.Int32){Value=chit.ChitId},
            new MySqlParameter("_applicationDoc",MySqlDbType.Blob){Value=document.ApplicationDoc},
            new MySqlParameter("_bidOfferDoc",MySqlDbType.Blob){Value=document.BidOfferDoc},
            new MySqlParameter("_authorizationDoc",MySqlDbType.Blob){Value=document.AuthorizationDoc},
            new MySqlParameter("_agreementDoc",MySqlDbType.Blob){Value=document.AgreementDoc},
            new MySqlParameter("_nomineeId",MySqlDbType.Int32){Value=nominee.NomineeId},
            new MySqlParameter("_guarantorId",MySqlDbType.Int32){Value=guarantor.GuaranterId}};
               return ConnectionFactory.ExecuteUpdate("sp_insertCustomerToChit", CommandType.StoredProcedure, my);
           }
           catch
           {
               throw;
           }
       }
       public DataTable GetChitName_statuszero()
       {
           try
           {
               dr = ConnectionFactory.ExecuteCommand("sp_GetChitName_statuszero", CommandType.StoredProcedure);
               dt = new DataTable();
               dt.Load(dr);
               return dt;
           }
           catch
           {
               throw;
           }
       }

       public MySqlDataReader getsubDetails(BE_Chit objChit)
       {
           //BE_Chit obj = new BE_Chit();
           //obj.ChitId = subId;
           try
           {
               MySqlParameter[] objParam = new MySqlParameter[1];
               objParam[0] = new MySqlParameter("_chitId", objChit.ChitId);

               MySqlDataReader dr = ConnectionFactory.ExecuteStoredProcedure("GetCustomersRemove", objParam);

               return dr;
           }
           catch
           {
               throw;
           }
       }
       
       public MySqlDataReader RemoveCustomer(string customerIds, int chitId)
       {
           try
           {
               MySqlParameter[] objParam = new MySqlParameter[2];
               objParam[0] = new MySqlParameter("_customerId", customerIds);
               objParam[1] = new MySqlParameter("_chitId", chitId);


               MySqlDataReader dr = ConnectionFactory.ExecuteStoredProcedure("sp_removeCustomerfromChit", objParam);

               return dr;

           }
           catch
           {
               throw;

           }
       }
       public int RemoveCustomers(string s)
       {
           try
           {
               MySqlParameter[] objParam = new MySqlParameter[1];
               objParam[0] = new MySqlParameter("_subscriberDocId", s);
               //  objParam[1] = new MySqlParameter("_chitId", chitId);


               int i = ConnectionFactory.ExecuteUpdate("SP_RemoveMultipleCustomers", CommandType.StoredProcedure, objParam);
               return i;

               // return dr;

           }
           catch
           {
               throw;

           }
       }
       //Create Chit SP_SaveChitDocuments
        public int UploadDocuments(BE_ChitdocumentproofId objBEchitdocproof)
        {
            MySqlParameter[] myparam = new MySqlParameter[3];

         myparam[0] = new MySqlParameter("_documentProofId", objBEchitdocproof.DocumentProofId);
            myparam[1] = new MySqlParameter("_document", objBEchitdocproof.Document);
           myparam[2] = new MySqlParameter("_description", objBEchitdocproof.Description);

          int result= ConnectionFactory.ExecuteUpdate("SP_SaveChitDocuments",CommandType.StoredProcedure,myparam);
          return result;
   }
       
       public void CreateChit(BE_Chit objBEchitcreation)
       {


           MySqlParameter[] myparam = new MySqlParameter[15];

           myparam[0] = new MySqlParameter("_chitName", objBEchitcreation.ChitName);
           myparam[1] = new MySqlParameter("_noOfMonths", objBEchitcreation.NoOfMonths);
           myparam[2] = new MySqlParameter("_noOfCustomer", objBEchitcreation.TotalNoOfCustomers);
           myparam[3] = new MySqlParameter("_chitValue", objBEchitcreation.ChitValue);
           myparam[4] = new MySqlParameter("_chitGroupStartDate", objBEchitcreation.ChitGroupStartDate);
           myparam[5] = new MySqlParameter("_chitGroupEndDate", objBEchitcreation.ChitGroupStartDate);
           myparam[6] = new MySqlParameter("_chitGroupAuctionDay", objBEchitcreation.ChitGroupStartDate);
           myparam[7] = new MySqlParameter("_previousSanctionNumber", objBEchitcreation.PreviousSanctionNumber);
           myparam[8] = new MySqlParameter("_previousSanctionDate", objBEchitcreation.PreviousSanctionDate);
           myparam[9] = new MySqlParameter("_CCBNumber", objBEchitcreation.CCBNumber);
           myparam[10] = new MySqlParameter("_CCBDate", objBEchitcreation.CCBDate);
           myparam[11] = new MySqlParameter("_summary", objBEchitcreation.Summary);
           myparam[12] = new MySqlParameter("_registrationNumber", objBEchitcreation.RegistrationNumber);
           myparam[13] = new MySqlParameter("_status", objBEchitcreation.Status);
           myparam[14] = new MySqlParameter("_userId", objBEchitcreation.UserId);
         
           ConnectionFactory.ExecuteStoredProcedure("SP_insertingChit", myparam);



       }


       public DataTable GetChitId()
       {
           MySqlParameter[] SpParam = new MySqlParameter[0];
           dr = ConnectionFactory.ExecuteStoredProcedure("sp_GetChitId", SpParam);
           DataTable dt = new DataTable();
           dt.Load(dr);
           return dt;
       }


       //update chit

       
       public int UpdateChit(BE_Chit objChit)
       {
           MySqlParameter[] parameters = new MySqlParameter[]
		    {
			    new MySqlParameter("_chitId",objChit.ChitId),
			    new MySqlParameter("_chitName",objChit.ChitName),
			    new MySqlParameter("_noOfMonths",objChit.NoOfMonths),
			    new MySqlParameter("_noOfCustomer",objChit.NoOfCustomer),
			    new MySqlParameter("_chitValue",objChit.ChitValue),
			    new MySqlParameter("_chitGroupStartDate",objChit.ChitGroupStartDate),
			    new MySqlParameter("_chitGroupEndDate",objChit.chitGroupEndDate),
			    new MySqlParameter("_chitGroupAuctionDay",objChit.chitGroupAuctionDay),
			    new MySqlParameter("_previousSanctionNumber",objChit.PreviousSanctionNumber),
			    new MySqlParameter("_previousSanctionDate",objChit.PreviousSanctionDate),
                new MySqlParameter("_CCBNumber",objChit.CCBNumber),
                new MySqlParameter("_CCBDate",objChit.CCBDate),
                new MySqlParameter("_summary",objChit.Summary),
                new MySqlParameter("_registrationNumber",objChit.RegistrationNumber),
                new MySqlParameter("_status",objChit.Status)               
		    };

           return ConnectionFactory.ExecuteUpdate("sp_chitUpdate", System.Data.CommandType.StoredProcedure, parameters);
       }
       /// <summary>
       /// 
       /// </summary>
       /// <returns></returns>
       public List<BE_Chit> GetChits()
       {
           List<BE_Chit> chitList = new List<BE_Chit>();
           using (MySqlDataReader dr = ConnectionFactory.ExecuteCommand("sp_getChitList", System.Data.CommandType.StoredProcedure))
           {

               while (dr.Read())
               {
                   BE_Chit objChit = new BE_Chit();
                   objChit.ChitId = Convert.ToInt32(dr[0]);
                   objChit.ChitName = dr[1].ToString();
                   objChit.NoOfMonths = Convert.ToInt32(dr[2]);
                   objChit.TotalNoOfCustomers = Convert.ToInt32(dr[3]);
                   objChit.ChitValue = Convert.ToDouble(dr[4]);

                   DateTime startdate = Convert.ToDateTime(dr[5]);
                   DateTime strtd = startdate.Date;
                   objChit.ChitGroupStartDate = strtd.ToString("yyyy/mm/dd");


                   DateTime enddate = Convert.ToDateTime(dr[6]);
                   DateTime endd = enddate.Date;
                   objChit.chitGroupEndDate = endd.ToString("yyyy/mm/dd");

                   objChit.chitGroupAuctionDay = dr[7].ToString();
                   objChit.PreviousSanctionNumber = dr[8].ToString();

                   DateTime sanctiondate = Convert.ToDateTime(dr[9]);
                   DateTime sd = sanctiondate.Date;
                   objChit.PreviousSanctionDate = sd.ToString("yyyy/mm/dd");

                   objChit.CCBNumber = dr[10].ToString();

                   DateTime ccbdate = Convert.ToDateTime(dr[11]);
                   DateTime ccbd = ccbdate.Date;
                   objChit.CCBDate = ccbd.ToString("yyyy/mm/dd");


                   objChit.Summary = dr[12].ToString();
                   objChit.RegistrationNumber = dr[13].ToString();
                   objChit.Status = Convert.ToInt16(dr[14]);
                   objChit.UserId = Convert.ToInt32(dr[15]);
                   chitList.Add(objChit);
               }
           }
           return chitList;
       }
       /// <summary>
       /// 
       /// </summary>
       /// <param name="status"></param>
       /// <returns></returns>
       public List<BE_Chit> GetChitDetails(int status)
       {
           List<BE_Chit> chitList = new List<BE_Chit>();
           MySqlParameter[] parameters = new MySqlParameter[]
		    {
			    new MySqlParameter("_status",status)
            };
           using (MySqlDataReader dr = ConnectionFactory.ExecuteCommand("sp_GetChitDetails", System.Data.CommandType.StoredProcedure, parameters))
           {
               while (dr.Read())
               {
                   BE_Chit objChit = new BE_Chit();
                   objChit.ChitId = Convert.ToInt32(dr[0]);
                   objChit.ChitName = dr[1].ToString();
                   objChit.NoOfMonths = Convert.ToInt32(dr[2]);
                   objChit.TotalNoOfCustomers = Convert.ToInt32(dr[3]);
                   objChit.ChitValue = Convert.ToDouble(dr[4]);

                   DateTime startdate = Convert.ToDateTime(dr[5]);
                   DateTime strtd = startdate.Date;
                   objChit.ChitGroupStartDate = strtd.ToString("yyyy/mm/dd");


                   DateTime enddate = Convert.ToDateTime(dr[6]);
                   DateTime endd = startdate.Date;
                   objChit.chitGroupEndDate = endd.ToString("yyyy/mm/dd");

                   objChit.chitGroupAuctionDay = dr[7].ToString();
                   objChit.PreviousSanctionNumber = dr[8].ToString();

                   DateTime sanctiondate = Convert.ToDateTime(dr[9]);
                   DateTime sd = sanctiondate.Date;
                   objChit.PreviousSanctionDate = sd.ToString("yyyy/mm/dd");

                   objChit.CCBNumber = dr[10].ToString();

                   DateTime ccbdate = Convert.ToDateTime(dr[11]);
                   DateTime ccbd = ccbdate.Date;
                   objChit.CCBDate = ccbd.ToString("yyyy/mm/dd");


                   objChit.Summary = dr[12].ToString();
                   objChit.RegistrationNumber = dr[13].ToString();
                   objChit.Status = Convert.ToInt16(dr[14]);
                   objChit.UserId = Convert.ToInt32(dr[15]);
                   chitList.Add(objChit);
               }
           }
           return chitList;
       }
       /// <summary>
       /// 
       /// </summary>
       /// <param name="chitId"></param>
       /// <returns></returns>
       public int GetChitMembers(int chitId)
       {
           MySqlParameter[] parameters = new MySqlParameter[]
		    {
			    new MySqlParameter("_chitId",chitId)
            };
           MySqlDataReader dr = ConnectionFactory.ExecuteCommand("sp_GetChitMembers", System.Data.CommandType.StoredProcedure, parameters);
           dr.Read();
           return dr.GetInt32(0);
       }
       /// <summary>
       /// 
       /// </summary>
       /// <param name="chitId"></param>
       public void CreateFirstInstallment(int chitId)
       {
           MySqlParameter[] parameters = new MySqlParameter[]
		    {
			    new MySqlParameter("_chitId",chitId)
            };
           ConnectionFactory.ExecuteCommand("SP_CreateFirstInstallment", System.Data.CommandType.StoredProcedure);
       }
       /// <summary>
       /// 
       /// </summary>
       /// <param name="chitID"></param>
       /// <returns></returns>
       public DataTable subscriberdocid(int chitID)
       {
           try
           {
               MySqlParameter[] p = new MySqlParameter[1];
               p[0] = new MySqlParameter("_chitId", chitID);
               MySqlDataReader dr = ConnectionFactory.ExecuteCommand("sp_subscriberDocId", System.Data.CommandType.StoredProcedure, p);
               dt = new DataTable();
               dt.Load(dr);
               return dt;
           }
           catch
           {
               throw;
           }
       }
       /// <summary>
       /// 
       /// </summary>
       /// <param name="subscriberDocId"></param>
       /// <param name="installment"></param>
       /// <param name="date"></param>
       public void CreateFirstInstallment(int subscriberDocId, int installment, DateTime date)
       {
           try
           {
               MySqlParameter[] p = new MySqlParameter[3];
               p[0] = new MySqlParameter("_subscriberdocId", subscriberDocId);
               p[1] = new MySqlParameter("_installment", installment);
               p[2] = new MySqlParameter("_date", date);
               int row = ConnectionFactory.ExecuteUpdate("sp_insertmonthlyPaymemt", CommandType.StoredProcedure, p);
           }
           catch
           {
               throw;
           }
       }
 

       //Geting Type of Document Proof from DataBase

       public DataTable GetDocProofType()
       {

           MySqlParameter[] SpParam = new MySqlParameter[0];
           dr = ConnectionFactory.ExecuteStoredProcedure("sp_GetDocumentType", SpParam);
           DataTable dt = new DataTable();
           dt.Load(dr);
           return dt;

       }



      
    }
}
