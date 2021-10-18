using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace online_voting_system.Models
{
    public class RegisterUser
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string MobileNumber { get; set; }
        public int Role { get; set; } // 0 - user and 1 - admin
    }
}