<%@ Page Title="Manage Questions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageQuestions.aspx.cs" Inherits="OnlineExamSystem.Admin.ManageQuestions" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<link href="admin.css" rel="stylesheet" />

<div class="admin-container">

<!-- Page Title -->

<h2 style="text-align:center;margin-bottom:25px;color:#1f2937;">
    Manage Questions
</h2>


<!-- Exam Selection -->

<div style="max-width:800px;margin:auto;margin-bottom:25px;">
<div class="card">

<div style="display:flex;justify-content:center;align-items:center;gap:15px;flex-wrap:wrap;">

<label style="font-weight:bold;">Select Exam Context:</label>

<asp:DropDownList
ID="ddlExams"
runat="server"
AutoPostBack="true"
OnSelectedIndexChanged="ddlExams_SelectedIndexChanged"
CssClass="form-control"
style="min-width:250px;">
</asp:DropDownList>

</div>

</div>
</div>


<!-- Main Content (Centered Container) -->

<div style="max-width:1200px;margin:auto;">

<div class="row" style="justify-content:center;gap:20px;">


<!-- ================= ADD QUESTION ================= -->

<div class="col col-40">

<div class="card">

<h3 style="text-align:center;">Add New Question</h3>


<div class="form-group">

<label>Question Text</label>

<asp:TextBox
ID="txtQuestion"
runat="server"
TextMode="MultiLine"
Rows="3"
CssClass="form-control">
</asp:TextBox>

</div>


<div class="row">

<div class="col">

<label>Option A</label>

<asp:TextBox
ID="txtOptA"
runat="server"
CssClass="form-control">
</asp:TextBox>

</div>


<div class="col">

<label>Option B</label>

<asp:TextBox
ID="txtOptB"
runat="server"
CssClass="form-control">
</asp:TextBox>

</div>

</div>


<div class="row">

<div class="col">

<label>Option C</label>

<asp:TextBox
ID="txtOptC"
runat="server"
CssClass="form-control">
</asp:TextBox>

</div>


<div class="col">

<label>Option D</label>

<asp:TextBox
ID="txtOptD"
runat="server"
CssClass="form-control">
</asp:TextBox>

</div>

</div>


<div class="row" style="align-items:flex-end;">

<div class="col">

<label>Correct Answer</label>

<asp:DropDownList
ID="ddlCorrect"
runat="server"
CssClass="form-control">

<asp:ListItem Text="Select" Value="" />
<asp:ListItem Text="Option A" Value="A" />
<asp:ListItem Text="Option B" Value="B" />
<asp:ListItem Text="Option C" Value="C" />
<asp:ListItem Text="Option D" Value="D" />

</asp:DropDownList>

</div>


<div class="col" style="flex:0 0 80px;">

<label>Marks</label>

<asp:TextBox
ID="txtMarks"
runat="server"
TextMode="Number"
Text="1"
CssClass="form-control">
</asp:TextBox>

</div>

</div>


<div style="margin-top:15px;">

<asp:Button
ID="btnAdd"
runat="server"
Text="Add Question"
CssClass="admin-btn admin-btn-primary"
OnClick="btnAdd_Click"
style="width:100%;" />

</div>


<asp:Label
ID="lblMsg"
runat="server"
style="display:block;margin-top:10px;text-align:center;color:green;">
</asp:Label>

</div>

</div>


<!-- ================= EXISTING QUESTIONS ================= -->

<div class="col col-60">

<div class="card">

<h3 style="text-align:center;">Existing Questions</h3>

<div style="overflow-x:auto;width:100%;">

<asp:GridView
ID="gvQuestions"
runat="server"
CssClass="admin-table"
Width="100%"
AutoGenerateColumns="False"
DataKeyNames="QuestionID"
OnRowDeleting="gvQuestions_RowDeleting">

<Columns>

<asp:BoundField DataField="QuestionText" HeaderText="Question" ItemStyle-Width="40%" />

<asp:BoundField DataField="OptionA" HeaderText="A" />

<asp:BoundField DataField="OptionB" HeaderText="B" />

<asp:BoundField DataField="OptionC" HeaderText="C" />

<asp:BoundField DataField="OptionD" HeaderText="D" />

<asp:BoundField
DataField="CorrectAnswer"
HeaderText="Ans"
ItemStyle-Font-Bold="true"
ItemStyle-ForeColor="Green"
ItemStyle-HorizontalAlign="Center" />

<asp:BoundField
DataField="Marks"
HeaderText="Marks"
ItemStyle-HorizontalAlign="Center" />

<asp:CommandField
ShowDeleteButton="True"
DeleteText="Remove"
ButtonType="Button"
ControlStyle-CssClass="admin-btn admin-btn-danger btn-small" />

</Columns>

<EmptyDataTemplate>

<div style="padding:20px;text-align:center;color:#666;">

No questions found for this exam.  
Select an exam or add a question to begin.

</div>

</EmptyDataTemplate>

</asp:GridView>

</div>

</div>

</div>


</div>

</div>

</div>

</asp:Content>  