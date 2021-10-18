using online_voting_system.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace online_voting_system.Webforms
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register_button_Click(object sender, EventArgs e)
        {
            string username = username_value.Text.Trim();
            string password = password_value.Text.Trim();
            string email = email_value.Text.Trim();
            string mobile = mobile_no_value.Text.Trim();
            if (username != null && username != "" && password != null && password != "" && email != null && email != "" && mobile != null && mobile != "")
            {
                register_error_label.Text = "";
                ElectionDbContext db = new ElectionDbContext();
                RegisterUser user = db.User.Where(u => u.UserName == username).FirstOrDefault();
                if(user != null)
                {
                    register_error_label.Text = "UserName is already taken...";
                    return;
                }
                user = db.User.Where(u => u.Email == email).FirstOrDefault();
                if (user != null)
                {
                    register_error_label.Text = "Email is existing...";
                    return;
                }
                RegisterUser new_user = new RegisterUser { 
                    UserName = username,
                    Email = email,
                    Password = password, 
                    MobileNumber = mobile };

                db.User.Add(new_user);
                db.SaveChanges();
                register_error_label.Text = "Registration successfull...";
            }
        }
    }
}