using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALChitFundManagementSystem.BE
{
   public class BE_CustomerIdProof
    {
        public int AddressProofId
        {
            get;
            set;
        }
        public Byte[] AddressProofDoc
        {
            get;
            set;
        }
        public string AddressProofName
        { get; set; }
    }
}