using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALChitFundManagementSystem.BE
{
   public class BE_CustomerDocument
    {
       public byte[] ApplicationDoc { get; set; }
       public byte[] BidOfferDoc { get; set; }
       public byte[] AuthorizationDoc { get; set; }
       public byte[] AgreementDoc { get; set; }
    }
}
