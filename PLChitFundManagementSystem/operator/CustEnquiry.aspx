<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.master" AutoEventWireup="true" CodeFile="CustEnquiry.aspx.cs" Inherits="CustEnquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        input{
        border-width:1px;
        }
        .auto-style2 {
        width: 71%;
        position: relative;
        top: -1px;
        left: 62px;
    }
        .auto-style5 {
            height: 26px;
            width: 483px;
        }
        .auto-style7 {
            height: 30px;
            width: 483px;
        }
        .auto-style8 {
            width: 483px;
        }
        .auto-style9 {
            width: 492px;
        }
        .auto-style10 {
            height: 30px;
            width: 492px;
        }
        .auto-style11 {
            height: 26px;
            width: 492px;
        }
        .auto-style12 {
            width: 611px;
        }
        .auto-style13 {
            height: 30px;
            width: 611px;
        }
        .auto-style14 {
            height: 26px;
            width: 611px;
        }
        .auto-style15 {
            width: 379px;
        }
        .auto-style16 {
            height: 30px;
            width: 379px;
        }
        .auto-style17 {
            height: 26px;
            width: 379px;
        }
    </style>
    <script src="../JS/jquery-1.10.2.js"></script>
     <script src="../JS/jquery-1.10.4-ui.js"></script>
    <script src="../JS/jquery.form-validator.min.js"></script>
    <link href="../css/jquery-ui-1.10.4.min.css" rel="stylesheet" />
     <script type="text/javascript">

        $(document).ready(function () {
            $("#<%= txtDob.ClientID  %>").datepicker({
                dateFormat: 'yy/mm/dd'
            });
            $.validate();
           
            
        });
           
                </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style2" style="font-family: verdana, Geneva, Tahoma, sans-serif; font-size: medium; background-color: #FFFFFF;">
    <tr>
        <td class="auto-style12" style="font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">&nbsp;&nbsp; Customer Name:</td>
        <td style="text-align: left" class="auto-style9">
            <asp:TextBox ID="txtCustomerName" runat="server"  data-validation="required" ></asp:TextBox>
            <span id="1" style="color: #CC0000; font-size: small" >  &nbsp;</span></td>
        <td style="text-align: right" class="auto-style15">
             Area:</td>
        <td style="text-align: left" class="auto-style8">
             <asp:TextBox ID="txtArea" runat="server" data-validation="required"></asp:TextBox>
        <span id="8" style="color: #CC0000; font-size: small">  &nbsp;</span></td>
    </tr>
    <tr>
        <td class="auto-style12" style="font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">&nbsp; Date of Birth:</td>
        <td style="text-align: left" class="auto-style9">
             <asp:TextBox ID="txtDob" runat="server" data-validation="date" data-validation-format="yyyy/mm/dd"></asp:TextBox>
             <span id="2" style="color: #CC0000; font-size: small">  
             &nbsp;</span></td>
       
        <td style="text-align: right" class="auto-style15">
            House Number:</td>
       
        <td style="text-align: left" class="auto-style8">
            <asp:TextBox ID="txtHouseNo" runat="server"></asp:TextBox>
        <span id="9" style="color: #CC0000; font-size: small">  &nbsp;</span></td>
       
    </tr>
    <tr>
        <td class="auto-style13" style="font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mobile Number:</td>
        <td class="auto-style10" style="text-align: left">
            <asp:TextBox ID="txtMobileNo" runat="server" data-validation="custom" data-validation-regexp="^[789]\d{9}$"></asp:TextBox>
        <span id="3"style="color: #CC0000; font-size: small" >  &nbsp;</span></td>
        <td class="auto-style16" style="text-align: right">
            &nbsp; Street:</td>
        <td class="auto-style7" style="text-align: left">
            <asp:TextBox ID="txtStreet" runat="server" data-validation="required"></asp:TextBox>
        <span id="10"style="color: #CC0000; font-size: small" >  &nbsp;</span></td>
    </tr>
    <tr>
        <td class="auto-style12" style="font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alternate Number:</td>
        <td style="text-align: left" class="auto-style9">
            <asp:TextBox ID="txtAlternateNo" runat="server" data-validation="custom" data-validation-regexp="^[789]\d{9}$" data-validation-optional="true"></asp:TextBox>
        <span id="4"style="color: #CC0000; font-size: small" >  &nbsp;</span></td>
        <td style="text-align: right" class="auto-style15">
            Zip:</td>
        <td style="text-align: left" class="auto-style8">
            <asp:TextBox ID="txtZip" runat="server" data-validation="custom" data-validation-regexp="^\d{6}$" ></asp:TextBox>
        <span id="11"style="color: #CC0000; font-size: small" >  &nbsp;</span></td>
    </tr>
    <tr>
        <td class="auto-style14" style="font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Spouse:</td>
        <td class="auto-style11" style="text-align: left">
            <asp:TextBox ID="txtSpouse" runat="server" ></asp:TextBox>
        <span id="5"style="color: #CC0000; font-size: small" >  &nbsp;</span></td>
        <td class="auto-style17" style="text-align: right">
            Select State:</td>
        <td class="auto-style5" style="text-align: left">
                <asp:DropDownList ID="ddlState" runat="server" data-validation="required" Font-Size="Medium" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" Width="129px">
                    <asp:ListItem Value="" Text="Select state"></asp:ListItem>
                </asp:DropDownList><span id="12"></span>
        </td>
    </tr>
    <tr>
        <td class="auto-style14" style="font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email Id:</td>
        <td class="auto-style11" style="text-align: left">
            <asp:TextBox ID="txtEmailId" runat="server" data-validation="email"></asp:TextBox>
        <span id="6" >  &nbsp;</span></td>
        <td class="auto-style17" style="text-align: right">
            Select City:</td>
        <td class="auto-style5" style="text-align: left">
                <asp:DropDownList ID="ddlCity" runat="server" data-validation="required" Font-Size="Medium" Width="129px">
                    <asp:ListItem Value="" Text="Select city"></asp:ListItem>
                </asp:DropDownList><span id="13"></span>
        </td>
    </tr>
    <tr>
        <td class="auto-style12" style="font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">&nbsp;Contact Person:</td>
        <td style="text-align: left" class="auto-style9">
            <asp:TextBox ID="txtContactPerson" runat="server" data-validation="required"></asp:TextBox>
        <span id="7" >  &nbsp;</span></td>
        <td style="text-align: right" class="auto-style15">
            &nbsp;</td>
        <td style="text-align: left" class="auto-style8">
                &nbsp;&nbsp; </td>
    </tr>
    <tr>
        <td class="auto-style12" style="font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="text-align: left" class="auto-style9">
            &nbsp;</td>
        <td style="text-align: right" class="auto-style15">
            &nbsp;</td>
        <td style="text-align: left" class="auto-style8">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style12" style="font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">&nbsp;</td>
        <td style="text-align: left" class="auto-style9">
        &nbsp;
            &nbsp;&nbsp;
            <asp:Button ID="btnRegister" runat="server" Text="Register" Font-Size="Medium" OnClick="Button1_Click" />
&nbsp;</td>
        <td style="text-align: right" class="auto-style15">
            &nbsp;</td>
        <td style="text-align: left" class="auto-style8">
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

