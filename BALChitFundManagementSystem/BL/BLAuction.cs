using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DataAccessLayer;
using BAL.BL;
using MySql.Data.MySqlClient;
using MySql.Data;


namespace BAL.BL
{
    public class BLAuction
    {
        MySqlDataReader dr;
        DataTable dt;
      //  SubscriberIdBE be = new SubscriberIdBE();
        public DataTable GetChitName()
        {
            try
            {
                //dr = .ExecuteCommand("sp_getChitId", CommandType.StoredProcedure);
                dr = ConnectionFactory.ExecuteCommand("sp_GetChitIdName", CommandType.StoredProcedure);
                dt = new DataTable();
                dt.Load(dr);
                return dt;
            }
            catch
            {
                throw;
            }

        }
        public DataTable auctionNo(int chitid)
        {
            try
            {
                MySqlParameter[] p = new MySqlParameter[1];
                p[0] = new MySqlParameter("_chitId", chitid);
                dr = ConnectionFactory.ExecuteCommand("sp_auctionNo", CommandType.StoredProcedure, p);
                dt = new DataTable();
                dt.Load(dr);
                return dt;
            }
            catch
            {
                throw;
            }

        }
        public DataTable chitValue(int chitId)
        {
            try
            {
                MySqlParameter[] p = new MySqlParameter[1];
                p[0] = new MySqlParameter("_chitId", chitId);
                dr = ConnectionFactory.ExecuteCommand("sp_chitValue", CommandType.StoredProcedure, p);
                dt = new DataTable();
                dt.Load(dr);
                return dt;
            }
            catch
            {
                throw;
            }
        }

        public DataTable getcustomerId(int chitID)
        {
            try
            {
                MySqlParameter[] p = new MySqlParameter[1];
                p[0] = new MySqlParameter("_chitId", chitID);
                dr = ConnectionFactory.ExecuteCommand("sp_getCustomerId", CommandType.StoredProcedure, p);
                dt = new DataTable();
                dt.Load(dr);
                return dt;
            }
            catch
            {
                throw;
            }
        }
       
        public int insertData(double paidAmount, double divident, DateTime auctionDate, double companyProfit, int auctionNo, int chitId,int customerId)
        {
            try
            {
                MySqlParameter[] p = new MySqlParameter[7];
                p[0] = new MySqlParameter("_paidAmount", paidAmount);
                p[1] = new MySqlParameter("_divident", divident);
                p[2] = new MySqlParameter("_auctionDate", auctionDate);
                p[3] = new MySqlParameter("_companyProfit", companyProfit);
                p[4] = new MySqlParameter("_auctionNo", auctionNo);
                p[5] = new MySqlParameter("_chitId", chitId);
                p[6] = new MySqlParameter("_customerId", customerId);
                int row = ConnectionFactory.ExecuteUpdate("sp_insertAuction", CommandType.StoredProcedure, p);
                return row;
            }
            catch
            {
                throw;
            }
        }

        public DataTable subscriberdocid(int chitID)
        {
            try
            {
                MySqlParameter[] p = new MySqlParameter[1];
                p[0] = new MySqlParameter("_chitId", chitID);
                dr = ConnectionFactory.ExecuteCommand("sp_subscriberDocId", CommandType.StoredProcedure, p);
                dt = new DataTable();
                dt.Load(dr);
                return dt;
            }
            catch
            {
                throw;
            }
        }
        public int insertMonthlypayment(int subscriberdocId,double installment,DateTime date)
        {
            try
            {
                MySqlParameter[] p = new MySqlParameter[3];
                p[0] = new MySqlParameter("_subscriberdocId", subscriberdocId);
                p[1] = new MySqlParameter("_installment", installment);
                p[2] = new MySqlParameter("_date", date);
                int row = ConnectionFactory.ExecuteUpdate("sp_insertmonthlyPaymemt", CommandType.StoredProcedure, p);
                return row;
            }
            catch
            {
                throw;
            }
        }
    }
}
