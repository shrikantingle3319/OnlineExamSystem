using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
namespace OnlineExamSystem.Admin
{
    public partial class ManageInvigilators : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { if (!IsPostBack) BindGrid(); }
        private void BindGrid() { gvInv.DataSource = DBHelper.ExecuteQuery("SELECT * FROM Users_Invigilator"); gvInv.DataBind(); }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DBHelper.ExecuteNonQuery("INSERT INTO Users_Invigilator (Name, Email, PasswordHash, IsActive) VALUES (@n, @e, @p, 1)",
                new SqlParameter("@n", txtName.Text), new SqlParameter("@e", txtEmail.Text), new SqlParameter("@p", txtPass.Text));
            string err; DBHelper.SendEmail(txtEmail.Text, "Account", $"Pass: {txtPass.Text}", out err);
            BindGrid(); lblMsg.Text = "Created!";
        }
        protected void gvInv_RowCommand(object sender, GridViewCommandEventArgs e) { if (e.CommandName == "Toggle") { DBHelper.ExecuteNonQuery("UPDATE Users_Invigilator SET IsActive = IsActive ^ 1 WHERE InvigilatorID=@id", new SqlParameter("@id", e.CommandArgument)); BindGrid(); } }
        protected void gvInv_RowDeleting(object sender, GridViewDeleteEventArgs e) { DBHelper.ExecuteNonQuery("DELETE FROM Users_Invigilator WHERE InvigilatorID=@id", new SqlParameter("@id", gvInv.DataKeys[e.RowIndex].Value)); BindGrid(); }
    }
}