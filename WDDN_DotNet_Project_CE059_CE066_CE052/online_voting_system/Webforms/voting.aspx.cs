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
    public partial class voting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ElectionDbContext el = new ElectionDbContext();
            Election dates = el.Elections.FirstOrDefault();
            try
            {
                if (el == null)
                    Response.Redirect("~/Webforms/welcome.aspx");

                if (string.Compare(DateTime.Now.ToString("yyyy/MM/dd"), dates.Edate.ToString()) > 0)
                {
                    Response.Redirect("~/Webforms/welcome.aspx");
                }

                if (ViewState["cs"] == null)
                {
                    ViewState["cs"] = "false";
                }
            }
            catch(Exception e1)
            {
                Response.Redirect("~/Webforms/welcome.aspx");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string maincon = ConfigurationManager.ConnectionStrings["electionConnectionString"].ConnectionString;
            SqlConnection sqlq = new SqlConnection(maincon);
            string query = "select id,name,age from [dbo].[Candidates] a where a.name = '" + DropDownList1.SelectedValue + "'";
            sqlq.Open();
            SqlCommand sa = new SqlCommand(query, sqlq);
            SqlDataAdapter sn = new SqlDataAdapter(sa);
            DataTable st = new DataTable();
            sn.Fill(st);
            GridView1.DataSource = st;
            GridView1.DataBind();
            sqlq.Close();

            ElectionDbContext cs = new ElectionDbContext();
            var t = cs.Candidates.Where(s => s.name == DropDownList1.SelectedValue).FirstOrDefault(); 
            Image1.ImageUrl = "~/files/candidate/photos/"+t.photo+".jpg";
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ViewState["cs"].Equals("true"))
            {
                string maincon = ConfigurationManager.ConnectionStrings["electionConnectionString"].ConnectionString;
                SqlConnection sqlq = new SqlConnection(maincon);
                string query = "select vote from [dbo].[Candidates] a where a.name = '" + DropDownList1.SelectedValue + "'";
                sqlq.Open();
                SqlCommand sa = new SqlCommand(query, sqlq);
                SqlDataReader sn = sa.ExecuteReader();
                string vo = "";
                while (sn.Read())
                {
                    vo += sn.GetValue(0).ToString();
                }
                int v = int.Parse(vo);
                string query1 = "update [dbo].[Candidates] SET vote=" + (v + 1) + " where name = '" + DropDownList1.SelectedValue + "'";
                SqlCommand sa1 = new SqlCommand(query1, sqlq);
                sa1.ExecuteNonQuery();
                sqlq.Close();
                ViewState["cs"] = "false";
                Label2.Text = "vote confirmed";
                ElectionDbContext db = new ElectionDbContext();
                int id = int.Parse(TextBox1.Text);
                var name = db.Voters.Find(id);
                name.vote = 1;
                db.Voters.Add(name);
                db.Entry(name).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
            else
                Label2.Text = "please verify voter..";
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       

        protected void check_Click1(object sender, EventArgs e)
        {
            ElectionDbContext db = new ElectionDbContext();
            if (TextBox1.Text != null)
            {
                int id = int.Parse(TextBox1.Text);
                var name = db.Voters.Where(ed => ed.vid == id).FirstOrDefault();
                if (name != null)
                {
                    if (name.vote != 1)
                    {
                        Label1.Text = name.name;
                        ViewState["cs"] = "true";
                        if (name.vote == 1)
                        {
                            Label2.Text = "voter already voted";
                        }
                    }
                    else
                    {
                        Label2.Text = "vote already considered";
                    }
                }
                else
                    Label1.Text = "voter not found";
            }
            else
                Label1.Text = "voter not found";

        }
    }
}