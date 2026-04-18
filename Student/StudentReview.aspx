<%@ Page Title="Review" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentReview.aspx.cs" Inherits="OnlineExamSystem.Student.StudentReview" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Review</h2>
    <asp:GridView ID="gvReview" runat="server" CssClass="table" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="QuestionText" HeaderText="Question" />
            <asp:BoundField DataField="CorrectAnswer" HeaderText="Correct Ans" ItemStyle-ForeColor="Green" ItemStyle-Font-Bold="true" />
            <asp:BoundField DataField="OptionA" HeaderText="A" />
            <asp:BoundField DataField="OptionB" HeaderText="B" />
            <asp:BoundField DataField="OptionC" HeaderText="C" />
            <asp:BoundField DataField="OptionD" HeaderText="D" />
        </Columns>
    </asp:GridView>
    <a href="StudentDashboard.aspx" class="btn btn-primary">Back</a>
</asp:Content>