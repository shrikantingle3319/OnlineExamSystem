<%@ Page Title="Exam" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentExam.aspx.cs" Inherits="OnlineExamSystem.Student.StudentExam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Student.css" rel="stylesheet" />
    <script>
        function startTimer(duration) {
            var display = document.getElementById("time");
            var timer = setInterval(function () {
                var m = Math.floor(duration / 60);
                var s = duration % 60;
                display.textContent = m + ":" + (s < 10 ? "0" + s : s);
                if (--duration < 0) {
                    clearInterval(timer);
                    alert("Time Up! Submitting exam...");
                    document.getElementById('<%= btnSubmit.ClientID %>').click();
                }
            }, 1000);
        }

        // Anti-cheat warnings
        document.addEventListener("visibilitychange", function () {
            if (document.hidden) {
                document.title = "⚠️ Warning!";
                // Optional: You can trigger an auto-submit here if strict mode is needed
            } else {
                document.title = "Exam";
            }
        });

        // Prevent back button
        history.pushState(null, null, location.href);
        window.onpopstate = function () { history.go(1); };
    </script>
    <style>
        .exam-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #fff;
            padding: 15px 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            margin-bottom: 20px;
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .q-block {
            background: #fff;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #e5e7eb;
        }
        .q-text {
            font-size: 1.1rem;
            color: #111827;
            margin-bottom: 15px;
            font-weight: 600;
        }
        .options-list {
            width: 100%;
        }
        .options-list td {
            padding: 8px 5px;
        }
        .options-list label {
            margin-left: 8px;
            cursor: pointer;
            color: #374151;
        }
        .btn-submit {
            background-color: #10b981;
            color: white;
            padding: 12px 30px;
            font-size: 1.1rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            float: right;
            margin-bottom: 40px;
        }
        .btn-submit:hover {
            background-color: #059669;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="exam-header">
        <h3 style="margin:0;"><asp:Label ID="lblTitle" runat="server"></asp:Label></h3>
        <div style="font-size: 1.2rem; background: #fee2e2; color: #b91c1c; padding: 5px 15px; border-radius: 20px;">
            <i class="fa-regular fa-clock"></i> <span id="time" style="font-weight:bold;">00:00</span>
        </div>
    </div>

    <asp:Repeater ID="rptQ" runat="server" OnItemDataBound="rptQ_ItemDataBound">
        <ItemTemplate>
            <div class="q-block">
                <div class="q-text">
                    <%# Container.ItemIndex + 1 %>. <%# Eval("QuestionText") %>
                </div>
                <asp:HiddenField ID="hfQID" runat="server" Value='<%# Eval("QuestionID") %>' />
                <asp:RadioButtonList ID="rblOpts" runat="server" CssClass="options-list">
                    <%-- Items added in CodeBehind to prevent parser errors --%>
                </asp:RadioButtonList>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <div style="overflow: auto;">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Exam" CssClass="btn-submit" OnClick="btnSubmit_Click" OnClientClick="return confirm('Are you sure you want to submit your answers? This cannot be undone.');" />
    </div>
</asp:Content>