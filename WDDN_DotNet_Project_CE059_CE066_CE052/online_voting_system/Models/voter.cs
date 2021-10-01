using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace online_voting_system
{
    public class Voter
    {
      
        public int id { get; set; }
        public int vid { get; set; }
        public string name { get; set; }
        public int age { get; set; }
        public string number { get; set; }
        public string sign { get; set; }
        public string photo { get; set; }
        public int vote { get; set; }
    }
}