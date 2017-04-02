using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALChitFundManagementSystem.BE
{
   public class BE_Subscriber
    {


        private int _UserId, _ReceiptNo;
        private string _AgentName;
        private double _TDueAmount;
        private string _ModOfPay;
        private int bankId;


        public string SubscriberName { get; set; }
        public int SubscriberId { get; set; }
        
        public int BankId
        {
            get { return bankId; }
            set { bankId = value; }
        }
        public int _userId
        {
            get { return _UserId; }
            set { _UserId = value; }
        }
        public string _agentName
        {
            get { return _AgentName; }
            set { _AgentName = value; }
        }
        public double _tDueAmount
        {
            get { return _TDueAmount; }
            set { _TDueAmount = value; }
        }
        public string _modOfPay
        {
            get { return _ModOfPay; }
            set { _ModOfPay = value; }
        }



    }
}
