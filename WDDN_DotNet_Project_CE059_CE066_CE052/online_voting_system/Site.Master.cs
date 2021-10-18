using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace online_voting_system
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(Session["username"] as string))
            {
                int role = Int32.Parse(Session["role"].ToString());
                if (role == 0)
                {
                    election.Visible = true;
                }
                else if(role == 1)
                {
                    add_candidate.Visible = true;
                    add_voter.Visible = true;
                    create_election.Visible = true;
                    dashborad.Visible = true;
                }
                result.Visible = true;
                logout_button.Visible = true;
            }
        }

        protected void logout_button_Click(object sender, EventArgs e)
        {
            if(Session["username"] != null && Session["role"] != null)
            {
                Session.Remove("username");
                Session.Remove("role");
                Response.Redirect("~/Webforms/login.aspx");
            }
        }
    }
}