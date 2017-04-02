using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALChitFundManagementSystem.BE
{
    public class BE_Guaranter
    {
        public int GuaranterId { get; set; }
        public string GuaranterName { get; set; }
        public string DOB { get; set; }
        public int Age { get; set; }
        public string Relation { get; set; }
        public string ContactNumber { get; set; }
        public int IdProofId { get; set; }
        public byte[] IdProofDoc { get; set; }
        public int AddressProofId { get; set; }
        public byte[] AddressProofDoc { get; set; }
        public string Occupation { get; set; }
        public string Company { get; set; }
        public double AnualIncome { get; set; }
    }
}
