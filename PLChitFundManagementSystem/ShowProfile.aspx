<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.master" AutoEventWireup="true" CodeFile="ShowProfile.aspx.cs" Inherits="ShowProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Login Form</title>
    <link href="css/style.css" rel="stylesheet" />

    <script src="JS/jquery-1.10.2.min.js"></script>
    <script src="JS/jquery-1.8.2.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#<%=FileUpload1.ClientID %>').change(function () {
                var ValidFileExtension = ['jpg', 'JPG', 'jpeg', 'JPEG', 'png', 'PNG', 'gif', 'GIF', 'bmp', 'BMP'];
                if ($.inArray($(this).val().split('.').pop().toLowerCase(), ValidFileExtension) == -1) {
                    alert("Sorry !!! Allowed image formats are '.jpeg','.jpg', '.png', '.gif', '.bmp'");
                }
            })
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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

     table tr td {
background: white;
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
    <html xmlns="http://www.w3.org/1999/xhtml">

    <body>
        <%--  <link href="css/tables.css" rel="stylesheet" />--%>
        <section class="container">
            <%--<div class="login">
                <h1>Show Profile Page</h1>
                <p>
                    <asp:TextBox ID="txtUserId" runat="server" placeholder="Enter UserId"></asp:TextBox>
                </p>
                <p>

                    <asp:Button ID="btnshow" runat="server" Text="Show Profile" Width="73px" CssClass="txtbox" Height="26px" TabIndex="5" OnClick="btnshow_Click" />
                    <asp:Button ID="btnclear" runat="server" Text="Clear" Width="83px" CssClass="txtbox" Height="26px" TabIndex="6" />
                    <asp:Button ID="btncancel" runat="server" Text="Cancel" Width="87px" CssClass="txtbox" Height="26px" TabIndex="6" />

                </p>
            </div>--%>
            <div class="login">
                <h1>User Profile</h1>

                <div style="float: left;">
                    <table style="color:white">
                        <tr>
                            <td style="background-color:white" >

                                <asp:Image ID="Image1" runat="server" Height="71px" Width="129px" />
                                <asp:Label ID="ImgMsg" Style="color: black:" runat="server" Text=""></asp:Label>
                                <h3 style="color: black">Upload Your Image</h3>

                            </td>
                            <td CssClass="td">
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblFName" Style="color: black;" runat="server" Text="FirstName:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblMName" Style="color: black" runat="server" Text="MiddleName:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblLname" Style="color: black" runat="server" Text="LastName:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPhone" Style="color: black" runat="server" Text="Your Phone No:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMobileNo" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="float: right">
                    <table bgcolor="black">
                        <tr>
                            <td>
                                <asp:Label ID="lblAddress" Style="color: black" runat="server" Text="Your Address:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:TextBox ID="txtArea" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblCity" Style="color: black" runat="server" Text="Your City:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblState" Style="color: black" runat="server" Text="Your State:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <%--                 <asp:Label ID="lblQuestion" style="color:black" Text="Sequrity Question" runat="server"></asp:Label>
                        <asp:DropDownList ID="ddlSecurityQuestion" runat="server" Width="305px" CssClass="ddl">
                            <asp:ListItem Value="0">what is your native town?</asp:ListItem>
                            <asp:ListItem Value="1">who is your first teacher ?</asp:ListItem>
                            <asp:ListItem Value="2">Tell me your father&#39;s name ? </asp:ListItem>
                        </asp:DropDownList>
                <asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox>--%>

                        <tr>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnchange" runat="server" Text="Change" OnClick="btnchange_Click" />
                            </td>
                            <td>
                                <asp:Label ID="Label1" Style="color: red" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
        </section>
    </body>

    </html>
</asp:Content>



