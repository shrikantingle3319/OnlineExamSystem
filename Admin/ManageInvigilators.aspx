<%@ Page Title="Invigilators" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageInvigilators.aspx.cs" Inherits="OnlineExamSystem.Admin.ManageInvigilators" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Manage Invigilators</h2>
    <div class="row"><div class="col col-100"><div class="card" style="max-width:500px; margin:0 auto;">
        <h3>Add New</h3>
        <label>Name</label><asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
        <label>Email</label><asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
        <label>Password</label><asp:TextBox ID="txtPass" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:Button ID="btnAdd" runat="server" Text="Create" CssClass="btn btn-primary" OnClick="btnAdd_Click" style="width:100%" />
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div></div>
    <div class="col col-100"><div class="card table-responsive">
        <h3>Existing</h3>
        <asp:GridView ID="gvInv" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="InvigilatorID" OnRowCommand="gvInv_RowCommand" OnRowDeleting="gvInv_RowDeleting">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="PasswordHash" HeaderText="Password" />
                <asp:TemplateField HeaderText="Status"><ItemTemplate><%# Convert.ToBoolean(Eval("IsActive")) ? "Active" : "Inactive" %></ItemTemplate></asp:TemplateField>
                <asp:TemplateField><ItemTemplate>
                    <asp:Button runat="server" CommandName="Toggle" CommandArgument='<%# Eval("InvigilatorID") %>' Text="Toggle" CssClass="btn btn-sm btn-primary" />
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-sm btn-danger" />
                </ItemTemplate></asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div></div></div>
</asp:Content>