<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.master" AutoEventWireup="true" CodeFile="CreateChit.aspx.cs" Inherits="Admin_CreateChit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/Styles/style.css" rel="stylesheet" />
    <link href="../css/Styles/style-responsive.css" rel="stylesheet" />
    <style type="text/css">
        fieldset {
            width: 800px;
            margin: auto;
        }
    </style>

    <link href="StyleSheet.css" rel="stylesheet" />
    <link href="../css/Master.css" rel="stylesheet" />
     <style type="text/css">
        .container {
            margin: 00px 10px;
            width: 800px;
        }

        .login {
            position: relative;
            margin: 0 -35px;
            padding: 20px 20px 20px;
            width: 950px;
            height: 550px;
            background: white;
            border-radius: 3px;
            -webkit-box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
            box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
        }
    </style>
    <style type="text/css">
        .ddl {
            margin: 5px;
            padding: 0 10px;
            width: 200px;
            height: 24px;
            color: #404040;
            background: white;
            border: 1px solid;
            border-color: #c4c4c4 #d1d1d1 #d4d4d4;
            border-radius: 2px;
            outline: 5px solid #eff4f7;
            -moz-outline-radius: 3px;
            -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
        }
        .auto-style6
        {}
        .auto-style7
        {
            height: 31px;
        }
        .auto-style8
        {
            height: 4px;
            width: 18px;
        }
        .auto-style9
        {
            height: 31px;
            width: 130px;
        }
        .auto-style10
        {
            height: 4px;
            width: 130px;
        }
        .auto-style11
        {
            width: 155px;
        }
        .auto-style12
        {
            height: 4px;
            width: 155px;
        }
        .auto-style13
        {
            width: 18px;
        }
    </style>
    <script type = "text/javascript">
        var counter = 0;
        function AddFileUpload() {
            var div = document.createElement('DIV');
            div.innerHTML = '<input id="file' + counter + '" name = "file' + counter + '" type="file" onchange="checkfile(this);" /><input id="Button' + counter + '" type="button" value="Remove" onclick = "RemoveFileUpload(this)" />';
            document.getElementById("FileUploadContainer").appendChild(div);
            counter++;
        }
        function RemoveFileUpload(div) {
            document.getElementById("FileUploadContainer").removeChild(div.parentNode);
        }
    </script>
  
    <script src="../JS/jquery-1.10.2.js"></script>
    <script src="../JS/jquery-ui-1.10.4.js"></script>
    <%--<script src="JQuery/js/jquery-1.6.min.js"></script>--%>
   <%-- <script src="JQuery/js/jquery-ui-1.10.4.min.js"></script>
   --%> <%-- Validation --%>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=btnChitCreationSubmit.ClientID%>").click(function () 
            {

                var ChitGroupName = $("#<%= txtChitGroupName.ClientID %>").val();
                if (ChitGroupName == "") 
                {
                    $("#s1").text('Group name should not be empty');
                    return false;
                }


                var ChitValue = $("#<%=txtChitValue.ClientID %>").val();
                if (ChitValue == "")
                {
                    $("#s2").text('chit value should not be empty');
                    return false;
                }
                var ChitValue = $("#<%=txtChitValue.ClientID %>").val();
                if (jQuery.isNumeric(ChitValue) == false)
                {                
                    $("#s2").text('chit value should be numerics only');
                    return false;
                }

                var TotalChitMembers = $("#<%=txtTotalChitMembers.ClientID %>").val();
                if (TotalChitMembers == "") 
                {
                    $("#s3").text('chit members should not be empty');
                    return false;
                }
                var TotalChitMembers = $("#<%=txtTotalChitMembers.ClientID %>").val();
                if (jQuery.isNumeric(TotalChitMembers) == false) 
                {
                    $("#s3").text('Total numbers should be numerics only');
                    return false;
                }

                var NoOfMonths = $("#<%=txtNoOfMonths.ClientID %>").val();
                if (NoOfMonths == "") 
                {
                    $("#s4").text('Number of months should not be empty');
                    return false;
                }
                var NoOfMonths = $("#<%=txtNoOfMonths.ClientID %>").val();
                if (jQuery.isNumeric(NoOfMonths) == false) 
                {
                    $("#s4").text('Number of months should be numerics only');
                    return false;
                }

                var StartDate = $("#<%=txtStartDate.ClientID %>").val();
                if (StartDate == "") 
                {
                    $("#s5").text('start date should not be empty');
                    return false;
                }


                var ChitEndDate = $("#<%=txtChitEndDate.ClientID %>").val();
                if (ChitEndDate == "") 
                {
                    $("#s6").text('end date should not be empty');
                    return false;
                }

                var ChitRegistrationNo = $("#<%=txtChitRegistrationNo.ClientID %>").val();
                if (ChitRegistrationNo == "")
                {
                    $("#s7").text('registration number should not be empty');
                    return false;
                }
                var ChitRegistrationNo = $("#<%=txtChitRegistrationNo.ClientID %>").val();
                if (jQuery.isNumeric(ChitRegistrationNo) == false) 
                {
                    $("#s7").text('registration number should be numerics only');
                    return false;
                }

                var CCBDate = $("#<%=txtCCBDate.ClientID %>").val();
                if (CCBDate == "") 
                {
                    $("#s8").text('CCBDate should not be empty');
                    return false;
                }


                var PSDate = $("#<%=txtPSDate.ClientID %>").val();
                if (PSDate == "")
                {
                    $("#s9").text('Sanction date should not be empty');
                    return false;
                }


                var PSNo = $("#<%=txtPSNo.ClientID %>").val();
                if (PSNo == "") 
                {
                    $("#s10").text('PSNo should not be empty');
                    return false;
                }
                var PSNo = $("#<%=txtPSNo.ClientID %>").val();
                if (jQuery.isNumeric(PSNo) == false) 
                {
                    $("#l0").text('PS number should be numerics only');
                    return false;
                }



                var AuctionDay = $("#<%=txtAuctionDay.ClientID %>").val();
                if (AuctionDay == "") 
                {
                    $("#s11").text('AuctionDay should not be empty');
                    return false;
                }

                var Summary = $("#<%=txtSummary.ClientID %>").val();
                if (Summary == "")
                {
                    $("#s12").text('Summary should not be empty');
                    return false;
                }

                var CCBNo = $("#<%=txtCCBNo.ClientID %>").val();
                if (CCBNo == "") 
                {
                    $("#s13").text('CCB number should not be empty');
                    return false;
                }
                var CCBNo = $("#<%=txtCCBNo.ClientID %>").val();
                if (jQuery.isNumeric(CCBNo) == false) 
                {
                    $("#s13").text('CBB number should be numerics only');
                    return false;
                }

             

              

            });
        });
        function checkfile(sender) {
            alert(sender);
            var validExts = new Array(".jpg",".png");
            var fileExt = sender.value;
            fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
            if (validExts.indexOf(fileExt) < 0) {
                alert("Invalid file selected, valid files are of " +
                         validExts.toString() + " types.");
                var fileid = (sender && sender.target) || (window.event && window.event.srcElement);
               
                document.getElementById(fileid.id).value = '';

            }
            else return true;
        }
        </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
           
                    
       <div align="center" style=" width:100%;-webkit-border-radius: 89px 77px 91px 60px;-moz-border-radius: 89px 77px 91px 60px;border-radius: 89px 77px 91px 60px;border:2px solid #210902;background-color:#DDD;">
           <fieldset> 
           <div align="center" style = "float:left; width: 50%;">
         
               <table align="center" id="pattern-style-b" style=" width:100%; background-color: #DDD">
                   
                <%--  <tr>
                    <td class="auto-style4">ChitId</td>
                    <td class="auto-style2">:</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtChitId" runat="server" CssClass="auto-style3" ></asp:TextBox></td>
                </tr>--%>
                <tr>
                    <td class="auto-style11">Chit Group Name</td>
                    <td class="auto-style13">:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtChitGroupName" runat="server" CssClass="auto-style6" OnTextChanged="txtChitGroupName_TextChanged"></asp:TextBox>
                        <span id="s1"></span>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">Chit Value</td>
                    <td class="auto-style8">:</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="txtChitValue" runat="server" CssClass="auto-style6"></asp:TextBox>
                        <span id="s2"></span></td>
                </tr>
                <tr>
                    <td class="auto-style11">Total Members</td>
                    <td class="auto-style13">:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtTotalChitMembers" runat="server" CssClass="auto-style6"></asp:TextBox>
                        <span id="s3"></span>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">No.Of Months</td>
                    <td class="auto-style13">:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtNoOfMonths" runat="server" CssClass="auto-style6"></asp:TextBox>
                        <span id="s4"></span>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style11">Start Date</td>
                    <td class="auto-style13">:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="auto-style6"></asp:TextBox>
                        <asp:CalendarExtender ID="ajaxCalander" TargetControlID="txtStartDate" runat="server" Format="yyyy/MM/dd"></asp:CalendarExtender>
                        <span id="s5"></span>

                    </td>
                </tr>
               
                
                
                <tr>
                    <td class="auto-style11">Chit Group End Date</td>
                    <td class="auto-style13">:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtChitEndDate" runat="server" CssClass="auto-style6" />
                        <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtChitEndDate" runat="server" Format="yyyy/MM/dd"></asp:CalendarExtender>
                        <span id="s6"></span>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Chit Registration No.</td>
                    <td class="auto-style13">:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtChitRegistrationNo" runat="server" CssClass="auto-style6"></asp:TextBox>
                        <span id="s7"></span>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">CCB Date</td>
                    <td class="auto-style13">:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtCCBDate" CssClass="auto-style6" runat="server" />
                        <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="txtCCBDate" runat="server" Format="yyyy/MM/dd"></asp:CalendarExtender>
                        <span id="s8"></span>
                    </td>
                </tr>
                       <tr>
                <td align="center" colspan="3">
                    <em><strong>
                        <asp:Button ID="btnChitCreationSubmit" runat="server" Text="Sumbit" CssClass="auto-style6" Height="37px" OnClick="btnChitCreationSubmit_Click" Style="font-weight: bold" />
                        &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnClearn" runat="server" Text="Clear" CssClass="auto-style6" Height="37px" Width="68px" Style="font-weight: bold" OnClick="btnClearn_Click" />
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </strong></em></td>
            </tr>
                    </table>
            </div>
              <div style = "float:left; width: 50%;";>
                    <table style="width:100%";background: #DDD>
                       <tr>
                    <td class="auto-style4">Previous Sanction Date</td>
                    <td class="auto-style2">:</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtPSDate" runat="server" CssClass="auto-style6"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender3" TargetControlID="txtPSDate" runat="server" Format="yyyy/MM/dd"></asp:CalendarExtender>
                        <span id="s9"></span>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">PS Number</td>
                    <td class="auto-style2">:</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtPSNo" runat="server" CssClass="auto-style6"></asp:TextBox>
                        <span id="s10"></span>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Auction Day</td>
                    <td class="auto-style2">:</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtAuctionDay" runat="server" CssClass="auto-style6"></asp:TextBox>
                        <span id="s11"></span>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Summary</td>
                    <td>:</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtSummary" runat="server" CssClass="auto-style6"></asp:TextBox>
                        <span id="s12"></span>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">CCB No.</td>
                    <td class="auto-style2">:</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtCCBNo" runat="server" CssClass="auto-style6"></asp:TextBox>
                        <span id="s13"></span>
                    </td>
                </tr>

               
                
                    <tr>
                        <td class="auto-style4">Document Type</td>
                        <td>:</td>
                        <td aling="center">
                            <asp:DropDownList ID="ddlGetDocumentProof" runat="server" OnSelectedIndexChanged="ddlGetDocumentProof_SelectedIndexChanged">
                                <asp:ListItem>--Select Document--</asp:ListItem>
                            </asp:DropDownList>

                        </td>
                    </tr>
                    <tr>

                        <td align="center" class="newStyle1">Upload File</td>
                        <td>:</td>
                        <td> <span style ="font-family:Arial">Click to add files</span>&nbsp;&nbsp;
        <input id="Button1" type="button" value="add" onclick = "AddFileUpload()" />
        <br /><br />
        <div id = "FileUploadContainer">
            <!--FileUpload Controls will be added here -->
        </div>
        <br />
  
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="newStyle1">Description</td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="207px"></asp:TextBox>
                            <br />
                        </td>
                    </tr>
                   


                </table>
                </div>
               </fieldset> 
           </div>
</asp:Content>

