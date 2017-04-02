<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.master" AutoEventWireup="true" CodeFile="Auction.aspx.cs" Inherits="operator_Auction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        input {
            border-width:1px;
        }
        .auto-style3 {
            text-align: center;
            height: 21px;
            width: 100%;
        }

        .auto-style4 {
            color: #990000;
            font-weight: bold;
            font-size: large;
            text-align: center;
        }
    </style>
    <style type="text/css">
        .txtbox {
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
        }

        .auto-style5 {
            text-align: center;
            width: 192px;
        }

        .auto-style6 {
            width: 176px;
        }

        .auto-style9 {
            color: #800000;
            font-weight: bold;
        }

        .newStyle1 {
            position: absolute;
        }

        .auto-style10 {
            /*position: absolute;
            left: 324px;
            top: 302px;*/
            height: 338px;
            width: 50%;
        }

        .newStyle2 {
            position: absolute;
        }

        .auto-style11 {
            /*position: absolute;
            left: 864px;
            top: 323px;*/
            height: 320px;
            width: 40%;
        }

        .auto-style12 {
            text-align: justify;
            width: 192px;
        }

        .newStyle3 {
            position: absolute;
        }

        .newStyle4 {
            position: absolute;
        }
    </style>
     			
    <script src="../JS/jquery-1.10.2.js"></script>
    <script src="../JS/jquery-1.10.4-ui.js"></script>
    <script src="../JS/jquery.form-validator.min.js"></script>
    <link href="../css/jquery-ui-1.10.4.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(function () {
            $("#<%= txtDate.ClientID  %>").datepicker({
                dateFormat: 'yy/mm/dd'
            });
        });
    </script>

    
    <script type="text/javascript">
        $(document).ready(function () {
            $.validate();
            $("#<%=txtBiddingPer.ClientID %>").change(function () {
                 if ($("#<%=txtBiddingPer.ClientID %>").val() > 5 && $("#<%=txtBiddingPer.ClientID %>").val() < 45) {
                     var amount = $("#<%=txtTotalAmount.ClientID%>").val();
                     var biddingper = $("#<%=txtBiddingPer.ClientID %>").val();
                     var noOfperson = $("#<%=HiddenField1.ClientID%>").val();
                     var commision = (amount * 5) / 100; // commision
                     var bidding = (amount * biddingper) / 100;// bidamount
                     var divident = bidding - commision; //divident
                     var nextinstall = (amount - divident) / noOfperson;
                     var biddingamount = amount - divident - commision;
                     $("#<%=txtCommision.ClientID%>").val(commision);
                     $("#<%=txtDividend.ClientID%>").val(divident);
                     $("#<%=txtAmountPay.ClientID%>").val(nextinstall);
                     $("#<%=txtBiddingAmount.ClientID%>").val(biddingamount);
                 }
                 else {
                     alert("Please Enter the bidding percentage between 5% to 40% ");
                     $("#<%=txtBiddingPer.ClientID %>").val() = "";
                     return false;
                 }
             });
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        <asp:HiddenField ID="HiddenField1" runat="server" />
    </p>
   
    <div>
       <table align="left" class="auto-style10">
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lblchitid" runat="server" Text="Chit Name:" CssClass="auto-style4"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:DropDownList ID="ddlChitName" runat="server" CssClass="txtbox" data-validation="required" Height="23px" Width="139px" TabIndex="1" AutoPostBack="True" OnSelectedIndexChanged="ddlChitName_SelectedIndexChanged">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <p class="auto-style3">
                        &nbsp;
                    </p>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lblSubId" runat="server" Text="CustomerName:" CssClass="auto-style4"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:DropDownList ID="ddlSubName" runat="server" CssClass="txtbox" data-validation="required" Height="21px" Width="139px" TabIndex="2" OnSelectedIndexChanged="ddlSubName_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lblSubName" runat="server" Text="CustomerId:" CssClass="auto-style4"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtCustId" runat="server" CssClass="txtbox" data-validation="required" ReadOnly="True" TabIndex="-1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lblAuctionNo" runat="server" data-validation="number" Text="AuctionNo:" CssClass="auto-style4"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtAuctionNo" runat="server" CssClass="txtbox" ReadOnly="True" TabIndex="-1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lblDate" runat="server" Text="Date:" CssClass="auto-style4"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtDate" runat="server" data-validation="date" data-validation-format="yyyy/mm/dd" CssClass="txtbox" TabIndex="3"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lblBiddingPer" runat="server" Text="Bidding Percentage:" CssClass="auto-style4"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtBiddingPer" runat="server" CssClass="txtbox"  data-validation="number" data-validation-allowing="range[5;40]" TabIndex="4"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td class="auto-style6">
                    <asp:Button ID="btnSave" runat="server" Text="Save" Width="73px" CssClass="txtbox" Height="26px" TabIndex="5" OnClick="btnSave_Click" />
                    <br />
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>

        <table align="right" class="auto-style11">
            <tr>
                <td>\
                    <asp:Label ID="lblAmount" runat="server" CssClass="auto-style9" Text="Total Amount:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="txtbox" data-validation="number" data-validation-allowing="float" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblcommision" runat="server" CssClass="auto-style9" Text="Company Commision:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCommision" runat="server" data-validation="number" data-validation-allowing="float" CssClass="txtbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDiscount" runat="server" CssClass="auto-style9" Text="Dividend:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDividend" runat="server" data-validation="number" data-validation-allowing="float" CssClass="txtbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAmountPay" runat="server" CssClass="auto-style9" Text="Next Installment:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAmountPay" runat="server" data-validation="number" data-validation-allowing="float" CssClass="txtbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBiddingAmount" runat="server" CssClass="auto-style9" Text="BiddingAmount:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtBiddingAmount" runat="server" data-validation="number" data-validation-allowing="float" CssClass="txtbox" TabIndex="4"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>

