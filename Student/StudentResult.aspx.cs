using System;
using System.Data;
using System.Data.SqlClient;

namespace OnlineExamSystem.Student
{
    public partial class StudentResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("~/Account/Login.aspx");
                    return;
                }

                if (Request.QueryString["eid"] == null)
                {
                    Response.Redirect("StudentDashboard.aspx");
                    return;
                }

                int eid;
                if (!int.TryParse(Request.QueryString["eid"], out eid))
                {
                    Response.Redirect("StudentDashboard.aspx");
                    return;
                }

                int studentId = Convert.ToInt32(Session["UserID"]);
                LoadResult(eid, studentId);
            }
        }

        private void LoadResult(int eid, int studentId)
        {
            // 1. Fetch Exam Details (Total Marks)
            // We use the TotalMarks from the Exams table as the maximum possible score
            string examQuery = "SELECT ExamName, TotalMarks FROM Exams WHERE ExamID = @eid";
            DataTable dtExam = DBHelper.ExecuteQuery(examQuery, new SqlParameter("@eid", eid));

            // 2. Fetch Result (Score and Submission Time)
            // NOTE: Using 'SubmittedAt' column, NOT 'Date'
            string resultQuery = "SELECT Score, SubmittedAt FROM Results WHERE ExamID=@eid AND StudentID=@sid";
            DataTable dtResult = DBHelper.ExecuteQuery(resultQuery,
                new SqlParameter("@eid", eid),
                new SqlParameter("@sid", studentId));

            if (dtExam.Rows.Count > 0 && dtResult.Rows.Count > 0)
            {
                // Exam Data
                string examName = dtExam.Rows[0]["ExamName"].ToString();
                int totalMarks = Convert.ToInt32(dtExam.Rows[0]["TotalMarks"]);

                // Result Data
                int myScore = Convert.ToInt32(dtResult.Rows[0]["Score"]);
                DateTime submittedAt = Convert.ToDateTime(dtResult.Rows[0]["SubmittedAt"]);

                // Populate UI
                lblExamName.Text = examName;
                lblScore.Text = myScore.ToString();

                // Note: The score is based on number of correct questions (1 mark each usually)
                // If you want to scale it to TotalMarks, logic differs. 
                // Here we assume simple count. If 'TotalMarks' in Exam table is just metadata, 
                // we can also count total questions in Questions table.

                // Option A: Use TotalMarks from Exam Table (assuming 1 question = 1 mark for simplicity or scaled)
                // lblTotalMarks.Text = totalMarks.ToString(); 

                // Option B: Count actual questions (More accurate for "Score = Number of Correct Answers")
                int totalQuestions = (int)DBHelper.ExecuteScalar("SELECT COUNT(*) FROM Questions WHERE ExamID=@id", new SqlParameter("@id", eid));
                lblTotalMarks.Text = totalQuestions.ToString();

                // Calculate Percentage
                double percentage = totalQuestions > 0 ? ((double)myScore / totalQuestions) * 100 : 0;
                lblPercentage.Text = Math.Round(percentage, 2) + "%";

                if (percentage >= 50)
                    lblPercentage.ForeColor = System.Drawing.Color.Green;
                else
                    lblPercentage.ForeColor = System.Drawing.Color.Red;

                lblDate.Text = submittedAt.ToString("MMM dd, yyyy HH:mm");
            }
            else
            {
                // Result not found (user maybe manipulated URL without submitting)
                lblExamName.Text = "No Result Found";
                lblScore.Text = "-";
            }
        }
    }
}