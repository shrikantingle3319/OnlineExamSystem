<%@ Page Title="Concerns" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminConcerns.aspx.cs" Inherits="OnlineExamSystem.Admin.AdminConcern" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="admin.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-container">
        <!-- Header Row -->
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:20px;">
            <h2 style="margin:0; color:#1f2937;">Student Concerns</h2>
            <a href="AdminDashboard.aspx" class="admin-btn" style="background-color: #6c757d; text-decoration: none;">&larr; Back to Dashboard</a>
        </div>
        
        <!-- Grid View Card -->
        <div class="card">
            <div style="margin-bottom: 15px;">
                <h3 style="margin:0;">Reported Issues</h3>
            </div>
            
            <div style="overflow-x:auto;">
                <asp:GridView ID="gvConcerns" runat="server" CssClass="admin-table" 
                    AutoGenerateColumns="False" 
                    OnRowCommand="gvConcerns_RowCommand" 
                    ShowHeaderWhenEmpty="true" 
                    EmptyDataText="No concerns have been reported by students.">
                    <Columns>
                        <asp:BoundField DataField="ExamName" HeaderText="Exam" ItemStyle-Font-Bold="true" />
                        <asp:BoundField DataField="QuestionText" HeaderText="Question" ItemStyle-Width="35%" />
                        <asp:BoundField DataField="ConcernText" HeaderText="Issue" ItemStyle-Width="35%" />
                        
                        <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <%# Eval("Status").ToString() == "Open" ? "<span style='color:#dc3545; font-weight:bold;'>Open</span>" : "<span style='color:#28a745; font-weight:bold;'>" + Eval("Status") + "</span>" %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <asp:Button runat="server" Text="Resolve" 
                                    CommandName="Resolve" 
                                    CommandArgument='<%# Eval("ConcernID") %>' 
                                    CssClass="admin-btn btn-small" 
                                    style="background-color: #28a745; border:none;" 
                                    Visible='<%# Eval("Status").ToString()=="Open" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>