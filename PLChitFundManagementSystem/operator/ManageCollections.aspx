<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ManageCollections.aspx.cs" Inherits="operator_ManageCollections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <style>
        .TestStyle {
            font: 12pt verdana;
            font-weight: 700;
            color: orange;
        }
    </style>
    <script src="../JS/jquery-1.10.2.min.js"></script>
    <script src="../JS/jquery-1.10.4-ui.js"></script>
    <link href="../css/jquery-ui-1.10.4.min.css" rel="stylesheet" />
    <link href="../css/gridview.css" rel="stylesheet" />
    <script type="text/javascript">

        jQuery(document).ready(function () {
            $("#<%= TxtDate.ClientID  %>").datepicker({
                dateFormat: 'yy/mm/dd'
            });
            $("#<%=btnAddCollection.ClientID%>").click(function () {
                var msg = ""; 
                if ($("#<%=txtCustomerId.ClientID%>").val() == "") {
                    msg += "Enter CustomerId\n"


                }
                if ($("#<%=txt_rcptNo.ClientID%>").val() == "") {
                    msg += "Enter Receiptno\n"

                }
                if ($("#<%=txtAmount.ClientID%>").val() == "") {
                    msg += "Enter Amount\n"

                }



                if ($("#<%=TxtDate.ClientID%>").val() == "") {
                    msg += "Enter Date\n"

                }

                if ($("#<%=rbtCheque.ClientID%>").attr('checked')) {

                    if ($("#<%=txtIssuedt.ClientID%>").val() == "") {
                        msg += "Enter Issuedt\n"
                    }
                    if ($("#<%=txtValidUpto.ClientID%>").val() == "") {
                        msg += "Enter ValidUpto\n"
                    }
                    if ($("#<%=txtCheckNo.ClientID%>").val() == "") {
                        msg += "Enter CheckNo\n"
                    }
                    if ($("#<%=ddlBank.ClientID%>").val() == 0) {
                        msg += "Select Bank\n"
                    }

                    if ($("#<%=ddlBranch.ClientID%>").val() == 0) {
                        msg += "Select Branch\n"
                    }

                    if (msg != "") {
                        alert(msg);
                        return false;
                    }
                }
                else if (msg != "") {
                    alert((msg));
                    return false;
                }
            });
        });
    </script>

    <style type="text/css">
        .myButton {
            background-color: #44c767;
            -moz-border-radius: 28px;
            -webkit-border-radius: 28px;
            border-radius: 28px;
            border: 1px solid #18ab29;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-family: arial;
            font-size: 17px;
            padding: 16px 31px;
            text-decoration: none;
            text-shadow: 0px 1px 0px #2f6627;
        }

            .myButton:hover {
                background-color: #5cbf2a;
            }

            .myButton:active
            {
                position: relative;
                top: 1px;
            }

       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div style="height: 20px"></div>
    <div align="center">
        <table align="center">
            <tr>
                <td colspan="2" align="center">Payment Details</td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>Customer Name</td>


                            <td>
                                <asp:TextBox ID="txtCustomer" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>Receipt NO</td>


                            <td>
                                <asp:TextBox ID="txt_rcptNo" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>Date Of Payment</td>


                            <td>
                                <asp:TextBox ID="TxtDate" runat="server"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table>
                        <tr>
                            <td>Customer Id</td>


                            <td>
                                <asp:TextBox ID="txtCustomerId" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="rbtCash" Text="By Cash" runat="server" value="1" GroupName="paymentType" Checked="True" AutoPostBack="True" /></td>
                            <td>
                                <asp:RadioButton ID="rbtCheque" Text="By Cheque" runat="server" value="0" GroupName="paymentType" AutoPostBack="True" /></td>
                        </tr>
                        <tr>
                            <td>Amount</td>


                            <td>
                                <asp:TextBox ID="txtAmount" runat="server" /></td>

                            <td></td>
                        </tr>

                    </table>
                </td>
            </tr>
        </table>
    </div>
    <%-- <table align="center"><tr> <td>
        <asp:RadioButton ID="rbtCash" Text="By Cash" runat="server" GroupName="paymentType" Checked="True" /></td>
        <td>
        <asp:RadioButton ID="rbtCheque" Text="By Cheque" runat="server" GroupName="paymentType" /></td>
           </tr></table>--%>
    <div id="pn1" runat="server" visible="false" style="width: 980px; height: 202px; margin: auto">
        <div align="center">
            <table align="center" border="1" bgcolor="#eeeeee">
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>Check No</td>


                                <td>
                                    <asp:TextBox ID="txtCheckNo" runat="server" /></td>
                            </tr>
                            <tr>
                                <td>Date Of Issue</td>


                                <td style="margin-left: 40px">
                                    <asp:TextBox ID="txtIssuedt" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Valid Upto</td>


                                <td>
                                    <asp:TextBox ID="txtValidUpto" runat="server"></asp:TextBox></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>Bank Name</td>


                                <td>
                                    <asp:DropDownList ID="ddlBank" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBank_SelectedIndexChanged">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td>Branch Name</td>


                                <td>
                                    <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="True">
                                    </asp:DropDownList></td>
                            </tr>

                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <%-- </asp:Panel>--%>
    </div>

    <div align="center">

        <asp:Button ID="btnAddCollection" Text="Add Collection" runat="server" OnClick="btnAddCollection_Click" CssClass="myButton" />&nbsp
         <asp:Button ID="btnShowDetails" Text="Show Details" runat="server" OnClick="btnShowDetails_Click" CssClass="myButton" />
    </div>

    <br />
    &nbsp;<div align="center">


        <br />
        <asp:Label ID="lblMessage" Text="Balance:  Rs " Visible="false" runat="server" />
        <asp:Label ID="lbl2" runat="server" Visible="false" Text="Amount Added To The Collection"></asp:Label>

        <asp:Label ID="lblBalance" Text="" runat="server" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" CssClass="mGrid"
 >
            <Columns>
                <asp:BoundField DataField="chitId" HeaderText="Chit ID" ReadOnly="True" SortExpression="chitId" />
                <asp:BoundField DataField="chitName" HeaderText="Chit Name" ReadOnly="True" SortExpression="chitName" />
                <asp:BoundField DataField="Total_Amount" HeaderText="Total" ReadOnly="True" SortExpression="Total_Amount" />
                <asp:TemplateField HeaderText="Chit Collections Details">
                    <ItemTemplate>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView2_RowCommand" OnRowDataBound="GridView2_RowDataBound">
                            <Columns>
                                <asp:BoundField HeaderText="Date" DataField="Date" />
                                <asp:BoundField HeaderText="months" DataField="Months" />
                                <asp:BoundField HeaderText="Year" DataField="Years" />
                                <asp:BoundField HeaderText="Installments" DataField="installment" />
                                <asp:BoundField HeaderText="PaidAmount" DataField="Paidamount" />
                                <asp:BoundField HeaderText="Due Amount" DataField="dueamount" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnPay" Text="pay" runat="server" CommandName="Pay" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />



    </div>



    <br />
</asp:Content>

