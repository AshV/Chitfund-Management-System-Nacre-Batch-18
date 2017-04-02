<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.master" AutoEventWireup="true" CodeFile="op2.aspx.cs" Inherits="operator_op2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
 <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/Textbox.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h1 style="color:red">operator page2</h1>
    
    <input type="text"class="inputs" placeholder="e-mail" /> 
    <div class="inputs">
    <asp:TextBox ID="txt" runat="server" ></asp:TextBox>
    </br>
    <input type="password" class="inputs"placeholder="Password" /> 
 </div>
<br> 
             
           
</asp:Content>

