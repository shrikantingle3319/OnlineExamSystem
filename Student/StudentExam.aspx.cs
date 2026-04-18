using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineExamSystem.Student
{
    public partial class StudentExam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Security Check
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

                // Check if already taken (Optional, based on your logic)
                int studentId = Convert.ToInt32(Session["UserID"]);
                object checkResult = DBHelper.ExecuteScalar("SELECT COUNT(*) FROM Results WHERE StudentID=@s AND ExamID=@e",
                    new SqlParameter("@s", studentId), new SqlParameter("@e", eid));

                if (Convert.ToInt32(checkResult) > 0)
                {
                    // Already taken, redirect to result
                    Response.Redirect("StudentResult.aspx?eid=" + eid);
                    return;
                }

                // Fetch Exam Details
                DataTable dtExam = DBHelper.ExecuteQuery("SELECT ExamName, Duration FROM Exams WHERE ExamID=@id", new SqlParameter("@id", eid));

                if (dtExam.Rows.Count > 0)
                {
                    lblTitle.Text = dtExam.Rows[0]["ExamName"].ToString();

                    // Convert duration from minutes to seconds
                    int durationInSeconds = Convert.ToInt32(dtExam.Rows[0]["Duration"]) * 60;
                    ClientScript.RegisterStartupScript(this.GetType(), "time", $"startTimer({durationInSeconds});", true);

                    // Load Questions
                    rptQ.DataSource = DBHelper.ExecuteQuery("SELECT * FROM Questions WHERE ExamID=@id ORDER BY QuestionID", new SqlParameter("@id", eid));
                    rptQ.DataBind();
                }
                else
                {
                    Response.Redirect("StudentDashboard.aspx");
                }
            }
        }

        protected void rptQ_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // Dynamically add RadioButtons to avoid Parser Error with ListItems
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RadioButtonList rbl = (RadioButtonList)e.Item.FindControl("rblOpts");
                DataRowView row = (DataRowView)e.Item.DataItem;

                if (rbl != null && row != null)
                {
                    rbl.Items.Add(new ListItem(row["OptionA"].ToString(), "A"));
                    rbl.Items.Add(new ListItem(row["OptionB"].ToString(), "B"));
                    rbl.Items.Add(new ListItem(row["OptionC"].ToString(), "C"));
                    rbl.Items.Add(new ListItem(row["OptionD"].ToString(), "D"));
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int eid;
            if (!int.TryParse(Request.QueryString["eid"], out eid)) return;

            int score = 0;

            // Calculate Score
            foreach (RepeaterItem item in rptQ.Items)
            {
                var rbl = (RadioButtonList)item.FindControl("rblOpts");
                var hf = (HiddenField)item.FindControl("hfQID");

                if (rbl != null && hf != null && !string.IsNullOrEmpty(rbl.SelectedValue))
                {
                    // Securely fetch correct answer
                    object correctObj = DBHelper.ExecuteScalar("SELECT CorrectAnswer FROM Questions WHERE QuestionID=@qid",
                        new SqlParameter("@qid", hf.Value));

                    string correct = correctObj?.ToString();

                    if (rbl.SelectedValue == correct)
                    {
                        score++;
                    }
                }
            }

            int studentId = Convert.ToInt32(Session["UserID"]);

            // Insert Result
            // NOTE: Removed 'Date' and 'TotalQuestions' as they caused errors.
            // Using DB defaults for SubmittedAt.
            string insertQuery = "INSERT INTO Results (StudentID, ExamID, Score) VALUES (@s, @e, @sc)";

            DBHelper.ExecuteNonQuery(insertQuery,
                new SqlParameter("@s", studentId),
                new SqlParameter("@e", eid),
                new SqlParameter("@sc", score));

            // Redirect to Result
            Response.Redirect("StudentResult.aspx?eid=" + eid);
        }
    }
}