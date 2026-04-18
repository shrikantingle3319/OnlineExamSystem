<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineExamSystem.Account.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"><link href="Account.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="auth-wrapper"><div class="card auth-card">
        <h2>Student Registration</h2>
        <div class="form-group">
            <label>Register As</label>
            <asp:DropDownList ID="ddlRegRole" runat="server" CssClass="form-control">
                <asp:ListItem Value="Student">Student</asp:ListItem>
                <asp:ListItem Value="Admin">Admin</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group"><asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Full Name"></asp:TextBox></div>
        <div class="form-group"><asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email"></asp:TextBox></div>
        <div class="form-group"><asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Password"></asp:TextBox></div>
        <asp:Button ID="btnRegister" runat="server" Text="Register & Send OTP" CssClass="btn btn-success" OnClick="btnRegister_Click" style="width:100%" />
        <div class="auth-links"><a href="Login.aspx">Back to Login</a></div>
        <asp:Label ID="lblMsg" runat="server" CssClass="msg-error"></asp:Label>
    </div></div>
</asp:Content>