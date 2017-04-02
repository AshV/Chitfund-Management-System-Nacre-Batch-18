using DataAccessLayer;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BALChitFundManagementSystem.BE;
namespace BALChitFundManagementSystem.BL
{
    public class BLReport
    {
        MySqlDataReader dr;

        public MySqlDataReader AdminById(BEAdmin objAdmin)
        {
            DataTable dt = new DataTable();
            MySqlParameter[] SpParam = new MySqlParameter[1];
            SpParam[0] = new MySqlParameter("id", objAdmin.AdminId);
            return ConnectionFactory.ExecuteStoredProcedure("Sp_Particlaradmin", SpParam);
            
        }
        public MySqlDataReader AdminByAll()
        {
            //DataTable dt = new DataTable();
            //MySqlParameter[] SpParam = new MySqlParameter[0];
            return ConnectionFactory.ExecuteCommand("Sp_Alladmindt", CommandType.StoredProcedure);
            //dt.Load(dr);
            //return dt;
        }
        public DataTable AdminDDLList()
        {
            DataTable dt = new DataTable();
            dr = ConnectionFactory.ExecuteCommand("Sp_AdminImp", CommandType.StoredProcedure);
            dt.Load(dr);
            return dt;
        }

        public DataTable AgentDDLList()
        {
            DataTable dt = new DataTable();
            dr = ConnectionFactory.ExecuteCommand("Sp_Agent", CommandType.StoredProcedure);
            dt.Load(dr);
            return dt;
        }
        public MySqlDataReader AgentById(BEAgent objAgent)
        {
            DataTable dt = new DataTable();
            MySqlParameter[] SpParam = new MySqlParameter[1];
            SpParam[0] = new MySqlParameter("id", objAgent.AgentId);
            return ConnectionFactory.ExecuteStoredProcedure("Sp_particularagent", SpParam);
           
        }
        public MySqlDataReader AgentByAll()
        {
            //DataTable dt = new DataTable();
            //MySqlParameter[] SpParam = new MySqlParameter[0];
            return ConnectionFactory.ExecuteCommand("SP_allagentdt", CommandType.StoredProcedure);

            //dr = connectionFactory.ExecuteStoredProcedure("SP_allagentdt", SpParam);
            //dt.Load(dr);
            //return dt;
        }

        public DataTable GetAllSubscibers()
        {
            DataTable dt = new DataTable();
            dr = ConnectionFactory.ExecuteCommand("Sp_allsubscriber",CommandType.StoredProcedure);
            dt.Load(dr);
            return dt;
        }
        public DataTable GeTSubscriberById(BE_Subscriber objSubscriber)
        {
            DataTable dt = new DataTable();
            MySqlParameter[] SpParam = new MySqlParameter[1];
            SpParam[0] = new MySqlParameter("_customerid", objSubscriber.SubscriberId);
            dr = ConnectionFactory.ExecuteStoredProcedure("Sp_pcularsubscriber", SpParam);
            dt.Load(dr);
            return dt;
        }
        public DataTable SubsciberByAgent(BEAgent objAgent)
        {
            DataTable dt = new DataTable();
            MySqlParameter[] SpParam = new MySqlParameter[1];

            SpParam[0] = new MySqlParameter("id", objAgent.AgentId);
            dr = ConnectionFactory.ExecuteStoredProcedure("Sp_SubDetails", SpParam);
            dt.Load(dr);
            return dt;
        }
        public DataTable SubsciberByArea(BE_Area objArea)
        {
            DataTable dt = new DataTable();
            MySqlParameter[] SpParam = new MySqlParameter[1];
            SpParam[0] = new MySqlParameter("_Areaid", objArea.AreaId);
            dr = ConnectionFactory.ExecuteStoredProcedure("Sp_area", SpParam);
            dt.Load(dr);
            return dt;
        }
        public DataTable SubscriberByDue()
        {
            DataTable dt = new DataTable();
            dr = ConnectionFactory.ExecuteCommand("Sp_Duesubscriber",CommandType.StoredProcedure);
            dt.Load(dr);
            return dt;
        }

        public MySqlDataReader OperatorById(BEOperator objOperator)
        {
            DataTable dt = new DataTable();

            MySqlParameter[] SpParam = new MySqlParameter[1];
            SpParam[0] = new MySqlParameter("uid", objOperator.OperatorId);
            return ConnectionFactory.ExecuteStoredProcedure("Sp_ShowOperatorDtl", SpParam);
           
        }
        public MySqlDataReader OperatorByAll()
        {
            DataTable dt = new DataTable();
            return ConnectionFactory.ExecuteCommand("Sp_GetOperators", CommandType.StoredProcedure);
            
        }
        public DataTable OperatorDDLList()
        {
            DataTable dt = new DataTable();
            dr = ConnectionFactory.ExecuteCommand("SP_GetOperatorName", CommandType.StoredProcedure);
            dt.Load(dr);
            return dt;
        }
        public DataTable AreaDDLList()
        {
            DataTable dt = new DataTable();
            dr = ConnectionFactory.ExecuteCommand("Sp_areaddl", CommandType.StoredProcedure);
            dt.Load(dr);
            return dt;
        }


//  chit-----------------------------------------------------/////////////////////////////////////////////////////////////


        public DataTable ChitAmount(BE_Chit objChit)
        {
            DataTable dt = new DataTable();
            MySqlParameter[] SpParam = new MySqlParameter[1];
            SpParam[0] = new MySqlParameter("amount", objChit);
            dr = ConnectionFactory.ExecuteStoredProcedure("Sp_chitAmount", SpParam);
            dt.Load(dr);
            return dt;
        }
        
        public DataTable ActiveChit()
        {
            DataTable dt = new DataTable();
            dr = ConnectionFactory.ExecuteCommand("sp_rpActiveChit", CommandType.StoredProcedure);
            dt.Load(dr);
            return dt;
        }
        public DataTable InActiveChit()
        {
            DataTable dt = new DataTable();
            dr = ConnectionFactory.ExecuteCommand("sp_RepInActiveChit", CommandType.StoredProcedure);
            dt.Load(dr);
            return dt;
        }
        public DataTable monthlyamountcollection(BE.BE_Collection objBECollection)
        {
            DataTable dt = new DataTable();

            MySqlParameter[] SpParam = new MySqlParameter[1];
            SpParam[0] = new MySqlParameter("YEAR", objBECollection.collect);
            dr = ConnectionFactory.ExecuteStoredProcedure("sp_OnMonthlyAmountCollection", SpParam);
            dt.Load(dr);
            return dt;
        }

        public DataTable yearlyamountcollection(BE_Collection objBECollection)
        {
            DataTable dt = new DataTable();

            MySqlParameter[] SpParam = new MySqlParameter[1];
            SpParam[0] = new MySqlParameter("yr", objBECollection.collect);
            dr = ConnectionFactory.ExecuteStoredProcedure("sp_reportOnYearlyAmountCollection", SpParam);
            dt.Load(dr);
            return dt;
        }
    }
}
