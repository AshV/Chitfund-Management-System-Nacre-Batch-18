using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace DataAccessLayer
{
   public class ConnectionFactory
    {
        public static string connStr = "Database";
        static MySqlConnection conn;
        static MySqlCommand cmd;
        static DataTable dt = new DataTable();
        public static MySqlConnection openConnection()
        {
            try
            {
                if (conn != null && conn.State == ConnectionState.Open)
                {
                    conn.Close();
                    conn = new MySqlConnection();

                    ConnectionStringSettings connStrSettings = ConfigurationManager.ConnectionStrings[connStr];
                    conn.ConnectionString = connStrSettings.ConnectionString;
                    conn.Open();
                    return conn;

                }
                else
                {

                    conn = new MySqlConnection();

                    ConnectionStringSettings connStrSettings = ConfigurationManager.ConnectionStrings[connStr];
                    conn.ConnectionString = connStrSettings.ConnectionString;
                    conn.Open();
                    return conn;
                }
            }
            catch
            {
                throw;
            }
        }

        public static bool closeConnection(MySqlConnection conn)
        {
            try
            {

                if (conn != null && conn.State == System.Data.ConnectionState.Open)
                {
                    conn.Close();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                throw;
            }
        }

        public static MySqlDataReader ExecuteStoredProcedure(string SPName,params MySqlParameter[] SpParam)
        {
            try
            {
                return ExecuteCommand(SPName, CommandType.StoredProcedure, SpParam);
            }
            catch
            {
                throw;
            }

        }

        public static MySqlDataReader ExecuteCommand(string Text, CommandType CmdType, params MySqlParameter[] SpParam)
        {
            try
            {
                MySqlDataReader _reader;
                cmd = new MySqlCommand();
                cmd.Connection = openConnection();
                cmd.CommandText = Text;     //Assign the SP Name to Command Object
                cmd.CommandType = CmdType;  //Assign the SP Type to Command Object

                foreach (object param in SpParam)   //Assign the SP Parameters to Command Parameters Object
                    cmd.Parameters.Add(param);
                //  MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                _reader = cmd.ExecuteReader();  //Execute the SP 

                // da.Fill(dt);
                return _reader;
            }
            catch
            {
                throw;
            }
        }

        public static int ExecuteUpdate(string Text, CommandType CmdType, params MySqlParameter[] SpParam)
        {
            try
            {
                cmd = new MySqlCommand();
                cmd = new MySqlCommand();
                cmd.Connection = openConnection();
                cmd.CommandText = Text;//Assign the SP Name to Command Object
                cmd.CommandType = CmdType; //Assign the SP Type to Command Object
                foreach (object param in SpParam)
                    cmd.Parameters.Add(param); //Assign the SP Parameters to Command Parameters Object
                int result = cmd.ExecuteNonQuery(); //Execute the SP 
                return result;
            }
            catch
            {
                throw;
            }
        }

        public static MySqlDataReader ExecuteCommand(string Text, CommandType CmdType)
        {
            try
            {

                MySqlDataReader _reader;
                cmd = new MySqlCommand();
                cmd.Connection = openConnection();
                cmd.CommandText = Text;     //Assign the SP Name to Command Object
                cmd.CommandType = CmdType;  //Assign the SP Type to Command Object

                _reader = cmd.ExecuteReader();  //Execute the SP 
                //dt.Load(_reader);
                //_reader.Close();
                //return dt;
                return _reader;
            }
            catch
            {
                throw;
            }

        }
    }
}

