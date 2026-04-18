<%@ Page Title="Reset" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="OnlineExamSystem.Account.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"><link href="Account.css" rel="stylesheet" /></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="auth-wrapper"><div class="card auth-card">
        <h2>New Password</h2>
        <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password" Placeholder="New Password"></asp:TextBox>
        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" OnClick="btnUpdate_Click" style="width:100%" />
        <asp:Label ID="lblMsg" runat="server" CssClass="msg-success"></asp:Label>
    </div></div>
</asp:Content>