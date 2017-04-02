using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALChitFundManagementSystem.BE
{
   public class BE_Customer
    {

        public int CustomerId { get; set; }
        public string CustomerName { get; set; }
        public string DOB { get; set; }
        public string DOJ { get; set; }
        public string MobileNo { get; set; }
        public string EmailId { get; set; }
      
        public string AlternateMobileNo { set; get; }
        public string Spouse { set; get; }
        //public string Emailid { set; get; }
        public string ContactPerson { set; get; }
        public string AddressId { set; get; }
        public string cityid { set; get; }
        public string stateid { set; get; }
        public int PStateID { set; get; }
        public string AddresspTypeId { set; get; }
        public string IdpTypeId { set; get; }
        public string StateName { set; get; }
        public byte[] Imgage { set; get; }
        public byte[] Doc{ set; get; }
        public byte[] Docid { set; get; }
        public string Area { set; get; }
        public string Houseno { set; get; }
        public string Street { set; get; }
        public string Zip { set; get; }
        public int ZipNo { set; get; }
        public string receiptNumber { get; set; }
        public string dateOfPayment { get; set; }
        public double amountCollected { get; set; }
        public string dateOfEntry { get; set; }
        public int checkNumber { get; set; }
        public int branchId { get; set; }
        public string DOIssue { get; set; }
        public string validUpTo { get; set; }


        public int ChitId { get; set; }
        public int DueAmount { get; set; }

        public int UserID
        { get; set; }
       
    }


    }

