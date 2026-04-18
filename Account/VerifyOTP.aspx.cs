using System;
using System.Data.SqlClient;

namespace OnlineExamSystem.Account
{
    public partial class VerifyOTP : System.Web.UI.Page
    {
        protected void btnVerify_Click(object sender, EventArgs e)
        {
            string type = Request.QueryString["type"];
            string enteredOTP = txtOTP.Text.Trim();

            if (type == "reg" && enteredOTP == Session["RegOTP"]?.ToString())
            {
                string[] data = (string[])Session["RegData"];
                string role = Session["RegRole"]?.ToString();

                string query, hash = DBHelper.HashPassword(data[2]);
                SqlParameter[] p;

                if (role == "Admin")
                {
                    query = "INSERT INTO Users_Admin (Username, PasswordHash) VALUES (@u, @p)";
                    p = new SqlParameter[] { new SqlParameter("@u", data[1]), new SqlParameter("@p", hash) };
                }
                else
                {
                    query = "INSERT INTO Users_Student (Name, Email, PasswordHash) VALUES (@n, @e, @p)";
                    p = new SqlParameter[] { new SqlParameter("@n", data[0]), new SqlParameter("@e", data[1]), new SqlParameter("@p", hash) };
                }

                DBHelper.ExecuteNonQuery(query, p);
                lblMsg.Text = "Success! Redirecting...";
                Response.AddHeader("REFRESH", "2;URL=Login.aspx");
            }
            else if (type == "reset" && enteredOTP == Session["ResetOTP"]?.ToString())
            {
                Response.Redirect("ResetPassword.aspx");
            }
            else { lblMsg.Text = "Invalid OTP"; }
        }
    }
}