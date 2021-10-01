using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace online_voting_system
{
    public class Candidate
    {
        public int id { get; set; }
        public string name { get; set; }
        public int age { get; set; }
        public string photo { get; set; }
        public string sign { get; set; }
        public int vote { get; set; }
    }
}