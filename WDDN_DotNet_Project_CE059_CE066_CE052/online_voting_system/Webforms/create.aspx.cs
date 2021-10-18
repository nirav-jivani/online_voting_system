using online_voting_system.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace online_voting_system
{
    public partial class create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/Webforms/login.aspx");
            }
            Label1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.Compare(eledate.Text, DateTime.Now.ToString("yyyy/MM/dd")) < 0 || string.Compare(resdate.Text, DateTime.Now.ToString("yyyy/MM/dd")) < 0 || string.Compare(eledate.Text, resdate.Text) > 0)
            {
                Label1.Visible = true;
                Label1.Text = "Please Enter the valid date...";
            }
            else
            {
                ElectionDbContext db = new ElectionDbContext();
                ElectionDbContext rs = new ElectionDbContext();
                Election e1 = new Election();
                Result r1 = new Result();
                e1.Title = eletitle.Text;
                e1.Edate = eledate.Text;
                e1.Rdate = resdate.Text;
                r1.Date = eledate.Text;
                r1.Declared = 0;
                r1.Winner = "Winner yet not declare please wait....";
                rs.Results.Add(r1);
                rs.SaveChangesAsync();
                db.Elections.Add(e1);
                db.SaveChangesAsync();

                try
                {
                    Label1.Visible = true;
                    Label1.Text = "Election created sucessfully....";
                }
                catch(Exception ex)
                {

                }
                
            }

        }
    }
}