using System;

namespace OnlineExamSystem.Account
{
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string otp = new Random().Next(100000, 999999).ToString();
            Session["RegOTP"] = otp;
            Session["RegData"] = new string[] { txtName.Text, txtEmail.Text, txtPass.Text };
            Session["RegRole"] = ddlRegRole.SelectedValue;

            string err;
            if (DBHelper.SendEmail(txtEmail.Text, "Verify Registration", "OTP: " + otp, out err))
                Response.Redirect("VerifyOTP.aspx?type=reg");
            else
                lblMsg.Text = "Email Failed: " + err;
        }
    }
}