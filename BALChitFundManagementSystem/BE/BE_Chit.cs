using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALChitFundManagementSystem.BE
{
   public class BE_Chit
    {
        public int ChitId { get; set; }
        public string ChitName { get; set; }
        public string ChitGroupStartDate { get; set; }
        public int NoOfMonths { get; set; }
        public int AvailableSlots { get; set; }
        public Double ChitValue { get; set; }
        public Double MonthlyInstallment { get; set; }
       // public double Amount { get; set; }
        //public string chitName { get; set; }
        //public string noOfMonths { get; set; }
        public string NoOfCustomer { get; set; }
        public int TotalNoOfCustomers { get; set; }
        public string chitGroupEndDate
        {
            get;
            set;

        }

        public string chitGroupAuctionDay
        {
            get;
            set;

        }

        public string PreviousSanctionNumber
        {
            get;
            set;

        }

        public string PreviousSanctionDate
        {
            get;
            set;

        }

        public string CCBNumber
        {
            get;
            set;

        }

        public string CCBDate
        {
            get;
            set;
        }

        public string Summary
        {
            get;
            set;

        }


        public string RegistrationNumber
        {
            get;
            set;
        }

        public int Status
        {
            get;
            set;
        }


        public double UserId
        {
            get ;
            set;
        }

       
    }
}
