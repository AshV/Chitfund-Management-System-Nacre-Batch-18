<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="css/style.css" rel="stylesheet" />
    <link href="/css/bootstrap.min.css" rel="stylesheet" />
    <script src="JS/jquery-1.10.2.min.js"></script>
    <script src="JS/jquery-1.10.4-ui.js"></script>
    <style>
        .container h3
        {
            margin:0px;
        }
    </style>
     <script>
         $(document).ready(function () {
             $("#menu").hide();
         });
       
         $(function () {
             $("#accordian").accordion({
                 heightStyle: "content",
                 event: "mouseover",
                 collapseble: true
             });
         });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center" style="height:700px" id="menusub">
        <div class="container">
            <div class="row" align="center">
                <div id="accordian">
                    <h3><a class="btn btn-large btn-success" style="width: 500px" href="#">Profile </a></h3>
                    <div>
                         <a class="btn btn-success" style="width: 400px" href="/ShowProfile.aspx">View Profile</a> 
                         <br/>  
                         <a class="btn btn-success" style="width: 400px" href="/ChangePassword.aspx">Update Customer</a> 
                         <br/> 
                    </div>
                    <h3><a class="btn btn-large btn-success" style="width: 500px" href="#">Manage Subscriber</a></h3>
                    <div>
                         <a class="btn btn-success" style="width: 400px" href="/operator/CustEnquiry.aspx">Enquiry Customer</a> 
                         <br/> 
                         <a class="btn btn-success" style="width: 400px" href="/operator/SubRegistration.aspx">Customer Registration</a> 
                         <br/> 
                         <a class="btn btn-success" style="width: 400px" href="/operator/ManageCust.aspx">Update Customer</a> 
                         <br/> 
                         <a class="btn btn-success" style="width: 400px" href="/operator/ViewSubscriber.aspx">ViewSubscriber</a> 
                         <br/> 
                    </div>
                    <h3><a class="btn btn-large btn-success" style="width: 500px" href="/operator/RegistrationPage.aspx">Registration</a></h3>
                    <div></div>
                    <h3><a class="btn btn-large btn-success" style="width: 500px" href="#">Manage Chit</a></h3>
                    <div>
                         <a class="btn btn-success" style="width: 400px" href="/Admin/CreateChit.aspx">Create Chit</a> 
                         <br/> 
                         <a class="btn btn-success" style="width: 400px" href="/Admin/UpdateChit.aspx">Update Chit</a> 
                         <br/> 
                         <a class="btn btn-success" style="width: 400px" href="/operator/ManageCollections.aspx">ManageCollections</a> 
                         <br/> 
                         <a class="btn btn-success" style="width: 400px" href="/operator/AddRegisteredSubscriber.aspx">AddSubscriber</a> 
                         <br/> 
                         <a class="btn btn-success" style="width: 400px" href="/operator/Removesubscriber.aspx">RemoveSubscriber</a> 
                         <br/> 
                    </div>
                    <h3><a class="btn btn-large btn-success" style="width: 500px" href="/operator/Auction.aspx">Auction</a></h3>
                    <div></div>
                    <h3><a class="btn btn-large btn-success" style="width: 500px" href="/operator/Report.aspx">Reports</a></h3>
                    <div></div>
                </div>
            </div>
         </div>
     </div>
</asp:Content>




