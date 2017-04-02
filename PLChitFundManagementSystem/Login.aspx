<%@ Page Title="" Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 
        <title>Login Form</title>
        <link href="css/style.css" rel="stylesheet" />
   
    <script src="JS/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtEmailId.ClientID%>").blur(function () {
                var EmailId = $("#<%=txtEmailId.ClientID%>").val();
                var EmailIDRegEx = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$";
                if (!EmailId.match(EmailIDRegEx)) {
                    document.getElementById("<%=lblEmailId.ClientID%>").innerHTML = "Email not valid";
                }
                else {
                    document.getElementById("<%=lblEmailId.ClientID%>").innerHTML = "";
                }

            });
            $("#<%=txtPassword.ClientID%>").blur(function () {
                var password = $("#<%=txtPassword.ClientID%>").val();
                if (password == "") {
                    document.getElementById("<%=lblPasswordValidate.ClientID%>").innerHTML = "Password required";
                }
                else {
                    document.getElementById("<%=lblPasswordValidate.ClientID%>").innerHTML = "";
                }
            });

            $("#<%=txtOldEmailId.ClientID%>").blur(function () {
                var EmailId = $("#<%=txtOldEmailId.ClientID%>").val();
                var EmailIDRegEx = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$";
                if (!EmailId.match(EmailIDRegEx)) {
                    document.getElementById("<%=lblOldEmailId.ClientID%>").innerHTML = "Email not valid"
                }
                else {
                    document.getElementById("<%=lblOldEmailId.ClientID%>").innerHTML = ""
                }

            });
            $("#<%=txtAnswer.ClientID%>").blur(function () {
                var password = $("#<%=txtAnswer.ClientID%>").val();
                if (password == "") {
                    document.getElementById("<%=lblAnswer.ClientID%>").innerHTML = "Answer is required";
                }
                else {
                    document.getElementById("<%=lblAnswer.ClientID%>").innerHTML = ""
                }
            })
        });
        function LoginValidate() {
            var EmailId = $("#<%=txtEmailId.ClientID%>").val();
            var EmailIDRegEx = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$";
            if (!EmailId.match(EmailIDRegEx)) {
                document.getElementById("<%=lblEmailId.ClientID%>").innerHTML = "Email not valid";
            }
            else {
                document.getElementById("<%=lblEmailId.ClientID%>").innerHTML = "";
            }
            var password = $("#<%=txtPassword.ClientID%>").val();
            if (password == "") {
                document.getElementById("<%=lblPasswordValidate.ClientID%>").innerHTML = "Password required";
            }
            else {
                document.getElementById("<%=lblPasswordValidate.ClientID%>").innerHTML = "";
            }
            if (!EmailId.match(EmailIDRegEx) || password == "") {
                return false;
            }
        }
        function ForgePasswordValidate() {
            var EmailId = $("#<%=txtOldEmailId.ClientID%>").val();
            var EmailIDRegEx = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$";
            if (!EmailId.match(EmailIDRegEx)) {
                document.getElementById("<%=lblOldEmailId.ClientID%>").innerHTML = "Email not valid"
            }
            else {
                document.getElementById("<%=lblOldEmailId.ClientID%>").innerHTML = ""
            }

            var Answer = $("#<%=txtAnswer.ClientID%>").val();
            if (Answer == "") {
                document.getElementById("<%=lblAnswer.ClientID%>").innerHTML = "Answer is required";
            }
            else {
                document.getElementById("<%=lblAnswer.ClientID%>").innerHTML = ""
            }
            if (!EmailId.match(EmailIDRegEx) || Answer == "") {
                return false;
            }
        }
    </script>

    <script src="scripts/jquery.blockUI.js" type="text/javascript"></script>
    <script type="text/javascript">
        function Hidepopup() {
            $find("popup").hide();
            return false;
        }
    </script>
    <style type="text/css">
        .tableBackground {
            background-color: rgb(65, 62, 62);
            opacity: 0.7;
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
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
    
    <body>

        <section class="container">
            <div class="login">
                <h1>Login Page</h1>
                <p>
                    <asp:TextBox ID="txtEmailId" runat="server" placeholder="Username or Email"></asp:TextBox>
                    <asp:Label ID="lblEmailId" runat="server" Style="color: red" Text=""></asp:Label>
                </p>
                <p>
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                    <asp:Label ID="lblPasswordValidate" runat="server" Style="color: red" Text=""></asp:Label>
                </p>

                <p class="remember_me">
                    <label>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                        Remember me on this computer
         
                    </label>
                </p>
                <p class="submit">
                    <asp:Button ID="Button1" OnClientClick="return LoginValidate()" runat="server" Text="Login" OnClick="Button1_Click" />
                </p>
                <p>
                    <asp:Label ID="lblError" runat="server" Text="" Style="float: left;color:red"></asp:Label>
                </p>
            </div>
            <div class="login-help">
                <p>
                    Forgot your password?
                    <asp:LinkButton ID="lbnForget" Text="Click here to reset it." runat="server" OnClick="lbnForget_Click1"></asp:LinkButton>
                </p>
            </div>
        </section>

    </body>
    </html>
    <asp:Panel ID="P1" runat="server">
        <section class="container">
            <div class="login">
                <h1>Forgot Password</h1>
                <p>
                    <asp:TextBox ID="txtOldEmailId" runat="server" placeholder="Enter your registered Email Id"></asp:TextBox>
                    <asp:Label ID="lblOldEmailId" runat="server" Style="color: red" Text=""></asp:Label>
                </p>
                <p>
                    <asp:DropDownList ID="ddlQuestions" runat="server" Width="305px" CssClass="ddl">
                        <asp:ListItem Value="0">Select your Security question</asp:ListItem>
                        <asp:ListItem Value="1">what is your native town?</asp:ListItem>
                        <asp:ListItem Value="2">who is your first teacher ?</asp:ListItem>
                        <asp:ListItem Value="3">Tell me your father&#39;s name ? </asp:ListItem>
                    </asp:DropDownList>
                </p>
                <p>
                    <asp:TextBox ID="txtAnswer" runat="server" placeholder="Enter your Security Question Answer"></asp:TextBox>
                    <asp:Label ID="lblAnswer" runat="server" Style="color: red" Text=""></asp:Label>
                </p>
                <p class="submit">
                    <asp:Button ID="btnGetPassword" OnClientClick="return ForgePasswordValidate()" runat="server" Text="Get Password" OnClick="btnGetPassword_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Close" />
                </p>
                <p class="submit">
                    <asp:Label ID="lblPassword" runat="server" ForeColor="#ff0000" Font-Bold="True" Font-Size="Larger"></asp:Label>
                </p>
            </div>
        </section>
    </asp:Panel>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <asp:Button ID="modelPopup" runat="server" Style="display: none" />
    <asp:ModalPopupExtender ID="mpe1" runat="server" TargetControlID="modelPopup" PopupControlID="P1" CancelControlID="btnCancel" BackgroundCssClass="tableBackground"></asp:ModalPopupExtender>

</asp:Content>

