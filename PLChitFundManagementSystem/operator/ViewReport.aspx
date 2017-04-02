<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.master" AutoEventWireup="true" CodeFile="ViewReport.aspx.cs" Inherits="ViewReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/bootstrap.css" rel="stylesheet" /> 
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/jquery-ui-1.10.4.custom.min.css" rel="stylesheet" />
    <link href="css/jquery-ui-1.10.4.min.css" rel="stylesheet" />

    <script src="Js/jquery-1.11.1.min.js"></script>
    <link href="../css/gridview.css" rel="stylesheet" />
    <script src="Js/jquery-ui-1.10.4.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
    <asp:GridView ID="gvShowReport" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" float="center" CssClass="mGrid"
>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
        </div>
    <div align="center">
        <asp:Button class="btn btn-large btn-success" Text="Generate Report" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click"  />
           <asp:Button class="btn btn-large btn-success" Text="Cancel" ID="btnCancel" runat="server" PostBackUrl="~/Report.aspx"  />
    </div>
</asp:Content>

