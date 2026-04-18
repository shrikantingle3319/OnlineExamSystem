using System;
using System.Data;

namespace OnlineExamSystem.Admin
{
    public partial class AdminResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadResults();
            }
        }

        private void LoadResults()
        {
            string query = @"
                SELECT 
                    u.Name AS StudentName,
                    e.ExamName,
                    r.Score,
                    r.SubmittedAt
                FROM Results r
                INNER JOIN Users_Student u 
                    ON r.StudentID = u.StudentID
                INNER JOIN Exams e 
                    ON r.ExamID = e.ExamID
                ORDER BY r.SubmittedAt DESC";

            DataTable dt = DBHelper.ExecuteQuery(query);

            gvResults.DataSource = dt;
            gvResults.DataBind();
        }
    }
}
