using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineExamSystem.Admin
{
    public partial class ManageExams : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["OnlineExamDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadExams();
            }
        }

        void LoadExams()
        {
            SqlConnection con = new SqlConnection(cs);

            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Exams", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            gvExams.DataSource = dt;
            gvExams.DataBind();
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);

            string q = "INSERT INTO Exams(ExamName,Duration,TotalMarks,IsActive) VALUES(@n,@d,@m,1)";

            SqlCommand cmd = new SqlCommand(q, con);

            cmd.Parameters.AddWithValue("@n", txtTitle.Text);
            cmd.Parameters.AddWithValue("@d", txtDur.Text);
            cmd.Parameters.AddWithValue("@m", txtMarks.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            lblMsg.Text = "Exam Created Successfully";

            LoadExams();
        }

        protected void gvExams_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "DeleteExam")
            {
                SqlConnection con = new SqlConnection(cs);

                SqlCommand cmd = new SqlCommand("DELETE FROM Exams WHERE ExamID=@id", con);

                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                LoadExams();
            }

            if (e.CommandName == "Toggle")
            {
                SqlConnection con = new SqlConnection(cs);

                SqlCommand cmd = new SqlCommand("UPDATE Exams SET IsActive = 1 - IsActive WHERE ExamID=@id", con);

                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                LoadExams();
            }

            if (e.CommandName == "EditExam")
            {
                ViewState["ExamID"] = id;

                mvExams.ActiveViewIndex = 1;

                LoadQuestions();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            mvExams.ActiveViewIndex = 0;
            LoadExams();
        }

        protected void btnUpdateDetails_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ViewState["ExamID"]);

            SqlConnection con = new SqlConnection(cs);

            string q = "UPDATE Exams SET ExamName=@n,Duration=@d,TotalMarks=@m WHERE ExamID=@id";

            SqlCommand cmd = new SqlCommand(q, con);

            cmd.Parameters.AddWithValue("@n", txtEditName.Text);
            cmd.Parameters.AddWithValue("@d", txtEditDur.Text);
            cmd.Parameters.AddWithValue("@m", txtEditMarks.Text);
            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void btnAddQ_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ViewState["ExamID"]);

            SqlConnection con = new SqlConnection(cs);

            string q = "INSERT INTO Questions(ExamID,QuestionText,OptionA,OptionB,OptionC,OptionD,CorrectAnswer) VALUES(@eid,@q,@a,@b,@c,@d,@ans)";

            SqlCommand cmd = new SqlCommand(q, con);

            cmd.Parameters.AddWithValue("@eid", id);
            cmd.Parameters.AddWithValue("@q", txtQ.Text);
            cmd.Parameters.AddWithValue("@a", txtA.Text);
            cmd.Parameters.AddWithValue("@b", txtB.Text);
            cmd.Parameters.AddWithValue("@c", txtC.Text);
            cmd.Parameters.AddWithValue("@d", txtD.Text);
            cmd.Parameters.AddWithValue("@ans", ddlAns.SelectedValue);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadQuestions();
        }

        void LoadQuestions()
        {
            int id = Convert.ToInt32(ViewState["ExamID"]);

            SqlConnection con = new SqlConnection(cs);

            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Questions WHERE ExamID=" + id, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            gvQuestions.DataSource = dt;
            gvQuestions.DataBind();
        }

        protected void gvQuestions_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvQuestions.DataKeys[e.RowIndex].Value);

            SqlConnection con = new SqlConnection(cs);

            SqlCommand cmd = new SqlCommand("DELETE FROM Questions WHERE QuestionID=@id", con);

            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadQuestions();
        }
    }
}