using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using MySql.Data.MySqlClient;
using System.IO;
using System.Data;
using BALChitFundManagementSystem.BE;

namespace BALChitFundManagementSystem.BL
{
    public class BLRegistration
    {
           MySqlDataReader objReader;
        public string GetFirstName(BE.BE_User objUser)
        {
            try
            {
                MySqlParameter[] SpParam = new MySqlParameter[1];
                SpParam[0] = new MySqlParameter("_PloginId", objUser.LoginId);
                objReader = ConnectionFactory.ExecuteStoredProcedure("sp_GetFirstName", SpParam);
                objReader.Read();
                return objReader[0].ToString();
            }
            catch
            {
                throw;
            }
        }
        public string UpdateUserProfile(BE.BE_User objUser, BE.BE_Address objAddress, BE.BE_City objCity, BE.BE_State objState)
        {
            try
            {
                MySqlParameter[] SpParam = new MySqlParameter[12];
                SpParam[0] = new MySqlParameter("_userId", objUser.UserId);
                SpParam[1] = new MySqlParameter("_Pimage", objUser.Image);
                SpParam[2] = new MySqlParameter("_PfirstName", objUser.FirstName);
                SpParam[3] = new MySqlParameter("_PmiddleName", objUser.MiddleName);
                SpParam[4] = new MySqlParameter("_PlastName", objUser.LastName);
                SpParam[5] = new MySqlParameter("_PmobileNo", objUser.MobileNo);
                SpParam[6] = new MySqlParameter("_PhouseNo", objAddress.HouseNo);
                SpParam[7] = new MySqlParameter("_Parea", objAddress.Area);
                SpParam[8] = new MySqlParameter("_Pstreet", objAddress.Street);
                SpParam[9] = new MySqlParameter("_Pzip", objAddress.Zip);
                SpParam[10] = new MySqlParameter("_Pcity", objCity.CityName);
                SpParam[11] = new MySqlParameter("_Pstate", objState.StateName);
                ConnectionFactory.ExecuteStoredProcedure("sp_UpdateUserDetails", SpParam);
                return "Success";
            }
            catch
            {
                throw;
            }
        }
        public MySqlDataReader GetUserProfileById(BE.BE_User objUser)
        {
            try
            {
                MySqlParameter[] SpParam = new MySqlParameter[1];
                SpParam[0] = new MySqlParameter("_userId", objUser.UserId);
                return ConnectionFactory.ExecuteStoredProcedure("sp_GetUserDetails", SpParam);
            }
            catch
            {
                throw;
            }
        }
        public BE.BE_Names authentication(BE.BE_Login objLogin)
        {
            try
            {

                MySqlParameter[] SpParam = new MySqlParameter[2];
                SpParam[0] = new MySqlParameter("_PloginId", objLogin.LoginId);
                SpParam[1] = new MySqlParameter("_Ppassword", objLogin.Password);
                objReader = ConnectionFactory.ExecuteStoredProcedure("sp_authentication", SpParam);
                BE.BE_Names objNames = new BE.BE_Names();
                objReader.Read();
                objNames.UserName = objReader[0].ToString();
                objNames.RoleName = objReader[1].ToString();
                objNames.userId = Convert.ToInt32(objReader[2]);
                return objNames;
            }
            catch
            {
                throw;
            }
        }
        public BE.BE_Login ForgetPassword(BE.BE_User objUser)
        {
            try
            {
                MySqlParameter[] SpParam = new MySqlParameter[3];
                SpParam[0] = new MySqlParameter("_PloginId", objUser.LoginId);
                SpParam[1] = new MySqlParameter("_PsecurityQuestionId", objUser.SecurityQuestionId);
                SpParam[2] = new MySqlParameter("_PsecurityAnswer", objUser.SecurityAnswer);
                objReader = ConnectionFactory.ExecuteStoredProcedure("sp_ForgetPassword", SpParam);
                BE.BE_Login objLogin = new BE.BE_Login();
                objReader.Read();
                objLogin.Password = objReader[0].ToString();
                return objLogin;
            }
            catch
            {
                throw;
            }
        }
        public string ChangePassword(BE.BE_Login objLogin)
        {
            try
            {
                MySqlParameter[] SpParam = new MySqlParameter[3];
                SpParam[0] = new MySqlParameter("_PloginId", objLogin.LoginId);
                SpParam[1] = new MySqlParameter("_PoldPasword", objLogin.OldPassword);
                SpParam[2] = new MySqlParameter("_PNewPasword", objLogin.Password);
                objReader = ConnectionFactory.ExecuteStoredProcedure("sp_ChangePassword", SpParam);
                objReader.Read();
                if (Convert.ToInt32(objReader[0]) == 1)
                    return "Your Password has been changed successfully";
                else
                    return "Give correct information";
            }
            catch
            {
                throw;
            }
        }
        public void RegisterAddress(BE_City objCity, BE.BE_Address objAddress)
        {
            MySqlParameter[] SpParam = new MySqlParameter[5];
              
            SpParam[0] = new MySqlParameter("_cityId", objCity.CityId);
            SpParam[1] = new MySqlParameter("_area", objAddress.Area);
            SpParam[2] = new MySqlParameter("_houseNo", objAddress.HouseNo);
            SpParam[3] = new MySqlParameter("_street", objAddress.Street);
            SpParam[4] = new MySqlParameter("_zip", objAddress.Zip);
            ConnectionFactory.ExecuteStoredProcedure("sp_CustomerAddress", SpParam);
        }
        public void UserRegistration(BE.BE_User objUser)
        {
            try
            {
                MySqlParameter[] SpParam = new MySqlParameter[12];
                SpParam[0] = new MySqlParameter("_PfirstName", objUser.FirstName);
                SpParam[1] = new MySqlParameter("_PmiddleName", objUser.MiddleName);
                SpParam[2] = new MySqlParameter("_PlastName", objUser.LastName);
                SpParam[3] = new MySqlParameter("_PmobileNo", objUser.MobileNo);
                SpParam[4] = new MySqlParameter("_PloginId", objUser.LoginId);
                SpParam[5] = new MySqlParameter("_Ppassword", objUser.Password);
                SpParam[6] = new MySqlParameter("_Pgender", objUser.Gender);
                SpParam[7] = new MySqlParameter("_Pdob", objUser.DOB);
                SpParam[8] = new MySqlParameter("_PuserTypeId", objUser.UserTypeId);
                SpParam[9] = new MySqlParameter("_PsecurityQuestionId", objUser.SecurityQuestionId);
                SpParam[10] = new MySqlParameter("_PsecurityAnswer", objUser.SecurityAnswer);
                SpParam[11] = new MySqlParameter("_Pimage", objUser.Image);
                
               
                ConnectionFactory.ExecuteStoredProcedure("sp_Registration", SpParam);
            }
            catch
            {
                throw;
            }
        }
        public DataTable GetQuestions()
        {
            try
            {

                MySqlParameter[] SpParam = new MySqlParameter[0];
                objReader= ConnectionFactory.ExecuteStoredProcedure("sp_GetQuestions", SpParam);
                DataTable dt = new DataTable();
                dt.Load(objReader);
                return dt;
            }
            catch
            {
                throw;
            }
        }
        //Register Customer
         public int InsertCustomer(BE_Customer c,BE_Address a)
       {
          // ConnectionFactory.connStr = connStr;
           MySqlParameter[] para={new MySqlParameter("name",MySqlDbType.VarChar){Value=c.CustomerName},
                                new MySqlParameter("dateOfBirth",MySqlDbType.DateTime){Value=c.DOB},
                                    new MySqlParameter("dateOfJoin",MySqlDbType.DateTime){Value=c.DOJ},
                                        new MySqlParameter("mobNo",MySqlDbType.VarChar){Value=c.MobileNo},
                                            new MySqlParameter("alterNo",MySqlDbType.VarChar){Value=c.AlternateMobileNo},
                                                new MySqlParameter("spou",MySqlDbType.VarChar){Value=c.Spouse},
                                                    new MySqlParameter("email",MySqlDbType.VarChar){Value=c.EmailId},
                                                    new MySqlParameter("contPerson",MySqlDbType.VarChar){Value=c.ContactPerson},
                                                new MySqlParameter("addId",MySqlDbType.Int32){Value=c.AddressId},
                                 
                                 new MySqlParameter("areaName",MySqlDbType.VarChar){Value=a.Area},
                                new MySqlParameter("house",MySqlDbType.VarChar){Value=a.HouseNo},
                                    new MySqlParameter("st",MySqlDbType.VarChar){Value=a.Street},
                                        new MySqlParameter("cId",MySqlDbType.Int32){Value=a.CityId},
                                            new MySqlParameter("zipCode",MySqlDbType.Int32){Value=a.Zip},};
           return ConnectionFactory.ExecuteUpdate("sp_insertCustomer", CommandType.StoredProcedure, para);
       }
       public MySqlDataReader GetStates()
       {
           //ConnectionFactory.connStr = connStr;
           return ConnectionFactory.ExecuteCommand("sp_selectState", CommandType.StoredProcedure);
       }

       public MySqlDataReader GetCity(BE_State objState)
       { MySqlParameter[] para = new MySqlParameter[1];
          // connectionFactory.connStr = connStr;
           para[0]=new MySqlParameter("_stateId",objState.StateId);
            return ConnectionFactory.ExecuteCommand("sp_selectCity", CommandType.StoredProcedure, para);
       }

        //Register New and Update Enquiry Customer

          public MySqlDataReader display(BE_Customer be)
       {
           try
           {
               MySqlParameter[] my = { new MySqlParameter("id", MySqlDbType.Int32) { Value = be.CustomerId } };
               return ConnectionFactory.ExecuteCommand("sp_DisplayCustInfo", CommandType.StoredProcedure, my);
           }
           catch
           {
               throw;
           }
       }
          public int insertNewCustomer(BE_Customer cust, BE_IdProofType objIdProofType, BE_CustomerIdProof objCustomerIdProof, BE_City objCity)
       {
           MySqlParameter[] para ={new MySqlParameter("_areaName",MySqlDbType.VarChar){Value=cust.Area},
                                   new MySqlParameter("_house",MySqlDbType.VarChar){Value=cust.Houseno},
                                   new MySqlParameter("_st",MySqlDbType.VarChar){Value=cust.Street},
                                   new MySqlParameter("_cId",MySqlDbType.Int32){Value=objCity.CityId},
                                   new MySqlParameter("_zipCode",MySqlDbType.Int32){Value=cust.ZipNo},
                                   new MySqlParameter("_name",MySqlDbType.VarChar){Value=cust.CustomerName},
                                      new MySqlParameter("_dateOfBirth",MySqlDbType.Date){Value=cust.DOB},
                                                    new MySqlParameter("_dateOfJoin",MySqlDbType.Date){Value=cust.DOJ},
                                                new MySqlParameter("_mobNo",MySqlDbType.VarChar){Value=cust.MobileNo},
                                 new MySqlParameter("_alterNo",MySqlDbType.VarChar){Value=cust.AlternateMobileNo},
                                new MySqlParameter("_spou",MySqlDbType.VarChar){Value=cust.Spouse},
                                    new MySqlParameter("_email",MySqlDbType.VarChar){Value=cust.EmailId},
                                        new MySqlParameter("_contPerson",MySqlDbType.VarChar){Value=cust.ContactPerson},
                                            new MySqlParameter("_idProofId",MySqlDbType.Int32){Value=objIdProofType.IdProofId},
                                  new MySqlParameter("_idProofDoc",MySqlDbType.Blob){Value=objIdProofType.IdProofDoc},
                                  new MySqlParameter("_addressProofId",MySqlDbType.Int32){Value=objCustomerIdProof.AddressProofId},
                                  new MySqlParameter("_addressProofDoc",MySqlDbType.Blob){Value=objCustomerIdProof.AddressProofDoc},
                                  new MySqlParameter("_image",MySqlDbType.Blob){Value=cust.Imgage},
           new MySqlParameter("_userId",MySqlDbType.Int32){Value=cust.UserID}
                                  };
           
           return ConnectionFactory.ExecuteUpdate("sp_insertNewCustomer", CommandType.StoredProcedure, para);
       }
    
     public MySqlDataReader Auto(BE_Customer cust)
       {
           try
           {
               MySqlParameter[] my ={new MySqlParameter("_str",MySqlDbType.VarChar){Value=cust.CustomerName}};
               return ConnectionFactory.ExecuteCommand("sp_getCustomer", CommandType.StoredProcedure, my);
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
     public int UpdateNewCustomer(BE_Customer cust, BE_IdProofType objIdProofType, BE_CustomerIdProof objCustomerIdProof,BE_City objCity)
     {
         try
         {
             MySqlParameter[] para ={new MySqlParameter("_customerid",MySqlDbType.Int32){Value=cust.CustomerId},
                                   new MySqlParameter("_name",MySqlDbType.VarChar){Value=cust.CustomerName},
                                   new MySqlParameter("_dob",MySqlDbType.Date){Value=cust.DOB},
                                   new MySqlParameter("_mobno",MySqlDbType.VarChar){Value=cust.MobileNo},
                                   new MySqlParameter("_amono",MySqlDbType.VarChar){Value=cust.AlternateMobileNo},
                                   new MySqlParameter("_sp",MySqlDbType.VarChar){Value=cust.Spouse},
                                      new MySqlParameter("_eid",MySqlDbType.VarChar){Value=cust.EmailId},
                                                    new MySqlParameter("_cp",MySqlDbType.VarChar){Value=cust.ContactPerson},
                                                new MySqlParameter("_aid",MySqlDbType.Int32){Value=cust.AddressId},
                                 new MySqlParameter("_area",MySqlDbType.VarChar){Value=cust.Area},
                                new MySqlParameter("_houseNo",MySqlDbType.VarChar){Value=cust.Houseno},
                                    new MySqlParameter("_street",MySqlDbType.VarChar){Value=cust.Street},
                                        new MySqlParameter("_zip",MySqlDbType.Int32){Value=cust.ZipNo},
                                        new MySqlParameter("_userId",MySqlDbType.Int32){Value=cust.UserID},
                                        new MySqlParameter("_idProofId",MySqlDbType.Int32){Value=objIdProofType.IdProofId},
                                        new MySqlParameter("_idProofDoc",MySqlDbType.Blob){Value=objIdProofType.IdProofDoc},
                                        new MySqlParameter("_addressProofId",MySqlDbType.Int32){Value=objCustomerIdProof.AddressProofId},
                                        new MySqlParameter("_addressProofDoc",MySqlDbType.Blob){Value=objCustomerIdProof.AddressProofDoc},
                                        new MySqlParameter("_image",MySqlDbType.Blob){Value=cust.Imgage},
                                            new MySqlParameter("_cityid",MySqlDbType.Int32){Value=objCity.CityId}};
             return ConnectionFactory.ExecuteUpdate("sp_updateNewCustomer", CommandType.StoredProcedure, para);
         }
         catch
         {
             throw;
         }
     }
   }


    }

    