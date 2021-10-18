using online_voting_system.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace online_voting_system.Webforms
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void login_button_Click(object sender, EventArgs e)
        {
            string username = username_value.Text.Trim();
            string password = password_value.Text.Trim();
            if (username != null && username != "" && password != null && password != "")
            {
                login_error_label.Text = "";
                ElectionDbContext db = new ElectionDbContext();
                RegisterUser user = db.User.Where(u => u.UserName == username && u.Password == password).FirstOrDefault();
                if (user != null)
                {
                    Session["username"] = username;
                    Session["role"] = user.Role;
                    Response.Redirect("~/Webforms/welcome.aspx");
                }
                else
                {
                    login_error_label.Text = "User Not Exist...";
                }
            }
        }
    }
}