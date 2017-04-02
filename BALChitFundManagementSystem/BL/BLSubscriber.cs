using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

using MySql.Data.MySqlClient;
using BALChitFundManagementSystem.BE;
using System.Configuration;
using DataAccessLayer;


namespace BALChitFundManagementSystem.BL
{

    public class BLSubscriber
    {

        static MySqlDataReader dr;
        static DataTable dt;
      
     //  string connStr = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
        public MySqlDataReader ChitInstallments(int customerId, int chitId)
        {
            MySqlParameter[] p = new MySqlParameter[2];
            p[0] = new MySqlParameter("_customerId", customerId);
            p[1] = new MySqlParameter("_chitId", chitId);
            dr = ConnectionFactory.ExecuteStoredProcedure("SP_ChitInstallments", p);
            return dr;
        }
        public DataTable GetCustomer(BE_Customer c)
        {
            //ConnectionFactory.connStr = connStr;
            MySqlParameter[] para = { new MySqlParameter("_customerId", MySqlDbType.Int32) { Value = c.CustomerId } };
            dr = ConnectionFactory.ExecuteCommand("GetChitsForCustomer", CommandType.StoredProcedure, para);
            dt = new DataTable();
            dt.Load(dr);
            return dt;
        }
        public MySqlDataReader Getbranch(int bankId)
        {
            MySqlParameter[] p = new MySqlParameter[1];
            p[0] = new MySqlParameter("_bankId", bankId);

            dr = ConnectionFactory.ExecuteStoredProcedure("SP_GetBranchesForBank", p);

            return dr;
        }
        public DataTable GetBankName()
        {
            dr = ConnectionFactory.ExecuteStoredProcedure("SP_GetBankName");
            dt = new DataTable();
            dt.Load(dr);
            return dt;


        }
        public int insertCollectionByCheck(BE_Customer BESubsc, int userId)
        {
            MySqlParameter[] p = new MySqlParameter[10];
            p[0] = new MySqlParameter("_customerNo", BESubsc.CustomerId);
            p[1] = new MySqlParameter("_receiptNumber", BESubsc.receiptNumber);
            p[2] = new MySqlParameter("_dateOfPayment", BESubsc.dateOfPayment);
            p[3] = new MySqlParameter("_amountCollected", BESubsc.amountCollected);
            p[4] = new MySqlParameter("_dateOfEntry", BESubsc.dateOfEntry);
            p[5] = new MySqlParameter("_checkNumber", BESubsc.checkNumber);
            p[6] = new MySqlParameter("_branchId", BESubsc.branchId);
            p[7] = new MySqlParameter("_DOIssue", BESubsc.DOIssue);
            p[8] = new MySqlParameter("validUpTo", BESubsc.validUpTo);
            p[9] = new MySqlParameter("_userID", userId);

            int i = ConnectionFactory.ExecuteUpdate("SP_insertCollectionByCheck", CommandType.StoredProcedure, p);

            return i;

        }
        public int insertCollectionByCash(BE.BE_Customer BESubsc, int userId)
        {
            MySqlParameter[] p = new MySqlParameter[6];
            p[0] = new MySqlParameter("_customerNo", BESubsc.CustomerId);
            p[1] = new MySqlParameter("_receiptNumber", BESubsc.receiptNumber);
            p[2] = new MySqlParameter("_dateOfPayment", BESubsc.dateOfPayment);
            p[3] = new MySqlParameter("_amountCollected", BESubsc.amountCollected);
            p[4] = new MySqlParameter("_dateOfEntry", BESubsc.dateOfEntry);




            p[5] = new MySqlParameter("_userID", userId);

            int i = ConnectionFactory.ExecuteUpdate("SP_insertCollectionByCash", CommandType.StoredProcedure, p);

            return i;

        }
        public DataTable GetBalance(BE_Customer c)
        {
            //ConnectionFactory.connStr = connStr;
            MySqlParameter[] para = { new MySqlParameter("_customerId", MySqlDbType.Int32) { Value = c.CustomerId } };
            dr = ConnectionFactory.ExecuteCommand("sp_GetBalance", CommandType.StoredProcedure, para);
            dt = new DataTable();
            dt.Load(dr);
            return dt;



        }
       

        public int PayForChit(BE_Customer c, MonthlyInstallment objMonthlyInstallment, int chitId)
        {
           // ConnectionFactory.connStr = connStr;
            MySqlParameter[] p = new MySqlParameter[4];
            p[0] = new MySqlParameter("_customerId", c.CustomerId);
            p[1] = new MySqlParameter("_chitId", chitId);
            p[2] = new MySqlParameter("_due", objMonthlyInstallment.due);
            p[3] = new MySqlParameter("_date", objMonthlyInstallment.date);

            int i = ConnectionFactory.ExecuteUpdate("SP_PayForChit", CommandType.StoredProcedure, p);
            return i;
        }
        public MySqlDataReader Auto(BE_Customer be)
        {
            try
            {
               // ConnectionFactory.connStr = connStr;
                MySqlParameter[] my ={
            new MySqlParameter("_str",MySqlDbType.VarChar){Value=be.CustomerName}};
                return ConnectionFactory.ExecuteCommand("sp_autocomplate", CommandType.StoredProcedure, my);
            }
            catch
            {
                throw;
            }
        }

        public MySqlDataReader display(BE_Customer be)
        {
            try
            {
              //  ConnectionFactory.connStr = connStr;
                MySqlParameter[] my = { new MySqlParameter("id", MySqlDbType.VarChar) { Value = be.CustomerId } };
                return ConnectionFactory.ExecuteCommand("sp_DisplayCustInfo", CommandType.StoredProcedure, my);
            }
            catch
            {
                throw;
            }
        }

        public MySqlDataReader getSubscriber(BE_Customer be)
        {
            try
            {
               // ConnectionFactory.connStr = connStr;
                MySqlParameter[] my = { new MySqlParameter("cid", MySqlDbType.VarChar) { Value = be.CustomerId } };
                return ConnectionFactory.ExecuteCommand("sp_GetSubscriber", CommandType.StoredProcedure, my);
            }
            catch
            {
                throw;
            }
        }
        public MySqlDataReader GetStateName()
        {
            try
            {
               // ConnectionFactory.connStr = connStr;
                return ConnectionFactory.ExecuteCommand("sp_getStateName", CommandType.StoredProcedure);
            }
            catch
            {
                throw;
            }
        }

        public MySqlDataReader GetCityName(BE_Customer be)
        {
            try
            {
               // ConnectionFactory.connStr = connStr;
                MySqlParameter[] my = { new MySqlParameter("_sid", MySqlDbType.VarChar) { Value = be.CustomerId } };
                return ConnectionFactory.ExecuteCommand("sp_GetCity", CommandType.StoredProcedure, my);
            }
            catch
            {
                throw;
            }

        }
        public MySqlDataReader GetCity(BE_State be)
        {
            try
            {
                // ConnectionFactory.connStr = connStr;
                MySqlParameter[] my = { new MySqlParameter("_sid", MySqlDbType.VarChar) { Value = be.StateId } };
                return ConnectionFactory.ExecuteCommand("sp_GetCity", CommandType.StoredProcedure, my);
            }
            catch
            {
                throw;
            }

        }

        public MySqlDataReader GetAddProof(BE_Customer be)
        {
            try
            {
               // ConnectionFactory.connStr = connStr;
                MySqlParameter[] my = { new MySqlParameter("cid", MySqlDbType.Int32) { Value = be.CustomerId } };
                return ConnectionFactory.ExecuteCommand("sp_GetAddProof", CommandType.StoredProcedure, my);
            }
            catch
            {
                throw;
            }
        }

        public MySqlDataReader GetIdProof(BE_Customer be)
        {
            try
            {
                //connectionFactory.connStr = connStr;
                MySqlParameter[] my = { new MySqlParameter("cid", MySqlDbType.Int32) { Value = be.CustomerId } };
                return ConnectionFactory.ExecuteCommand("sp_GetIdProof", CommandType.StoredProcedure, my);
            }
            catch
            {
                throw;
            }
        }
        public MySqlDataReader GetAddType()
        {
            try
            {
                //ConnectionFactory.connStr = connStr;
                return ConnectionFactory.ExecuteCommand("sp_GetAddProofType", CommandType.StoredProcedure);
            }
            catch
            {
                throw;
            }
        }

        public MySqlDataReader GetIdType()
        {
            try
            {
                //ConnectionFactory.connStr = connStr;
                return ConnectionFactory.ExecuteCommand("sp_GetIdProofType", CommandType.StoredProcedure);
            }
            catch
            {
                throw;
            }
        }

        public int insertData(BE_Customer obj)
        {
            try
            {
                //ConnectionFactory.connStr = connStr;
                MySqlParameter[] my ={new MySqlParameter("_customerid",MySqlDbType.Int32){Value=obj.CustomerId},
                                         new MySqlParameter("_Name",MySqlDbType.VarChar){Value=obj.CustomerName},
            new MySqlParameter("_dob",MySqlDbType.Date){Value=obj.DOB},
            new MySqlParameter("_mobno",MySqlDbType.VarChar){Value=obj.MobileNo},
            new MySqlParameter("_amono",MySqlDbType.VarChar){Value=obj.AlternateMobileNo},
            new MySqlParameter("_sp",MySqlDbType.VarChar){Value=obj.Spouse},
            new MySqlParameter("_eid",MySqlDbType.VarChar){Value=obj.EmailId},
            new MySqlParameter("_cp",MySqlDbType.VarChar){Value=obj.ContactPerson},
            new MySqlParameter("_aid",MySqlDbType.Int32){Value=obj.AddressId},
            new MySqlParameter("_area",MySqlDbType.VarChar){Value=obj.Area},
            new MySqlParameter("_street",MySqlDbType.VarChar){Value=obj.Street},
            new MySqlParameter("_zip",MySqlDbType.Int32){Value=obj.Zip},
            new MySqlParameter("_cityid",MySqlDbType.Int32){Value=obj.cityid},
            new MySqlParameter("_img",MySqlDbType.Blob){Value=obj.Imgage},
            new MySqlParameter("_iptid",MySqlDbType.Int32){Value=obj.IdpTypeId},
            new MySqlParameter("_idimg",MySqlDbType.Blob){Value=obj.Docid},
            new MySqlParameter("_addptid",MySqlDbType.Int32){Value=obj.AddresspTypeId},
            new MySqlParameter("_addimg",MySqlDbType.Blob){Value=obj.Doc}};
                return ConnectionFactory.ExecuteUpdate("sp_updateCustomer", CommandType.StoredProcedure, my);
            }
            catch
            {
                throw;
            }
        }

    }
}
