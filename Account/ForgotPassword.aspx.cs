using System;
using System.Data.SqlClient;

namespace OnlineExamSystem.Account
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void btnSend_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            bool isStudent = Convert.ToInt32(DBHelper.ExecuteScalar("SELECT COUNT(*) FROM Users_Student WHERE Email=@e", new SqlParameter("@e", email))) > 0;
            bool isAdmin = Convert.ToInt32(DBHelper.ExecuteScalar("SELECT COUNT(*) FROM Users_Admin WHERE Username=@e", new SqlParameter("@e", email))) > 0;

            if (isStudent || isAdmin)
            {
                string otp = new Random().Next(100000, 999999).ToString();
                Session["ResetOTP"] = otp; Session["ResetEmail"] = email;

                string err;
                string subject = "Exam Portal - Reset Password";
                string body = $"Hello,<br/><br/>Your OTP to reset your password is: <b>{otp}</b>";

                if (DBHelper.SendEmail(email, subject, body, out err))
                    Response.Redirect("VerifyOTP.aspx?type=reset");
                else
                    lblMsg.Text = "Error: " + err;
            }
            else { lblMsg.Text = "Email not found."; }
        }
    }
}