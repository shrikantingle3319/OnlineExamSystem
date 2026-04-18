<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="OnlineExamSystem.Admin.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"><link href="admin.css" rel="stylesheet" /></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Admin Dashboard</h2>
    <div class="dashboard-grid">
        <a href="ManageExams.aspx" class="dash-item"><i class="fa-solid fa-file-pen"></i><br>Exams</a>
        <a href="AdminResults.aspx" class="dash-item"><i class="fa-solid fa-chart-bar"></i><br>Results</a>
        <a href="AdminConcerns.aspx" class="dash-item"><i class="fa-solid fa-triangle-exclamation"></i><br>Concerns</a>
    </div>
</asp:Content>