using System;
namespace OnlineExamSystem.Student
{
    public partial class StudentReview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["eid"] != null)
            {
                // Shows Correct Answers. To show student selection, need Results_Detail table.
                gvReview.DataSource = DBHelper.ExecuteQuery("SELECT * FROM Questions WHERE ExamID=" + Request.QueryString["eid"]);
                gvReview.DataBind();
            }
        }
    }
}