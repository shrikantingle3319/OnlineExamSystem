using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineExamSystem.Admin
{
    public partial class ManageQuestions : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["OESConnection"].ConnectionString;

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

            SqlDataAdapter da = new SqlDataAdapter("SELECT ExamID,ExamName FROM Exams", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            ddlExams.DataSource = dt;
            ddlExams.DataTextField = "ExamName";
            ddlExams.DataValueField = "ExamID";
            ddlExams.DataBind();

            ddlExams.Items.Insert(0, "Select Exam");
        }

        protected void ddlExams_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadQuestions();
        }

        void LoadQuestions()
        {
            if (ddlExams.SelectedIndex == 0)
                return;

            SqlConnection con = new SqlConnection(cs);

            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Questions WHERE ExamID=" + ddlExams.SelectedValue, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            gvQuestions.DataSource = dt;
            gvQuestions.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (ddlExams.SelectedIndex == 0)
            {
                lblMsg.Text = "Please select an exam first.";
                return;
            }

            SqlConnection con = new SqlConnection(cs);

            string q = "INSERT INTO Questions(ExamID,QuestionText,OptionA,OptionB,OptionC,OptionD,CorrectAnswer,Marks) VALUES(@eid,@q,@a,@b,@c,@d,@ans,@m)";

            SqlCommand cmd = new SqlCommand(q, con);

            cmd.Parameters.AddWithValue("@eid", ddlExams.SelectedValue);
            cmd.Parameters.AddWithValue("@q", txtQuestion.Text);
            cmd.Parameters.AddWithValue("@a", txtOptA.Text);
            cmd.Parameters.AddWithValue("@b", txtOptB.Text);
            cmd.Parameters.AddWithValue("@c", txtOptC.Text);
            cmd.Parameters.AddWithValue("@d", txtOptD.Text);
            cmd.Parameters.AddWithValue("@ans", ddlCorrect.SelectedValue);
            cmd.Parameters.AddWithValue("@m", txtMarks.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            lblMsg.Text = "Question Added Successfully";

            ClearFields();

            LoadQuestions();
        }

        void ClearFields()
        {
            txtQuestion.Text = "";
            txtOptA.Text = "";
            txtOptB.Text = "";
            txtOptC.Text = "";
            txtOptD.Text = "";
            ddlCorrect.SelectedIndex = 0;
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