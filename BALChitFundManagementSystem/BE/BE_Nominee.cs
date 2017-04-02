using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALChitFundManagementSystem.BE
{
   public class BE_Nominee
    {
       public int NomineeId { get; set; }
       public string NomineeName { get; set; }
        public string Relation { get; set; }
        public string DOB{get; set; }
        public int Age { get; set; }
        public string ContactNumber { get; set; }
    }
}
