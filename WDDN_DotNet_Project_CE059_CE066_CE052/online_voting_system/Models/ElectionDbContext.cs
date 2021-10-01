using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace online_voting_system.Models
{
    public class ElectionDbContext : DbContext
    {
        public ElectionDbContext() : base("name=electionConnectionString")
        {

        }

        public DbSet<Candidate> Candidates { get; set; }
        public DbSet<Election> Elections { get; set; }
        public DbSet<Result> Results { get; set; }
        public DbSet<Voter> Voters { get; set; }
    }
}