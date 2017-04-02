<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.master" AutoEventWireup="true" CodeFile="SubRegistration.aspx.cs" Inherits="SubRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        input {
            border-width: 1px;
        }
    </style>
    <script src="../JS/jquery.js"></script>
    <script src="../JS/jquery-ui.min.js"></script>
    <link href="../css/jquery-ui.css" rel="stylesheet" />
    <script src="../JS/jquery.form-validator.min.js"></script>
    <link href="../css/Styles/style.css" rel="stylesheet" />
    <script type="text/javascript">

        $(document).ready(function () {
            $("#<%= Button7.ClientID  %>").click(function () {
                $.validate();
            });
            $("#<%= txtDob.ClientID  %>").datepicker({
                dateFormat: 'yy/mm/dd'
            });
            $('#<%=txtCustomerName.ClientID%>').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "SubRegistration.aspx/GetAutoCompleteData",
                        data: "{'username':'" + $('#<%=txtCustomerName.ClientID%>').val() + "'}",
                        dataType: "json",
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    label: item.split('/')[0],
                                    val: item.split('/')[1]
                                }
                            }));

                        },
                        error: function (result) {
                            alert("Error");
                        },
                    });
                },
                select: function (event, ui) {
                    $('#<%=txtCustomerId.ClientID%>').val(ui.item.val);

                },
                change: function (event, ui) {
                },
                focus: function (event, ui) {
                    $('#<%=txtCustomerName.ClientID%>').val(ui.item.label);
                    $('#<%=txtCustomerId.ClientID%>').val(ui.item.val);
                }
            });
        });
    </script>
    <style type="text/css">
        .auto-style8 {
            width: 100%;
        }

        #Text4 {
            width: 269px;
        }

        #Text5 {
            width: 270px;
        }

        #Text2 {
            width: 266px;
        }

        #Text3 {
            width: 138px;
        }

        .auto-style9 {
            width: 282px;
        }

        .auto-style11 {
            width: 445px;
        }

        .auto-style14 {
            width: 287px;
        }

        .auto-style15 {
            width: 242px;
        }

        .auto-style20 {
            width: 233px;
        }

        #Text9 {
            width: 269px;
        }

        #Text10 {
            width: 270px;
        }

        #Text7 {
            width: 266px;
        }

        #Text8 {
            width: 138px;
        }

        .auto-style24 {
            width: 211px;
        }

        .auto-style26 {
            width: 288px;
        }

        .auto-style27 {
            width: 221px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="portlet box">

        <table class="auto-style8" style="background-color: #FFF2F7">
            <tr>
                <td>
                    <asp:RadioButton ID="RadioButton1" runat="server" Text="New Cutomer" GroupName="customer" Checked="true" AutoPostBack="True" OnCheckedChanged="RadioButton1_CheckedChanged" />
                    <asp:RadioButton ID="RadioButton2" runat="server" Text="Old Customer" GroupName="customer" OnCheckedChanged="RadioButton2_CheckedChanged" AutoPostBack="True" />
                </td>
            </tr>
        </table>
        <div runat="server" visible="false" id="divCustomer">
            <table class="auto-style2" style="background-color: #CCFFCC; border: thin solid #000000">
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="text-align: right; font-family: verdana, Geneva, Tahoma, sans-serif; font-size: 14px;">
                        <asp:Label ID="Label1" runat="server" Text="Enter Customer Name :"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="text-align: left">&nbsp;
                    <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox>
                </tr>
                <tr>
                    <td style="text-align: right; font-family: verdana, Geneva, Tahoma, sans-serif; font-size: 14px;">

                        <asp:Label ID="Label2" runat="server" Text="Customer ID :"></asp:Label>
                        &nbsp;
                    
                    </td>
                    <td style="text-align: left">&nbsp;
                    <asp:TextBox ID="txtCustomerId" runat="server" data-validation="number"></asp:TextBox>
                        <asp:Button ID="btnSearch" runat="server" Text="GetData" OnClick="btnSearch_Click" />
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
        <table>
            <tr>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style20">Customer Name:</td>
                <td style="text-align: left" class="auto-style26">
                    <asp:TextBox ID="txtName" runat="server" data-validation="required"></asp:TextBox>
                </td>
                <td class="auto-style24" style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;">Area:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtArea" runat="server" data-validation="required"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style20">Date of Birth:</td>
                <td style="text-align: left" class="auto-style26">
                    <asp:TextBox ID="txtDob" runat="server" data-validation="date" data-validation-format="yyyy/mm/dd"></asp:TextBox>(dd/mm/yyyy)
                </td>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style24">House Number:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtHouseNo" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style20">Mobile Number:</td>
                <td style="text-align: left" class="auto-style26">
                    <asp:TextBox ID="txtMobileNo" runat="server" data-validation="custom" data-validation-regexp="^[789]\d{9}$"></asp:TextBox>
                </td>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style24">Street:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtStreet" runat="server" data-validation="required"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style20">Alternate Number:</td>
                <td style="text-align: left" class="auto-style26">
                    <asp:TextBox ID="txtAlternateNo" runat="server" data-validation="custom" data-validation-regexp="^[789]\d{9}$" data-validation-optional="true"></asp:TextBox>
                </td>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style24">Zip:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtZip" runat="server" data-validation="custom" data-validation-regexp="^\d{6}$"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style20">Spouse:</td>
                <td style="text-align: left" class="auto-style26">
                    <asp:TextBox ID="txtSpouse" runat="server"></asp:TextBox>
                </td>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style24">Select state:&nbsp; </td>
                <td style="text-align: left">
                    <asp:DropDownList ID="DropDownList4" runat="server" data-validation="required" Font-Size="Medium" AutoPostBack="True" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style20">Email Id:</td>
                <td style="text-align: left" class="auto-style26">
                    <asp:TextBox ID="txtEmailId" runat="server" data-validation="email"></asp:TextBox>
                </td>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style24">Select City:</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="DropDownList5" data-validation="required" runat="server" Font-Size="Medium" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style20">Contact Person:</td>
                <td style="text-align: left" class="auto-style26">
                    <asp:TextBox ID="txtContactPerson" runat="server" data-validation="required"></asp:TextBox>
                </td>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style24">&nbsp;</td>
                <td style="text-align: left">&nbsp;</td>
            </tr>
        </table>
        <asp:TextBox ID="txtAddressId" runat="server" BorderStyle="None" Visible="False"></asp:TextBox>
        <br />
        <table class="auto-style8" style="background-color: #FFF2F7">
            <tr>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style20">&nbsp;</td>
                <td style="text-align: left" class="auto-style9">&nbsp;</td>
                <td style="text-align: left">&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style20">&nbsp;</td>
                <td style="text-align: left" class="auto-style9">&nbsp;</td>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style27">&nbsp; Id Proof Type:</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="DropDownList3" runat="server" Font-Size="Medium" data-validation="required">
                    </asp:DropDownList>
                    &nbsp;<asp:FileUpload ID="fucIdProofType" runat="server" data-validation="required" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style20">&nbsp;</td>
                <td style="text-align: left" class="auto-style9">&nbsp;</td>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style27">Address Proof Type:</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="DropDownList2" runat="server" Font-Size="Medium" data-validation="required">
                    </asp:DropDownList>
                    &nbsp;<asp:FileUpload ID="fucAddressProofType" runat="server" data-validation="required" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style20">&nbsp;</td>
                <td style="text-align: left" class="auto-style9">&nbsp;</td>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style27">Photo:</td>
                <td style="text-align: left">
                    <asp:FileUpload ID="fucPhoto" runat="server" data-validation="required" />
                </td>
            </tr>
        </table>
        <br />
        &nbsp;&nbsp;<table class="auto-style8" style="background-color: #FFF2F7">
            <tr>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style11">&nbsp;</td>
                <td style="text-align: left" class="auto-style14">&nbsp; 
                &nbsp;
                <asp:Button ID="Button7" runat="server" Text="Submit" Font-Size="Medium" OnClick="Button7_Click" />
                    &nbsp;<asp:Button ID="Button8" runat="server" Text="Cancel" Font-Size="Medium" />
                </td>
                <td style="text-align: right; font-size: medium; font-family: verdana, Geneva, Tahoma, sans-serif;" class="auto-style15">&nbsp;</td>
                <td style="text-align: left">&nbsp;</td>
            </tr>
        </table>
        <br />
        &nbsp;<br />
        <br />
        <br />
    </div>
</asp:Content>
