using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace online_voting_system.Models
{
    public class Election
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Edate { get; set; }
        public string Rdate { get; set; }

    }
}