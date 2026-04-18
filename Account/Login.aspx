<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineExamSystem.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<link href="Account.css" rel="stylesheet" />

<style>

/* Full background image */

.login-bg{
position:fixed;
top:0;
left:0;
width:100%;
height:100%;
background:url('../Account/student-giving-exam-scaled.jpg') no-repeat center center;
background-size:cover;
z-index:-2;
}

/* Dark overlay */

.login-overlay{
position:fixed;
top:0;
left:0;
width:100%;
height:100%;
background:rgba(0,0,0,0.5);
z-index:-1;
}

/* Center login card */

.auth-wrapper{
display:flex;
justify-content:center;
align-items:center;
min-height:85vh;
background:transparent;
}

</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="login-bg"></div>
<div class="login-overlay"></div>

<div class="auth-wrapper">

<div class="card auth-card">

<div class="auth-header">
<i class="fa-solid fa-shield-halved"></i>
<h2>Login</h2>
</div>

<div class="form-group" style="text-align:left">

<label>Role</label>

<asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
<asp:ListItem Value="Student">Student</asp:ListItem>
<asp:ListItem Value="Admin">Admin</asp:ListItem>
</asp:DropDownList>

</div>


<div class="form-group">

<asp:TextBox
ID="txtUser"
runat="server"
CssClass="form-control"
Placeholder="Email or Username">
</asp:TextBox>

</div>


<div class="form-group">

<asp:TextBox
ID="txtPass"
runat="server"
CssClass="form-control"
TextMode="Password"
Placeholder="Password">
</asp:TextBox>

</div>


<asp:Button
ID="btnLogin"
runat="server"
Text="Sign In"
CssClass="btn btn-primary"
OnClick="btnLogin_Click"
style="width:100%" />


<div class="auth-links">

<a href="Register.aspx">Register User</a>

<a href="ForgotPassword.aspx">Forgot Password?</a>

</div>


<asp:Label ID="lblMsg" runat="server" CssClass="msg-error"></asp:Label>

</div>

</div>

</asp:Content>