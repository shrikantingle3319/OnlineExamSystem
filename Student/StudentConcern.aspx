<%@ Page Title="Concern" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentConcern.aspx.cs" Inherits="OnlineExamSystem.Student.StudentConcern" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card" style="max-width:600px; margin:0 auto;">
        <h2>Report Issue</h2>
        <label>Question</label><asp:DropDownList ID="ddlQ" runat="server" CssClass="form-control"></asp:DropDownList>
        <label>Issue</label><asp:TextBox ID="txtIssue" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-danger" OnClick="btnSubmit_Click" />
        <asp:Label ID="lblMsg" runat="server" CssClass="msg-success"></asp:Label>
    </div>
</asp:Content>