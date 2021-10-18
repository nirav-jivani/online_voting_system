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
            if (dates == null)
            {
                Response.Redirect("~/Webforms/welcome.aspx");
            }

            if (string.Compare(DateTime.Now.ToString("yyyy/MM/dd"), dates.Edate.ToString()) > 0)
            {
                Response.Redirect("~/Webforms/welcome.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Voter temp1 = new Voter();
            temp1.vid = int.Parse(vid.Text);
            ElectionDbContext vs = new ElectionDbContext();
            Voter v1 = vs.Voters.Where(u => u.vid == temp1.vid).FirstOrDefault();

            if (v1 == null)
            {
                    string fn = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName) + DateTime.Now;
                string fn1 = System.IO.Path.GetFileName(FileUpload2.PostedFile.FileName) + DateTime.Now;
                if ((FileUpload1.PostedFile != null) && (FileUpload1.PostedFile.ContentLength > 0))
                { 
                        string l1 = Server.MapPath("~\\files\\voter\\signs") + "\\" + fn + ".jpg";
                        string l2 = Server.MapPath("~\\files\\voter\\photos") + "\\" + fn1 + ".jpg";
                        FileUpload1.PostedFile.SaveAs(l1);
                        FileUpload2.PostedFile.SaveAs(l2);
                }


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
                
                RegisterUser new_user = new RegisterUser
                {
                    UserName = vname.Text,
                    Password = vid.Text,
                    MobileNumber =vnum.Text
                };

                vs.User.Add(new_user);
                vs.SaveChanges();
                Label6.Text = "Registration successfull...  " + temp.name + " added to the voting list ---- Username  "+vname.Text+"  and Password  "+vid.Text;
            }
            else
            {
                Label6.Text = "voter  is already registered...";
            }

        }
    }
}