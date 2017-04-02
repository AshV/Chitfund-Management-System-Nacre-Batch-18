using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALChitFundManagementSystem.BE
{
   public class BE_Address
    {
       public int AddressId { get; set; }
        public string Area { get; set; }
        public string HouseNo { get; set; }
        public string Street { get; set; }
        public int CityId { get; set; }
        public int Zip { get; set; }
       // public string AddressProofDoc { get; set; }
    }
}
