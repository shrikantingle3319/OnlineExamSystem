using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
namespace OnlineExamSystem.Student
{
    public partial class StudentConcern : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["eid"] != null)
            {
                ddlQ.DataSource = DBHelper.ExecuteQuery("SELECT QuestionID, QuestionText FROM Questions WHERE ExamID=" + Request.QueryString["eid"]);
                ddlQ.DataTextField = "QuestionText"; ddlQ.DataValueField = "QuestionID"; ddlQ.DataBind();
                ddlQ.Items.Insert(0, new ListItem("General Issue", "0"));
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // If General (0), use first QID or handle DB constraint. Here using first QID for safety.
            object qid = ddlQ.SelectedValue == "0" ? DBHelper.ExecuteScalar("SELECT TOP 1 QuestionID FROM Questions WHERE ExamID=" + Request.QueryString["eid"]) : ddlQ.SelectedValue;
            DBHelper.ExecuteNonQuery("INSERT INTO Concerns (ExamID, QuestionID, StudentID, ConcernText, Status, RaisedDate) VALUES (@e, @q, @s, @t, 'Open', GETDATE())",
                new SqlParameter("@e", Request.QueryString["eid"]), new SqlParameter("@q", qid), new SqlParameter("@s", Session["UserID"]), new SqlParameter("@t", txtIssue.Text));
            lblMsg.Text = "Submitted Successfully.";
        }
    }
}