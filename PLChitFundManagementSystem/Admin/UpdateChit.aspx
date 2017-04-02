<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.master" AutoEventWireup="true" CodeFile="UpdateChit.aspx.cs" Inherits="Admin_UpdateChit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../JS/jquery-1.10.2.js"></script>
    <script src="../JS/jquery-ui-1.10.4.js"></script>
    <link href="../css/jquery-ui-1.10.4.custom.css" rel="stylesheet" />
    <link href="../css/gridview.css" rel="stylesheet" />
       <script>

        function ShowPopup() {
            $("#<%= pnlpopup.ClientID %>").dialog({

                modal: true,
                minHeight: 750,
                height: "auto",
                width: 500,
                title: "Edit Chit",
                appendTo: "form",
                show:
                {
                    effect: "blind",
                    duration: 500
                },
                hide:
                {
                    effect: "explode",
                    duration: 500
                }
            });
            $("#<%= pnlpopup.ClientID %>").css("height", 750);
        }
        function HidePopup() {
            $("#<%= pnlpopup.ClientID %>").dialog("Close");
        }


        $("#txtchitGroupStartDate").datepicker();
        $("#txtchitGroupEndDate").datepicker();
        $("#txtchitGroupAuctionDay").datepicker();
        $("#txtpreviousSanctionDate").datepicker();
       </script>
    <script>
        $(document).ready(function () {

            $("#<%=btnUpdate.ClientID%>").click(function () {

                var isValid = true;

                if ($("#<%= txtnoOfMonths.ClientID %>").val() == "") {
                    isValid = false;
                    $("#s2").text('Can not be empty');
                }

                if ($("#<%= txtnoOfCustomer.ClientID %>").val() == "") {
                    isValid = false;
                    $("#s3").text('Can not be empty');
                }
                if ($("#<%= txtchitValue.ClientID %>").val() == "") {
                    isValid = false;
                    $("#s4").text('Can not be empty');
                }

                if ($("#<%= txtchitGroupStartDate.ClientID %>").val() == "") {
                    isValid = false;
                    $("#s5").text('Can not be empty');
                }
                if ($("#<%= txtchitGroupEndDate.ClientID %>").val() == "") {
                    isValid = false;
                    $("#s6").text('Can not be empty');
                } if ($("#<%= txtchitGroupAuctionDay.ClientID %>").val() == "") {
                    isValid = false;
                    $("#s7").text('Can not be empty');
                } if ($("#<%= txtpreviousSanctionNumber.ClientID %>").val() == "") {
                    isValid = false;
                    $("#s8").text('Can not be empty');
                } if ($("#<%= txtpreviousSanctionDate.ClientID %>").val() == "") {
                    isValid = false;
                    $("#s9").text('Can not be empty');
                }
                if ($("#<%= txtCCBNumber.ClientID %>").val() == "") {
                    isValid = false;
                    $("#s10").text('Can not be empty');
                }
                if ($("#<%= txtCCBDate.ClientID %>").val() == "") {
                    isValid = false;
                    $("#s11").text('Can not be empty');
                }
                if ($("#<%= txtsummary.ClientID %>").val() == "") {
                    isValid = false;
                    $("#s12").text('Can not be empty');
                }
                if ($("#<%= txtregistrationNumber.ClientID %>").val() == "") {
                    isValid = false;
                    $("#s13").text('Can not be empty');
                }
                if ($("#<%= txtnoOfCustomer.ClientID %>").val() != $("#<%= txtnoOfMonths.ClientID %>").val()) {
                    isValid = false;
                    $("#s3").text('Number of month and customers should be same');
                }
                if ($("#rbStatusA").prop('checked') == true && isValid == true) {
                    if ($("#txtnoOfCustomer").val() * 1 > $("#txtActiveMembers").val() * 1) {
                        alert("Not enough active members to start chit.");
                        isValid = false;
                    }
                    else if ($("#txtnoOfCustomer").val() * 1 < $("#txtActiveMembers").val() * 1) {
                        alert("Number of customers can not be less then active members.");
                        isValid = false;
                    }
                }
                if(!isValid)
                return isValid;

            });
        });

    </script>
    <style type="text/css">
       
        .isa_error {
            color: #D8000C;
            background-color: #FFBABA;
        }

        .hideit {
            display: none;
        }

        #editDiv {
            position: fixed;
            left: 0px;
            top: 0px;
            z-index: 4;
            opacity: 0.6;
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=40)"; /* first!*/
            filter: alpha(opacity=40); /* second!*/
            background-color: gray;
            display: none;
            width: 100%;
            height: 100%;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="chitId" AutoGenerateColumns="false"  OnRowCommand="GridView1_RowCommand" CssClass="mGrid">
        <Columns>
            <asp:BoundField DataField="chitId" HeaderText="ChitID" ReadOnly="true" ItemStyle-CssClass="hideit" HeaderStyle-CssClass="hideit" />
            <asp:BoundField DataField="chitName" HeaderText="ChitName" />
            <asp:BoundField DataField="noOfMonths" HeaderText="noOfMonths" ItemStyle-CssClass="hideit" HeaderStyle-CssClass="hideit" />
            <asp:BoundField DataField="noOfCustomer" HeaderText="noOfCustomer" ItemStyle-CssClass="hideit" HeaderStyle-CssClass="hideit" />
            <asp:BoundField DataField="chitValue" HeaderText="ChitValue" />
            <asp:BoundField DataField="chitGroupStartDate" HeaderText="chitGroupStartDate" />
            <asp:BoundField DataField="chitGroupEndDate" HeaderText="chitGroupEndDate" ItemStyle-CssClass="hideit" HeaderStyle-CssClass="hideit" />
            <asp:BoundField DataField="chitGroupAuctionDay" HeaderText="chitGroupAuctionDay" />
            <asp:BoundField DataField="previousSanctionNumber" HeaderText="previousSanctionNumber" ItemStyle-CssClass="hideit" HeaderStyle-CssClass="hideit" />
            <asp:BoundField DataField="previousSanctionDate" HeaderText="previousSanctionDate" ItemStyle-CssClass="hideit" HeaderStyle-CssClass="hideit" />
            <asp:BoundField DataField="CCBNumber" HeaderText="CCBNumber" ItemStyle-CssClass="hideit" HeaderStyle-CssClass="hideit" />
            <asp:BoundField DataField="CCBDate" HeaderText="CCBDate" ItemStyle-CssClass="hideit" HeaderStyle-CssClass="hideit" />
            <asp:BoundField DataField="summary" HeaderText="summary" ItemStyle-CssClass="hideit" HeaderStyle-CssClass="hideit" />
            <asp:BoundField DataField="registrationNumber" HeaderText="registrationNumber" />
            <asp:BoundField DataField="status" HeaderText="status" ItemStyle-CssClass="hideit" HeaderStyle-CssClass="hideit" />
            <asp:BoundField DataField="userId" HeaderText="userId" ReadOnly="true" ItemStyle-CssClass="hideit" HeaderStyle-CssClass="hideit" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbEdit" class='click' CommandName="ShowPopup" CommandArgument='<%#Eval("chitId") %>' Text="Edit" runat="server"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Panel ID="pnlpopup" runat="server" style="display:none">

        <table >
           
            <tr>
                <td>ChitId</td>
                <td>
                    <asp:TextBox ID="txtChitId" ReadOnly="true" ClientIDMode="Static" runat="server" Width="200" />

                </td>
            </tr>
            <tr>
                <td>ChitName</td>
                <td>
                    <asp:TextBox ID="txtChitName" ClientIDMode="Static" ReadOnly="true" runat="server" Width="200" Enabled="False" />
                    <span id="s1" class="isa_error"></span>
                </td>
            </tr>
            <tr>
                <td>noOfMonths</td>
                <td>
                    <asp:TextBox ID="txtnoOfMonths" ClientIDMode="Static" runat="server" Width="200" />
                    <span id="s2" class="isa_error"></span>
                </td>
            </tr>
            <tr>
                <td>number of Customer</td>
                <td style="margin-left: 160px">
                    <asp:TextBox ID="txtnoOfCustomer" ClientIDMode="Static" runat="server" Width="200" />
                    <span id="s3" class="isa_error"></span>
                </td>
            </tr>
            <tr>
                <td>Active Member</td>
                <td style="margin-left: 160px">
                    <asp:TextBox ID="txtActiveMembers" Enabled="false" ClientIDMode="Static" runat="server" Width="200" />
                    <span id="Span1"></span>
                </td>
            </tr>
            <tr>
                <td>chitValue</td>
                <td>
                    <asp:TextBox ID="txtchitValue" ClientIDMode="Static" runat="server" Width="200" />
                    <asp:Label ID="lblChitValue" ClientIDMode="Static" runat="server"></asp:Label>
                    <span id="s14" class="isa_error"></span>
                    <span id="s4" class="isa_error"></span>
                </td>
            </tr>
            <tr>
                <td>chitGroupStartDate</td>
                <td>
                    <asp:TextBox ID="txtchitGroupStartDate" ClientIDMode="Static" runat="server" Width="200">
                    </asp:TextBox>
                    <span id="s5" class="isa_error"></span>
                </td>

            </tr>
            <tr>
                <td>chitGroupEndDate</td>
                <td>
                    <asp:TextBox ID="txtchitGroupEndDate" ClientIDMode="Static" runat="server" Width="200">                        
                    </asp:TextBox>
                    <span id="s6" class="isa_error"></span>
                </td>
            </tr>
            <tr>
                <td>chitGroupAuctionDay</td>
                <td>
                    <asp:TextBox ID="txtchitGroupAuctionDay" ClientIDMode="Static" runat="server" Width="200"></asp:TextBox>
                    <span id="s7" class="isa_error"></span>
                </td>
            </tr>
            <tr>
                <td>previousSanctionNumber</td>
                <td>
                    <asp:TextBox ID="txtpreviousSanctionNumber" ClientIDMode="Static" runat="server" Width="200"></asp:TextBox>
                    <span id="s8" class="isa_error"></span>
                </td>
            </tr>
            <tr>
                <td>previousSanctionDate</td>
                <td>
                    <asp:TextBox ID="txtpreviousSanctionDate" ClientIDMode="Static" runat="server" Width="200"></asp:TextBox>
                    <span id="s9" class="isa_error"></span>
                </td>
            </tr>
            <tr>
                <td>CCBNumber</td>
                <td>
                    <asp:TextBox ID="txtCCBNumber" ClientIDMode="Static" runat="server" Width="200" />
                    <span id="s10" class="isa_error"></span>
                </td>
            </tr>
            <tr>
                <td>CCBDate</td>
                <td>
                    <asp:TextBox ID="txtCCBDate" ClientIDMode="Static" runat="server" Width="200" />
                    <span id="s11" class="isa_error"></span>
                </td>
            </tr>
            <tr>
                <td>summary</td>
                <td>
                    <asp:TextBox ID="txtsummary" ClientIDMode="Static" runat="server" Width="200" />
                    <span id="s12" class="isa_error"></span>
                </td>
            </tr>
            <tr>
                <td>registrationNumber</td>
                <td>
                    <asp:TextBox ID="txtregistrationNumber" ClientIDMode="Static" runat="server" Width="200" />
                    <span id="s13" class="isa_error"></span>
                </td>
            </tr>
            <tr>
                <td>status</td>
                <td>
                    <asp:RadioButton ID="rbStatusA" runat="server" ClientIDMode="Static" Text="Active" GroupName="status"></asp:RadioButton>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="rbStatusD" runat="server" ClientIDMode="Static" Text="Deactive" GroupName="status"></asp:RadioButton>
                </td>
            </tr>
            <tr>
                <td>userId</td>
                <td>
                    <asp:TextBox ID="txtuserId" ReadOnly="true" ClientIDMode="Static" runat="server" Width="200" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnUpdate" Text="Update" ClientIDMode="Static" runat="server" OnClick="btnUpdate_Click" /></td>
                <td>
                    <asp:Button ID="btnCancel" class='close' ClientIDMode="Static" Text="Cancel" runat="server" /></td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

