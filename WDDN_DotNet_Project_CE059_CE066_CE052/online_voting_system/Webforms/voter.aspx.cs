using online_voting_system.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace online_voting_system
{
    public partial class voter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/Webforms/login.aspx");
            }

            ElectionDbContext el = new ElectionDbContext();
            Election dates = el.Elections.FirstOrDefault();
            if (el == null)
                Response.Redirect("~/Webforms/welcome.aspx");

            if (string.Compare(DateTime.Now.ToString("yyyy/MM/dd"), dates.Edate.ToString()) > 0)
            {
                Response.Redirect("~/Webforms/welcome.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fn = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName) + DateTime.Now;
            string fn1 = System.IO.Path.GetFileName(FileUpload2.PostedFile.FileName) + DateTime.Now;
            if ((FileUpload1.PostedFile != null) && (FileUpload1.PostedFile.ContentLength > 0))
            { 
                    string l1 = Server.MapPath("~\\files\\voter\\signs") + "\\" + fn;
                    string l2 = Server.MapPath("~\\files\\voter\\photos") + "\\" + fn1;
                    FileUpload1.PostedFile.SaveAs(l1);
                    FileUpload2.PostedFile.SaveAs(l2);
            }

            ElectionDbContext vs = new ElectionDbContext();
            Voter temp = new Voter();
            temp.vid = int.Parse(vid.Text);
            temp.name = vname.Text;
            temp.number = vnum.Text;
            temp.sign = fn;
            temp.photo = fn1;
            temp.age = int.Parse(vage.Text);
            temp.vote = 0;

            vs.Voters.Add(temp);
            vs.SaveChanges();
        }
    }
}