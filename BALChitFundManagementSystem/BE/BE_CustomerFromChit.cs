using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALChitFundManagementSystem.BE
{
   public class BE_CustomerFromChit
    {
       public int? ChitId { get; set; }
       public int? CustomerId { get; set; }
       public string CustomerName { get; set; }
       public int? GuaranterId { get; set; }
       public string MobileNo { get; set; }
       public int? SubscriberDocId { get; set; }
    }
}
