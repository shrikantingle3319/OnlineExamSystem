using System;
using System.Data.SqlClient;

namespace OnlineExamSystem.Account
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            DBHelper.ExecuteNonQuery("UPDATE Users_Student SET PasswordHash=@p WHERE Email=@e",
                new SqlParameter("@p", DBHelper.HashPassword(txtPass.Text)), new SqlParameter("@e", Session["ResetEmail"]));

            // Try updating Admin too just in case
            DBHelper.ExecuteNonQuery("UPDATE Users_Admin SET PasswordHash=@p WHERE Username=@e",
                new SqlParameter("@p", DBHelper.HashPassword(txtPass.Text)), new SqlParameter("@e", Session["ResetEmail"]));

            lblMsg.Text = "Success! Redirecting..."; Response.AddHeader("REFRESH", "2;URL=Login.aspx");
        }
    }
}