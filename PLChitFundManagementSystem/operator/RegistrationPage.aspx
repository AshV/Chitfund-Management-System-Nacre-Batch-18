<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.Master" AutoEventWireup="true" CodeFile="RegistrationPage.aspx.cs" Inherits="RegistrationPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/Styles/style.css" rel="stylesheet" />

    <script src="../JS/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtFirstName.ClientID %>").blur(function () {
                var FirsName = $('#<%=txtFirstName.ClientID%>').val();
                if (FirsName == "") {
                    document.getElementById("<%=lblFirstName.ClientID %>").innerHTML = "First Name is required";
                }
                else {
                    document.getElementById("<%=lblFirstName.ClientID %>").innerHTML = "";
                }
            });
            $("#<%=txtLastName.ClientID %>").blur(function () {
                var LastName = $('#<%=txtLastName.ClientID%>').val();
                if (LastName == "") {
                    document.getElementById("<%=lblLastName.ClientID %>").innerHTML = "Last Name is required";
                }
                else {
                    document.getElementById("<%=lblLastName.ClientID %>").innerHTML = "";
                }
            });
            $("#<%=txtMobileNo.ClientID%>").blur(function () {
                var MobileNo = $("#<%=txtMobileNo.ClientID%>").val();
                var MobileNoRegEx = /^[7-9][0-9]{9}$/;
                var CompareMobileNo = MobileNo.match(MobileNoRegEx);
                if (CompareMobileNo == null) {
                    document.getElementById("<%=lblMobileNo.ClientID%>").innerHTML = "Enter valid mobile number";
                }
                else {
                    document.getElementById("<%=lblMobileNo.ClientID%>").innerHTML = "";
                }
            });
            $("#<%=txtLoginId.ClientID%>").blur(function () {
                var Email = $("#<%=txtLoginId.ClientID%>").val();
                var EmailRegEx = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$";
                //var EmailRegEx = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;
                var CompareEmail = Email.match(EmailRegEx);
                if (!Email.match(EmailRegEx)) {
                    document.getElementById("<%=lblLoginId.ClientID%>").innerHTML = "Enter valid Email";

                    //document.getElementById('<%=txtLoginId.ClientID %>').focus();
                }
                else {
                    document.getElementById("<%=lblLoginId.ClientID%>").innerHTML = "";
                }
            });
            $("#<%=txtPassword.ClientID %>").blur(function () {
                var Password = $('#<%=txtPassword.ClientID%>').val();
                if (Password == "") {
                    document.getElementById("<%=lblPassword.ClientID %>").innerHTML = "Password is required";
                }
                else {
                    if (Password.length < 6) {
                        document.getElementById("<%=lblPassword.ClientID %>").innerHTML = "Password should be 6 digits";
                    }
                    else {
                        document.getElementById("<%=lblPassword.ClientID %>").innerHTML = "";
                    }
                }
            });


            $("#<%=txtConfirmNewPassword.ClientID %>").blur(function () {
                var ConfirmPassWord = $('#<%=txtConfirmNewPassword.ClientID%>').val();
                if (ConfirmPassWord == "") {
                    document.getElementById("<%=lblConfirmNewPassword.ClientID %>").innerHTML = "Confirm Password is required";
                }
                else {
                    var cPassword = $('#<%=txtPassword.ClientID%>').val();
                    if (ConfirmPassWord != cPassword) {
                        document.getElementById("<%=lblConfirmNewPassword.ClientID %>").innerHTML = "Not matching with Password";
                    }
                    else {
                        document.getElementById("<%=lblConfirmNewPassword.ClientID %>").innerHTML = "";
                    }
                }
            });
            $("#<%=txtDOB.ClientID %>").blur(function () {
                var DOB = $('#<%=txtDOB.ClientID%>').val();
                if (DOB == "") {
                    document.getElementById("<%=lblDOB.ClientID %>").innerHTML = "Date of birth is required";
                }
                else {
                    document.getElementById("<%=lblDOB.ClientID %>").innerHTML = "";
                }
            });
            $("#<%=txtAddress.ClientID %>").blur(function () {
                var AddressID = $('#<%=txtAddress.ClientID%>').val();
                if (AddressID == "") {
                    document.getElementById("<%=lblAddress.ClientID %>").innerHTML = "Address is required";
                }
                else {
                    document.getElementById("<%=lblAddress.ClientID %>").innerHTML = "";
                }
            });
            $("#<%=txtSecurityAnswer.ClientID %>").blur(function () {
                var SecurityAnswer = $('#<%=txtSecurityAnswer.ClientID%>').val();
                if (SecurityAnswer == "") {
                    document.getElementById("<%=lblSecurityAnswer.ClientID %>").innerHTML = "Answer is required";
                }
                else {
                    document.getElementById("<%=lblSecurityAnswer.ClientID %>").innerHTML = "";
                }
            });
            $("#<%=btnSubmit.ClientID%>").click(function () {
                var FirsName = $('#<%=txtFirstName.ClientID%>').val();
                if (FirsName == "") {
                    document.getElementById("<%=lblFirstName.ClientID %>").innerHTML = "First Name is required";
                }
                else {
                    document.getElementById("<%=lblFirstName.ClientID %>").innerHTML = "";
                }
                var LastName = $('#<%=txtLastName.ClientID%>').val();
                if (LastName == "") {
                    document.getElementById("<%=lblLastName.ClientID %>").innerHTML = "Last Name is required";
                }
                else {
                    document.getElementById("<%=lblLastName.ClientID %>").innerHTML = "";
                }
                var MobileNo = $("#<%=txtMobileNo.ClientID%>").val();
                var MobileNoRegEx = /^[7-9][0-9]{9}$/;
                var CompareMobileNo = MobileNo.match(MobileNoRegEx);
                if (CompareMobileNo == null) {
                    document.getElementById("<%=lblMobileNo.ClientID%>").innerHTML = "Enter valid mobile number";
                }
                else {
                    document.getElementById("<%=lblMobileNo.ClientID%>").innerHTML = "";
                }
                var Email = $("#<%=txtLoginId.ClientID%>").val();
                var EmailRegEx = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$";
                //var EmailRegEx = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;
                var CompareEmail = Email.match(EmailRegEx);
                if (!Email.match(EmailRegEx)) {
                    document.getElementById("<%=lblLoginId.ClientID%>").innerHTML = "Enter valid Email";

                    //document.getElementById('<%=txtLoginId.ClientID %>').focus();
                }
                else {
                    document.getElementById("<%=lblLoginId.ClientID%>").innerHTML = "";
                }
                var Password = $('#<%=txtPassword.ClientID%>').val();
                if (Password == "") {
                    document.getElementById("<%=lblPassword.ClientID %>").innerHTML = "Password is required";
                }
                else {
                    if (Password.length < 6) {
                        document.getElementById("<%=lblPassword.ClientID %>").innerHTML = "Password should be 6 digits";
                    }
                    else {
                        document.getElementById("<%=lblPassword.ClientID %>").innerHTML = "";
                    }
                }
                var ConfirmPassWord = $('#<%=txtConfirmNewPassword.ClientID%>').val();
                if (ConfirmPassWord == "") {
                    document.getElementById("<%=lblConfirmNewPassword.ClientID %>").innerHTML = "Confirm Password is required";
                }
                else {
                    var cPassword = $('#<%=txtPassword.ClientID%>').val();
                    if (ConfirmPassWord != cPassword) {
                        document.getElementById("<%=lblConfirmNewPassword.ClientID %>").innerHTML = "Not matching with Password";
                    }
                    else {
                        document.getElementById("<%=lblConfirmNewPassword.ClientID %>").innerHTML = "";
                    }
                }
                var DOB = $('#<%=txtDOB.ClientID%>').val();
                if (DOB == "") {
                    document.getElementById("<%=lblDOB.ClientID %>").innerHTML = "Date of birth is required";
                }
                else {
                    document.getElementById("<%=lblDOB.ClientID %>").innerHTML = "";
                }
                var AddressID = $('#<%=txtAddress.ClientID%>').val();
                if (AddressID == "") {
                    document.getElementById("<%=lblAddress.ClientID %>").innerHTML = "Address is required";
                }
                else {
                    document.getElementById("<%=lblAddress.ClientID %>").innerHTML = "";
                }
                var SecurityAnswer = $('#<%=txtSecurityAnswer.ClientID%>').val();
                if (SecurityAnswer == "") {
                    document.getElementById("<%=lblSecurityAnswer.ClientID %>").innerHTML = "Answer is required";
                }
                else {
                    document.getElementById("<%=lblSecurityAnswer.ClientID %>").innerHTML = "";
                }
                if (FirsName == "" || LastName == "" || !MobileNo.match(MobileNoRegEx) || !Email.match(EmailRegEx) || Password == "" || ConfirmPassWord == "" || ConfirmPassWord != cPassword || DOB == "" || AddressID == "" || SecurityAnswer == "") {
                    return false;
                }
            })
        });

    </script>
    <style type="text/css">
        .container {
            margin: 00px 10px;
            width: 800px;
           
        }
        .header
        {
background-color:green;
        }

        .login {
            position: relative;
            margin: 0 -35px;
            padding: 20px 20px 20px;
            width: 950px;
            height: 800px;
            background:#DDD;
            border-radius: 3px;
            -webkit-box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
            box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
        }
    </style>
    <style type="text/css">
        .ddl {
            border-left: 1px solid #d1d1d1;
            border-right: 1px solid #d1d1d1;
            border-top: 1px solid #c4c4c4;
            border-bottom: 1px solid #d4d4d4;
            padding: 0 10px;
            width: 200px;
            height: 24px;
            color: #404040;
            background: white;
            border-radius: 2px;
            outline: 5px solid #eff4f7;
            -moz-outline-radius: 3px;
            -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
            margin-left: 5px;
            margin-right: 5px;
            margin-bottom: 5px;
        }
    </style>


    <script src="../JS/jquery-1.8.2.js"></script>
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
    <html xmlns="http://www.w3.org/1999/xhtml">
    <body>
       
        <section class="container">
            <div class="login">
              <h1>Registration Page</h1>
                <div style="float: left;width:465px">
                    <p>
                        <asp:DropDownList ID="ddlUserTypeId" runat="server" Width="305px" CssClass="ddl" ClientIDMode="Static">
                            <%--<asp:ListItem Value="101">Admin</asp:ListItem>
                            <asp:ListItem Value="102">Agent</asp:ListItem>
                           <asp:ListItem Value="103">Operator</asp:ListItem> --%>
                        </asp:DropDownList>
                    </p>

                    <p>
                        <asp:TextBox ID="txtFirstName" runat="server" placeholder="Enter your first name"></asp:TextBox>
                        <asp:Label ID="lblFirstName" runat="server" Style="color: red" Text=""></asp:Label>
                    </p>

                    <p>

                        <asp:TextBox ID="txtMiddleName" runat="server" placeholder="Enter your middle name" ></asp:TextBox>
                        <asp:Label ID="lblMiddleName" runat="server" Style="color: red" Text=""></asp:Label>
                    </p>
                    <p>
                        <asp:TextBox ID="txtLastName" runat="server" placeholder="Enter your Last Name" ></asp:TextBox>
                        <asp:Label ID="lblLastName" runat="server" Style="color: red" Text=""></asp:Label>
                    </p>
                    <p>
                        <asp:TextBox ID="txtMobileNo" runat="server" placeholder="Enter your Mobile Number"></asp:TextBox>
                        <asp:Label ID="lblMobileNo" runat="server" Style="color: red" Text=""></asp:Label>
                    </p>
                    <p>
                        <asp:TextBox ID="txtLoginId" runat="server" placeholder="Enter your LoginId"></asp:TextBox>
                        <asp:Label ID="lblLoginId" runat="server" Style="color: red" Text=""></asp:Label>
                    </p>

                    <p>
                        <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter your password" TextMode="Password"></asp:TextBox>
                        <asp:Label ID="lblPassword" runat="server" Style="color: red" Text=""></asp:Label>
                    </p>
                     <p>
                        <asp:TextBox ID="txtConfirmNewPassword" runat="server" placeholder="Confirm your password" TextMode="Password" OnTextChanged="txtConfirmNewPassword_TextChanged"></asp:TextBox>
                        <asp:Label ID="lblConfirmNewPassword" runat="server" Style="color: red" Text=""></asp:Label>

                    </p>
                    <p>
                        <asp:DropDownList ID="ddlGender" runat="server" Width="305px" CssClass="ddl">
                            <asp:ListItem Value="0">Male</asp:ListItem>
                            <asp:ListItem Value="1">Female</asp:ListItem>
                        </asp:DropDownList>
                    </p>
                    <p>
                        <asp:TextBox ID="txtDOB" runat="server" placeholder="Enter your Date Of Birth"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDOB" Format="yyyy-MM-dd" runat="server"></asp:CalendarExtender>
                        <asp:Label ID="lblDOB" runat="server" Style="color: red" Text=""></asp:Label>
                    </p>
                   
                </div>
                <div class="" style="float: left">
                    <p>
                     <asp:DropDownList ID="ddlState" runat="server" Width="305px" CssClass="ddl" AutoPostBack="True"  OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>
                     </p>
                     <p>
                     <asp:DropDownList ID="ddlCity" runat="server" Width="305px" CssClass="ddl"></asp:DropDownList>
                     </p>
                    <p>
                        <asp:TextBox ID="txtAddress" runat="server" placeholder="Enter your Address"></asp:TextBox>
                        <asp:Label ID="lblAddress" runat="server" Style="color: red" Text=""></asp:Label>
                   
                         <p>
                        <asp:TextBox ID="txtArea" runat="server" placeholder="Enter your Area"></asp:TextBox>
                        <asp:Label ID="lblArea" runat="server" Style="color: red" Text=""></asp:Label>
                    </p>
                         </p>
                                        <p>
                        <asp:TextBox ID="txtStreet" runat="server" placeholder="Enter your Street"></asp:TextBox>
                        <asp:Label ID="lblStreet" runat="server" Style="color: red" Text=""></asp:Label>
                    </p>
                                        <p>
                        <asp:TextBox ID="txtZip" runat="server" placeholder="Enter Zip"></asp:TextBox>
                        <asp:Label ID="lblZip" runat="server" Style="color: red" Text=""></asp:Label>
                    </p>

                    <p>
                        <asp:DropDownList ID="ddlSecurityQuestion" runat="server" Width="305px" CssClass="ddl">
                            <asp:ListItem Value="0">what is your native town?</asp:ListItem>
                            <asp:ListItem Value="1">who is your first teacher ?</asp:ListItem>
                            <asp:ListItem Value="2">Tell me your father&#39;s name ? </asp:ListItem>
                        </asp:DropDownList>
                    </p>
                    <p>
                        <asp:TextBox ID="txtSecurityAnswer" runat="server" placeholder="Give Your Answer"></asp:TextBox>
                        <asp:Label ID="lblSecurityAnswer" runat="server" Style="color: red" Text=""></asp:Label>
                    </p>

                    <h3 style="color: black">Upload Your Image</h3>
                    <p>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </p>
                    <p style="float: left">
                        <asp:Button ID="btnSubmit" runat="server" OnClientClick="return validate()" Text="Submit" OnClick="btnSubmit_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                    </p>
                    <p class="submit">&nbsp;</p>
                </div>
            </div>
        </section>
           
        
    </body>
    </html>

</asp:Content>

