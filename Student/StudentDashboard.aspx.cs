using System;
using System.Data.SqlClient;
namespace OnlineExamSystem.Student
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int sid = Convert.ToInt32(Session["UserID"]);
                // Check if taken using subquery count
                rptExams.DataSource = DBHelper.ExecuteQuery("SELECT *, (SELECT COUNT(*) FROM Results r WHERE r.ExamID = e.ExamID AND r.StudentID = @sid) as IsTaken FROM Exams e WHERE IsActive = 1", new SqlParameter("@sid", sid));
                rptExams.DataBind();
            }
        }
    }
}