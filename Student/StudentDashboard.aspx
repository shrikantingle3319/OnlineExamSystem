<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="OnlineExamSystem.Student.StudentDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"><link href="Student.css" rel="stylesheet" /></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Available Exams</h2>
    <div class="row"><asp:Repeater ID="rptExams" runat="server"><ItemTemplate>
        <div class="col" style="flex:0 0 300px;"><div class="card" style="text-align:center;">
            <h3><%# Eval("ExamName") %></h3>
            <p><%# Eval("Duration") %> mins | <%# Eval("TotalMarks") %> Marks</p>
            <%# Convert.ToBoolean(Eval("IsTaken")) ? "<span class='badge badge-success'>Completed</span>" : "<a href='StudentExam.aspx?eid=" + Eval("ExamID") + "' class='btn btn-success'>Start Exam</a>" %>
            <div style="margin-top:10px;"><a href='StudentConcern.aspx?eid=<%# Eval("ExamID") %>' class="btn btn-sm btn-danger">Report Issue</a></div>
        </div></div>
    </ItemTemplate></asp:Repeater></div>
</asp:Content>