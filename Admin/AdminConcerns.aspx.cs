using System;
using System.Web.UI.WebControls;
namespace OnlineExamSystem.Admin
{
    public partial class AdminConcern : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { if (!IsPostBack) Bind(); }
        private void Bind()
        {
            gvConcerns.DataSource = DBHelper.ExecuteQuery("SELECT c.*, e.ExamName, q.QuestionText FROM Concerns c JOIN Exams e ON c.ExamID=e.ExamID JOIN Questions q ON c.QuestionID=q.QuestionID ORDER BY c.RaisedDate DESC");
            gvConcerns.DataBind();
        }
        protected void gvConcerns_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string status = e.CommandName == "Resolve" ? "Resolved" : "Open";
            DBHelper.ExecuteNonQuery($"UPDATE Concerns SET Status='{status}' WHERE ConcernID={e.CommandArgument}");
            Bind();
        }
    }
}