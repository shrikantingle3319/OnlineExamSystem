using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

namespace OnlineExamSystem.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string role = ddlRole.SelectedValue;
            string table = role == "Admin" ? "Users_Admin" : "Users_Student";
            string colName = role == "Admin" ? "Username" : "Email";
            string idCol = role + "ID";

            string query = $"SELECT {idCol}, {colName} FROM {table} WHERE {colName}=@u AND (PasswordHash=@h OR PasswordHash=@p)";
            string hash = DBHelper.HashPassword(txtPass.Text.Trim());

            DataTable dt = DBHelper.ExecuteQuery(query,
                new SqlParameter("@u", txtUser.Text.Trim()),
                new SqlParameter("@h", hash),
                new SqlParameter("@p", txtPass.Text.Trim()));

            if (dt.Rows.Count > 0)
            {
                Session["UserID"] = dt.Rows[0][idCol];
                Session["UserName"] = dt.Rows[0][colName];
                Session["Role"] = role;
                FormsAuthentication.SetAuthCookie(txtUser.Text, false);

                if (role == "Student") Response.Redirect("~/Student/StudentDashboard.aspx");
                else Response.Redirect("~/Admin/AdminDashboard.aspx");
            }
            else { lblMsg.Text = "Invalid Credentials"; }
        }
    }
}