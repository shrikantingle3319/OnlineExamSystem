<%@ Page Title="Result" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentResult.aspx.cs" Inherits="OnlineExamSystem.Student.StudentResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Student.css" rel="stylesheet" />
    <style>
        .result-container {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .result-card {
            background: white;
            padding: 40px;
            border-radius: 16px;
            width: 100%;
            max-width: 500px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            border: 1px solid #f3f4f6;
        }
        .score-circle {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: #f0fdf4;
            color: #15803d;
            border: 8px solid #bbf7d0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin: 20px auto;
        }
        .score-number {
            font-size: 3rem;
            font-weight: 800;
            line-height: 1;
        }
        .score-total {
            font-size: 1rem;
            color: #166534;
            font-weight: 600;
        }
        .exam-title {
            color: #111827;
            margin-bottom: 5px;
            font-size: 1.5rem;
        }
        .result-meta {
            color: #6b7280;
            margin-bottom: 30px;
            font-size: 0.95rem;
        }
        .btn-home {
            background-color: #4f46e5;
            color: white;
            padding: 12px 30px;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
            display: inline-block;
            transition: background 0.2s;
        }
        .btn-home:hover {
            background-color: #4338ca;
            transform: translateY(-2px);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="result-container">
        <div class="result-card">
            <h2 class="exam-title"><asp:Label ID="lblExamName" runat="server"></asp:Label></h2>
            <p class="result-meta">Exam Completed Successfully</p>
            
            <div class="score-circle">
                <span class="score-number"><asp:Label ID="lblScore" runat="server"></asp:Label></span>
                <span class="score-total">out of <asp:Label ID="lblTotalMarks" runat="server"></asp:Label></span>
            </div>

            <div style="margin-bottom: 25px;">
                <p><strong>Percentage:</strong> <asp:Label ID="lblPercentage" runat="server"></asp:Label></p>
                <p style="color:#6b7280; font-size:0.9rem;">Submitted on: <asp:Label ID="lblDate" runat="server"></asp:Label></p>
            </div>

            <a href="StudentDashboard.aspx" class="btn-home">Return to Dashboard</a>
        </div>
    </div>
</asp:Content>