<%@ Page Title="Forgot" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="OnlineExamSystem.Account.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"><link href="Account.css" rel="stylesheet" /></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="auth-wrapper"><div class="card auth-card">
        <h2>Reset Password</h2>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Enter Email"></asp:TextBox>
        <asp:Button ID="btnSend" runat="server" Text="Send OTP" CssClass="btn btn-primary" OnClick="btnSend_Click" style="width:100%" />
        <div class="auth-links"><a href="Login.aspx">Back to Login</a></div>
        <asp:Label ID="lblMsg" runat="server" CssClass="msg-error"></asp:Label>
    </div></div>
</asp:Content>