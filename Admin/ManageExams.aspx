<%@ Page Title="Manage Exams" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageExams.aspx.cs" Inherits="OnlineExamSystem.Admin.ManageExams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="admin-container">

<asp:MultiView ID="mvExams" runat="server" ActiveViewIndex="0">


<asp:View ID="vList" runat="server">



<div style="width:420px;margin:auto;margin-bottom:30px;">

<div class="card">

<h3 style="text-align:center;">Create New Exam</h3>

<asp:Label ID="lblMsg" runat="server" ForeColor="Green"></asp:Label>

<br />

<label>Exam Title</label>

<asp:TextBox
ID="txtTitle"
runat="server"
CssClass="form-control"
placeholder="Example: Mathematics Final">
</asp:TextBox>

<br />

<label>Duration (Minutes)</label>

<asp:TextBox
ID="txtDur"
runat="server"
TextMode="Number"
CssClass="form-control"
placeholder="60">
</asp:TextBox>

<br />

<label>Total Marks</label>

<asp:TextBox
ID="txtMarks"
runat="server"
TextMode="Number"
CssClass="form-control"
placeholder="100">
</asp:TextBox>

<br />

<asp:Button
ID="btnCreate"
runat="server"
Text="Next: Add Questions"
CssClass="admin-btn admin-btn-primary"
Width="100%"
OnClick="btnCreate_Click" />

</div>

</div>



<div class="card">

<h3>Existing Exams</h3>

<div style="overflow-x:auto;width:100%;">

<asp:GridView
ID="gvExams"
runat="server"
AutoGenerateColumns="False"
DataKeyNames="ExamID"
OnRowCommand="gvExams_RowCommand"
CssClass="admin-table"
Width="100%"
GridLines="None">

<Columns>


<asp:TemplateField HeaderText="Exam Name" ItemStyle-Width="40%">

<ItemTemplate>

<asp:LinkButton
runat="server"
Text='<%# Eval("ExamName") %>'
CommandName="EditExam"
CommandArgument='<%# Eval("ExamID") %>'
Font-Bold="true" />

</ItemTemplate>

</asp:TemplateField>



<asp:BoundField
DataField="Duration"
HeaderText="Minutes"
ItemStyle-Width="15%" />



<asp:BoundField
DataField="TotalMarks"
HeaderText="Marks"
ItemStyle-Width="15%" />



<asp:TemplateField HeaderText="Status" ItemStyle-Width="10%">

<ItemTemplate>

<%# Convert.ToBoolean(Eval("IsActive")) ? "Active" : "Inactive" %>

</ItemTemplate>

</asp:TemplateField>



<asp:TemplateField HeaderText="Actions" ItemStyle-Width="20%">

<ItemTemplate>

<asp:Button
runat="server"
Text="Toggle"
CommandName="Toggle"
CommandArgument='<%# Eval("ExamID") %>' />

&nbsp;

<asp:Button
runat="server"
Text="Delete"
CommandName="DeleteExam"
CommandArgument='<%# Eval("ExamID") %>' />

</ItemTemplate>

</asp:TemplateField>

</Columns>

</asp:GridView>

</div>

</div>

</asp:View>



<asp:View ID="vEdit" runat="server">

<h2>
Edit Exam :
<asp:Label ID="lblEditName" runat="server"></asp:Label>
</h2>

<asp:Button
ID="btnBack"
runat="server"
Text="← Back to List"
OnClick="btnBack_Click" />

<br /><br />

<label>Exam Name</label>

<asp:TextBox
ID="txtEditName"
runat="server"
CssClass="form-control">
</asp:TextBox>

<br />

<label>Duration</label>

<asp:TextBox
ID="txtEditDur"
runat="server"
CssClass="form-control">
</asp:TextBox>

<br />

<label>Total Marks</label>

<asp:TextBox
ID="txtEditMarks"
runat="server"
CssClass="form-control">
</asp:TextBox>

<br /><br />

<asp:CheckBox
ID="chkResult"
runat="server"
Text="Show Result to Student" />

<br />

<asp:CheckBox
ID="chkReview"
runat="server"
Text="Allow Answer Review" />

<br /><br />

<asp:Button
ID="btnUpdateDetails"
runat="server"
Text="Update Details"
OnClick="btnUpdateDetails_Click" />

<hr />

<h3>Add New Question</h3>

<label>Question</label>

<asp:TextBox
ID="txtQ"
runat="server"
TextMode="MultiLine"
Rows="3"
Width="100%">
</asp:TextBox>

<br /><br />

<asp:TextBox ID="txtA" runat="server" placeholder="Option A"></asp:TextBox>

<asp:TextBox ID="txtB" runat="server" placeholder="Option B"></asp:TextBox>

<asp:TextBox ID="txtC" runat="server" placeholder="Option C"></asp:TextBox>

<asp:TextBox ID="txtD" runat="server" placeholder="Option D"></asp:TextBox>

<br /><br />

Correct Answer :

<asp:DropDownList ID="ddlAns" runat="server">

<asp:ListItem>A</asp:ListItem>
<asp:ListItem>B</asp:ListItem>
<asp:ListItem>C</asp:ListItem>
<asp:ListItem>D</asp:ListItem>

</asp:DropDownList>

&nbsp;

<asp:Button
ID="btnAddQ"
runat="server"
Text="Add Question"
OnClick="btnAddQ_Click" />

<hr />

<h3>Questions in this Exam</h3>

<asp:GridView
ID="gvQuestions"
runat="server"
AutoGenerateColumns="False"
DataKeyNames="QuestionID"
OnRowDeleting="gvQuestions_RowDeleting"
Width="100%">

<Columns>

<asp:BoundField DataField="QuestionText" HeaderText="Question" />

<asp:BoundField DataField="OptionA" HeaderText="A" />

<asp:BoundField DataField="OptionB" HeaderText="B" />

<asp:BoundField DataField="OptionC" HeaderText="C" />

<asp:BoundField DataField="OptionD" HeaderText="D" />

<asp:BoundField DataField="CorrectAnswer" HeaderText="Answer" />

<asp:CommandField ShowDeleteButton="True" />

</Columns>

</asp:GridView>

</asp:View>

</asp:MultiView>

</div>

</asp:Content>