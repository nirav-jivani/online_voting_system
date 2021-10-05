using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;
using System.Configuration;
using System.Data.SqlClient;
using online_voting_system.Models;

namespace online_voting_system
{
    public partial class candidate : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            try {
                ElectionDbContext el = new ElectionDbContext();
            Election dates = el.Elections.FirstOrDefault();

                if (el == null)
                    Response.Redirect("~/Webforms/welcome.aspx");

                if (string.Compare(DateTime.Now.ToString("yyyy/MM/dd"), dates.Edate.ToString()) > 0)
                {
                    Response.Redirect("~/Webforms/welcome.aspx");
                }
            }
            catch (Exception e2)
            {
                Response.Redirect("~/Webforms/welcome.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fn = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName)+DateTime.Now;
            string fn1 = System.IO.Path.GetFileName(FileUpload2.PostedFile.FileName)+DateTime.Now;
            if ((FileUpload1.PostedFile != null) && (FileUpload1.PostedFile.ContentLength > 0))
            {
                try
                {
                    string l1 = Server.MapPath("~\\files\\candidate\\signs") + "\\" + fn+".jpg";
                    string l2 = Server.MapPath("~\\files\\candidate\\photos") + "\\" + fn1+".jpg";
                    FileUpload1.PostedFile.SaveAs(l1);
                    FileUpload2.PostedFile.SaveAs(l2);
                    
                    
                }
                catch(Exception cec)
                {
                    Label1.Text = "erorr"+cec;
                }
            }
            else
            {
                Label1.Text = "not upload";
            }


            ElectionDbContext db = new ElectionDbContext();
            Candidate s = new Candidate();
            s.name = cname.Text;
            s.age = int.Parse(cage1.Text);
            s.sign = fn;
            s.photo = fn1;
            s.vote = 0;

            db.Candidates.Add(s);
            db.SaveChangesAsync();
            Label1.Visible = true;
            Label1.Text = s.name + " added to the candidated list.";
        }

    }
}