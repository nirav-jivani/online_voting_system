using online_voting_system.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace online_voting_system
{
    public partial class calculate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ElectionDbContext el = new ElectionDbContext();
                if (el == null)
                    Response.Redirect("~/Webforms/welcome.aspx");

                Election dates = el.Elections.FirstOrDefault();
                if (dates == null)
                    Response.Redirect("~/Webforms/welcome.aspx");
                else if(string.Compare(DateTime.Now.ToString("yyyy/MM/dd"), dates.Rdate.ToString()) > 0)
                    Response.Redirect("~/Webforms/welcome.aspx");
               
            }
            catch(Exception e1)
            {
                Response.Redirect("~/Webforms/welcome.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ElectionDbContext el = new ElectionDbContext();
            Election dates = el.Elections.FirstOrDefault();
            if (string.Compare(DateTime.Now.ToString("yyyy/MM/dd"), dates.Rdate.ToString()) != 0)
            {
                Label1.Text = "please wait until election over or result date....";
            }
            else
            {
                ElectionDbContext cs = new ElectionDbContext();
                ElectionDbContext rs = new ElectionDbContext();
                Result temp = rs.Results.Where(s => s.Date == dates.Edate).FirstOrDefault();
                if (temp.Declared == 1)
                {
                    Label1.Text = "Result already declared...";
                }
                else
                {
                    var r = cs.Candidates.Where(se => se.vote == (cs.Candidates.Max(s => s.vote))).FirstOrDefault();
                    temp.Vote = r.vote;
                    temp.Winner = r.name;
                    temp.Declared = 1;
                    rs.SaveChanges();
                    IEnumerable<Candidate> cs1 = (IEnumerable<Candidate>)(from s in cs.Candidates orderby s.id select s);
                    cs.Candidates.RemoveRange(cs1);
                    el.Elections.Remove(dates);
                    ElectionDbContext vs = new ElectionDbContext();
                    IEnumerable<Voter> vs1 = (IEnumerable<Voter>)(from s in vs.Voters orderby s.vid select s);
                    vs.Voters.RemoveRange(vs1);

                    vs.SaveChanges();
                    cs.SaveChanges();
                    el.SaveChanges();
                }
            }
        }

    }
}