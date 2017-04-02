<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Removesubscriber.aspx.cs" Inherits="Removesubscriber"  MasterPageFile="~/ChitFund.master"%>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <h2 align="center">Remove Subscriber from chit if it is not yet started</h2>
    
    
    <link href="../css/gridview.css" rel="stylesheet" />
    <script type="text/javascript" >
        $(document).ready(function () {
            $("#btnSubmit").click(function () {

                if ($("#ddlChitGrp").val() > 0) {
                    return true;
                }
                else {
                    alert("Please select any Chit");
                    return false;
                }

            });
        });
    </script>

    <script type="text/javascript">
        function Validate() {
            var selectchitname = document.getElementById("ddlChitGrp");

            if (selectchitname = "") {
                alert("Select Any Chit Name");
            }
            else
                return true;
        }

        function Confirmationbox() {
            var result = confirm('Are you sure you want to delete selected User(s)?');
            if (result) {
                return true;
            }
            else {
                return false;
            }
        }
 </script>
        <style type="text/css">
            .auto-style1 {
                height: 35px;
            }
        </style>
    <div align="center">
        <table align="center">., 
            <tr>
                <td width="250px" class="auto-style1" align="center">Chit Group </td>
                <td width="10px" class="auto-style1">:</td>
                <td width="250px" class="auto-style1">
                    <asp:DropDownList ID="ddlChitGrp" runat="server" Height ="20px"  Width="128px" AppendDataBoundItems="true"
                         OnSelectedIndexChanged="ddlChitGrp_SelectedIndexChanged" style="margin-bottom: 4px" AutoPostBack="True">
                        <asp:ListItem Value="" Selected="True">--Select any Chit--</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            
        </table>
        </div>
   <%--<asp:Label ID="lblstatus" runat="server"></asp:Label>--%>
                <br />
        <br />
    <div align="center">
        <table align="center">
            <tr>
                <td colspan="2">
                    <h3>List of Availanle Subscribers/Customers in Chit:</h3>
                </td>
            </tr>
            <tr>
                <td colspan="2"></td>
            </tr>
            <tr >
                <td colspan="2"  >
                    <asp:GridView ID="gvAvailableSubscribers" runat="server" AutoGenerateColumns="false" Height="100px" Width="500px" 
                        Style="text-align:center;" DataKeyNames="customerId" CssClass="mGrid"
 >
                        <Columns>
                            <asp:TemplateField HeaderText="Option">
                              <ItemTemplate>
                                   <asp:CheckBox ID="chkboxRemove" runat="server" Text="Remove"></asp:CheckBox>
                              </ItemTemplate>
                          </asp:TemplateField>
                             <asp:BoundField DataField="customerId" HeaderText="Subscriber ID" />
                            <asp:BoundField DataField="customerName" HeaderText="Subscriber Name" />
                            <asp:BoundField DataField="subscriberDocId" HeaderText="" Visible="false"  />
     
                             <asp:TemplateField HeaderText="Option">
                              <ItemTemplate>
                                 <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClientClick="Confirmationbox()" OnClick="btnDelete_Click" />
                              </ItemTemplate>
                          </asp:TemplateField>
                        </Columns>
                        
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
                           </td>
                
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>


                <td>&nbsp; </td>
            </tr>
        </table>
    </div>

</asp:Content>

