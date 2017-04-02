<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/style.css" rel="stylesheet" />
    <head><title>Change Password</title></head>
    <script src="JS/jquery-1.10.2.min.js">
    </script>
    <script>
        $(document).ready(function () {
            $(document).ready(function () {
                $("#<%=txtOldPassword.ClientID%>").blur(function () {
                    var Oldpassword = $("#<%=txtOldPassword.ClientID%>").val();
                    if (Oldpassword == "") {
                        document.getElementById("<%=lblOldPassword.ClientID%>").innerHTML = "Password required";
                    }
                    else {
                        document.getElementById("<%=lblOldPassword.ClientID%>").innerHTML = ""
                    }
                })
            })
            $("#<%=txtNewPassword.ClientID %>").blur(function () {
                var NewPassword = $('#<%=txtNewPassword.ClientID%>').val();
                if (NewPassword == "") {
                    document.getElementById("<%=lblNewPassword.ClientID %>").innerHTML = "Password is required";
                }
                else {
                    if (NewPassword.length < 6) {
                        document.getElementById("<%=lblNewPassword.ClientID %>").innerHTML = "Password should be 6 digits";
                    }
                    else {
                        document.getElementById("<%=lblNewPassword.ClientID %>").innerHTML = "";
                    }
                }
            });


            $("#<%=txtConfirmNewPassword.ClientID %>").blur(function () {
                var ConfirmPassWord = $('#<%=txtConfirmNewPassword.ClientID%>').val();
                if (ConfirmPassWord == "") {
                    document.getElementById("<%=lblConfirmNewPassword.ClientID %>").innerHTML = "Confirm Password is required";
                }
                else {
                    var Password = $('#<%=txtNewPassword.ClientID%>').val();
                    if (ConfirmPassWord != Password) {
                        document.getElementById("<%=lblConfirmNewPassword.ClientID %>").innerHTML = "Not matching with Password";
                    }
                    else {
                        document.getElementById("<%=lblConfirmNewPassword.ClientID %>").innerHTML = "";
                    }
                }
            });
        })
        function ChangePassWordValidate() {
            var Oldpassword = $("#<%=txtOldPassword.ClientID%>").val();
            if (Oldpassword == "") {
                document.getElementById("<%=lblOldPassword.ClientID%>").innerHTML = "Password required";
            }
            else {
                document.getElementById("<%=lblOldPassword.ClientID%>").innerHTML = ""
            }
            var NewPassword = $('#<%=txtNewPassword.ClientID%>').val();
            if (NewPassword == "") {
                document.getElementById("<%=lblNewPassword.ClientID %>").innerHTML = "Password is required";
            }
            else {
                if (NewPassword.length < 6) {
                    document.getElementById("<%=lblNewPassword.ClientID %>").innerHTML = "Password should be 6 digits";
                }
                else {
                    document.getElementById("<%=lblNewPassword.ClientID %>").innerHTML = "";
                }
            }
            var ConfirmPassWord = $('#<%=txtConfirmNewPassword.ClientID%>').val();
            if (ConfirmPassWord == "") {
                document.getElementById("<%=lblConfirmNewPassword.ClientID %>").innerHTML = "Confirm Password is required";
            }
            else {
                var NewcPassword = $('#<%=txtNewPassword.ClientID%>').val();
                if (ConfirmPassWord != NewcPassword) {
                    document.getElementById("<%=lblConfirmNewPassword.ClientID %>").innerHTML = "Not matching with Password";
                }
                else {
                    document.getElementById("<%=lblConfirmNewPassword.ClientID %>").innerHTML = "";
                }
            }
            if (Oldpassword == "" || NewPassword == "" || NewPassword.length < 6 || ConfirmPassWord =="" || ConfirmPassWord != NewcPassword) {
                return false;
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <body>
        <section class="container">
            <div class="login">
                <h1>Change&nbsp; Password</h1>
                <p>
                    <asp:TextBox ID="txtOldPassword" runat="server" placeholder="Enter your old Password" TextMode="Password"></asp:TextBox>
                    <asp:Label ID="lblOldPassword" runat="server" Style="color: red" Text=""></asp:Label>
                </p>
                <p>
                    <asp:TextBox ID="txtNewPassword" runat="server" placeholder="Enter your new password" TextMode="Password"></asp:TextBox>
                    <asp:Label ID="lblNewPassword" runat="server" Style="color: red" Text=""></asp:Label>
                </p>
                <p>
                    <asp:TextBox ID="txtConfirmNewPassword" runat="server" placeholder="Confirm your new Password" TextMode="Password"></asp:TextBox>
                    <asp:Label ID="lblConfirmNewPassword" runat="server" Style="color: red" Text=""></asp:Label>
                </p>
                <p class="submit">
                    <asp:Button ID="Button1" OnClientClick="return ChangePassWordValidate()" runat="server" Text="Change Password" OnClick="Button1_Click" />
                </p>
                <p>
                    <asp:Label ID="lblMessage" runat="server" ForeColor="#ff0000"></asp:Label>
                </p>
            </div>
        </section>
    </body>
    </html>
</asp:Content>

