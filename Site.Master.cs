using System;

namespace OnlineExamSystem
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            if (Session["Role"] != null)
            {
                string role = Session["Role"].ToString();

                if (role == "Admin")
                    Response.Redirect("~/Admin/AdminDashboard.aspx");
                else if (role == "Student")
                    Response.Redirect("~/Student/StudentDashboard.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Account/Login.aspx");
        }
    }
}
