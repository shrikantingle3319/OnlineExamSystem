<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AdminResults.aspx.cs"
    Inherits="OnlineExamSystem.Admin.AdminResults"
    MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Link Admin CSS -->
    <link href="admin.css" rel="stylesheet" />

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="admin-container">

    <h2>Student Exam Results</h2>

    <asp:GridView
        ID="gvResults"
        runat="server"
        CssClass="admin-table"
        AutoGenerateColumns="False">

        <Columns>

            <asp:BoundField
                DataField="StudentName"
                HeaderText="Student Name" />

            <asp:BoundField
                DataField="ExamName"
                HeaderText="Exam Name" />

            <asp:BoundField
                DataField="Score"
                HeaderText="Score" />

            <asp:BoundField
                DataField="SubmittedAt"
                HeaderText="Submitted On"
                DataFormatString="{0:dd-MM-yyyy HH:mm}" />

        </Columns>

    </asp:GridView>

</div>

</asp:Content>