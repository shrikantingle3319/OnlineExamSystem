<%@ Page Title="Verify" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerifyOTP.aspx.cs" Inherits="OnlineExamSystem.Account.VerifyOTP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"><link href="Account.css" rel="stylesheet" /></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="auth-wrapper"><div class="card auth-card">
        <h2>Verify OTP</h2>
        <asp:TextBox ID="txtOTP" runat="server" CssClass="form-control" Placeholder="Enter 6-digit Code"></asp:TextBox>
        <asp:Button ID="btnVerify" runat="server" Text="Verify" CssClass="btn btn-primary" OnClick="btnVerify_Click" style="width:100%" />
        <asp:Label ID="lblMsg" runat="server" CssClass="msg-error"></asp:Label>
    </div></div>
</asp:Content>