using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALChitFundManagementSystem.BE
{
    public class BE_User
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string MobileNo { get; set; }
        public string LoginId { get; set; }
        public string Password { get; set; }
        public bool Gender { get; set; }
        public string DOB { get; set; }
        public int UserTypeId { get; set; }
        public int AddressId { get; set; }
        public int SecurityQuestionId { get; set; }
        public string SecurityAnswer { get; set; }
        public Byte[] Image { get; set; }
        public string Imgurl { get; set; }

        public int RoleId { get; set; }
        public string RoleName { get; set; }
    }
}
