using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALChitFundManagementSystem.BE
{
    public class GetCityState
    {
        public int cityId { get; set; }
        public string city { get; set; }

        public int stateId { get; set; }
        public string state { get; set; }

        public string addProofId { get; set; }
        public string addProofName { get; set; }
        public string addProofDoc { get; set; }


        public string idProofId { get; set; }
        public string idProofName { get; set; }
        public string idProofDoc { get; set; }


        public string addPTypeId { get; set; }
        public string addPType { get; set; }



        public string IdPTypeId { get; set; }
        public string IdPTypeName { get; set; }

        
    }
}
