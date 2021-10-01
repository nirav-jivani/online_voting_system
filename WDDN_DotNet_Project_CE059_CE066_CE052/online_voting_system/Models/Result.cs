using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace online_voting_system.Models
{
    public class Result
    {
        public int Id { get; set; }
        public string Date { get; set; }
        public string Winner { get; set; }
        public int Vote { get; set; }
        public int Declared { get; set; }
    }
}