<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.master" AutoEventWireup="true" CodeFile="AddRegisteredSubscriber.aspx.cs" Inherits="operator_AddRegisteredSubscriber" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../css/Popup.css" type="text/css" />
    <script src="../JS/jquery.js" type="text/javascript"></script>
    <script src="../JS/jquery-ui.min.js" type="text/javascript"></script>
    <script src="../JS/jquery.form-validator.min.js"></script>
    <script>
        $(document).ready(function () {
            $.validate({
                onSuccess: function () {
                        var chitId = $('#ddlChitName').val();
                        var customerId = $('#txtSubId').val();
                        var nomineeId = $('#ddlNomineeName').val();
                        var guarantorId = $('#ddlGuarantor').val();
                        var applicationDoc = $('#imgApplicationDoc').attr("src");
                        if (applicationDoc == "") {
                            alert("Select required documents")
                            return false;
                        }
                        var bidOfferDoc = $('#imgBidOfferDoc').attr("src");
                        if (bidOfferDoc == "") {
                            alert("Select required documents")
                            return false;
                        }
                        var authorizationDoc = $('#imgAuthorizationDoc').attr("src");
                        if (authorizationDoc == "") {
                            alert("Select required documents")
                            return false;
                        }
                        var agreementDoc = $('#imgAgreementDoc').attr("src");
                        if (agreementDoc == "") {
                            alert("Select required documents")
                            return false;
                        }
                        $.ajax({
                            type: 'POST',
                            contentType: "application/json; charset=utf-8",
                            url: '../operator/AddRegisteredSubscriber.aspx/InsertCustomerToChit',
                            data: "{'customerId':'" + customerId + "','chitId':'" + chitId + "','nomineeId':'" + nomineeId + "','guarantorId':'" + guarantorId + "','applicationDoc':'" + applicationDoc + "','authorizationDoc':'" + authorizationDoc + "','bidOfferDoc':'" + bidOfferDoc + "','agreementDoc':'" + agreementDoc + "'}",
                            datatype: "json",
                            success: function (data) {
                                if (data.d > 0) {
                                    alert("customer Added To Chit");
                                    $('#divCustomerInchit').show();
                                    GetCustomerFromChit();
                                    $("#ddlChitName,#ddlNomineeName,#ddlGuarantor").val();

                                    $('#txtSubId').val("");

                                }
                            }
                            ,
                            error: function () {
                                alert("error")
                            }
                        });
                        return false;

                }
            });
        });
            //SETTING UP OUR POPUP.0000
        //0 means disabled; 1 means enabled;
        var popupStatus = 0;

        //loading popup with jQuery magic!
        function loadPopup(id) {
            //loads popup only if it is disabled
            if (popupStatus == 0) {
                $("#backgroundpopup").css({
                    "opacity": "0.7"
                });
                $("#backgroundpopup").fadeIn("slow");
                $(id).fadeIn("slow");
                popupStatus = 1;
            }
        }
        //disabling popup with jQuery magic!
        function disablePopup() {
            //disables popup only if it is enabled
            if (popupStatus == 1) {
                $("#backgroundpopup").fadeOut("slow");
                $("#div1,#divNominee").fadeOut("slow");
                popupStatus = 0;
            }
        }


        function centerPopup(id) {
            //request data for centering
            var windowWidth = document.documentElement.clientWidth;
            var windowHeight = document.documentElement.clientHeight;
            var popupHeight = $(id).height();
            var popupWidth = $(id).width();
            //centering
            $(id).css({
                "position": "absolute",
                "top": windowHeight / 2 - popupHeight / 2,
                "left": windowWidth / 2 - popupWidth / 2
            });
            //only need force for IE6

            $("#backgroundpopup").css({
                "height": windowHeight
            });
        }

        function GetIdProofData() {
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: '../operator/AddRegisteredSubscriber.aspx/GetIdProofData',
                data: "{}",
                datatype: "json",
                async: false,
                success: function (data) {
                    $('#ddlIdProof').find('option').remove();
                    $('#ddlIdProof').append('<option value="">--select--</option>');
                    for (var i = 0; i < data.d.length; i++) {

                        $('#ddlIdProof').append('<option value=' + data.d[i].IdProofId + '>' + data.d[i].IdProofName + '</option>');
                    }
                },
                error: function () {
                    alert("error");
                }
            });
        }

        function GetNominee() {
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: '../operator/AddRegisteredSubscriber.aspx/GetNominee',
                data: "{'customerId':'" + $('#txtSubId').val() + "'}",
                datatype: "json",
                async: false,
                success: function (data) {
                    $('#ddlNomineeName').find('option').remove();
                    $('#ddlNomineeName').append('<option value="">--select--</option>');
                    for (var i = 0; i < data.d.length; i++) {
                        $('#ddlNomineeName').append('<option value=' + data.d[i].NomineeId + '>' + data.d[i].NomineeName + '</option>');
                    }
                },
                error: function () {
                    alert("error");
                }
            });

        }
        function GetNewNominee() {
            var id;
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: '../operator/AddRegisteredSubscriber.aspx/GetNewNominee',
                data: "{}",
                datatype: "json",
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        $('#ddlNomineeName').append('<option value=' + data.d[i].NomineeId + '>' + data.d[i].NomineeName + '</option>');
                        id = data.d[i].NomineeId;
                    }
                    $('#ddlNomineeName').val(id);
                },
                error: function () {
                    alert("error");
                }
            });
        }
        function GetAddressProofIdName() {
            var id;
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: '../operator/AddRegisteredSubscriber.aspx/GetAddressProofIdName',
                data: "{}",
                datatype: "json",
                async: false,
                success: function (data) {
                    $('#ddlAddressProof').find('option').remove();
                    $('#ddlAddressProof').append('<option value="">--select--</option>');
                    for (var i = 0; i < data.d.length; i++) {
                        $('#ddlAddressProof').append('<option value=' + data.d[i].AddressProofId + '>' + data.d[i].AddressProofName + '</option>');
                    }
                },
                error: function () {
                    alert("error");
                }
            });

        }
        function SearchText() {
            $(".autosuggest").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "../operator/AddRegisteredSubscriber.aspx/GetAutoCompleteData",
                        data: "{'chitId':'" + $('#ddlChitName').val() + "','username':'" + document.getElementById('txtSubName').value + "'}",
                        dataType: "json",
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    label: item.split('/')[0],
                                    val: item.split('/')[1]
                                }
                            }));

                        },
                        error: function (result) {
                            alert("Error");
                        },
                    });
                },
                select: function (event, ui) {
                    $("#txtSubId").val(ui.item.val);
                    $('#divNom').show();
                    GetNominee();
                    GetGuarantor();
                },
                change: function (event, ui) {
                },
                focus: function (event, ui) {
                    $("#txtSubName").val(ui.item.label);
                    $("#txtSubId").val(ui.item.val);
                }
            });
        }


        function GetGuarantor() {
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: '../operator/AddRegisteredSubscriber.aspx/GetGuarantor',
                data: "{'Id':'" + document.getElementById('txtSubId').value + "'}",
                datatype: "json",
                async: false,
                success: function (data) {
                    $('#ddlGuarantor').find('option').remove();
                    $('#ddlGuarantor').append('<option value="">--select--</option>');
                    for (var i = 0; i < data.d.length; i++) {
                        $('#ddlGuarantor').append('<option value=' + data.d[i].GuaranterId + '>' + data.d[i].GuaranterName + '</option>');
                    }
                },
                error: function () {
                    alert("error");
                }
            });
        }

        function GetNewGuarantor() {
            var id;
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: '../operator/AddRegisteredSubscriber.aspx/GetNewGuarantor',
                data: "{}",
                datatype: "json",
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        $('#ddlGuarantor').append('<option value=' + data.d[i].GuaranterId + '>' + data.d[i].GuaranterName + '</option>');
                        id = data.d[i].GuaranterId;
                    }
                    $('#ddlGuarantor').val(id);
                },
                error: function () {
                    alert("error");
                }
            });
        }

        function GetChit() {
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: '../operator/ViewSubscriber.aspx/GetChit',
                data: "{}",
                datatype: "json",
                async: false,
                success: function (data) {
                    $('#ddlChitName').find('option').remove();
                    $('#ddlChitName').append('<option value="">--select--</option>');
                    for (var i = 0; i < data.d.length; i++) {
                        $('#ddlChitName').append('<option value=' + data.d[i].ChitId + '>' + data.d[i].ChitName + '</option>');
                    }
                },
                error: function () {
                    alert("error");
                }
            });
        }
        function readAddressUrl(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgAddress').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        function readIdUrl(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgIdProof').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        function readApplicationUrl(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgApplicationDoc').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        function readAuthorizationUrl(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgAuthorizationDoc').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        function readBidOfferUrl(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgBidOfferDoc').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        function readAgreementUrl(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgAgreementDoc').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        function GetCustomerFromChit() {
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: '../operator/AddRegisteredSubscriber.aspx/GetCustomerFromChit',
                data: "{'chitId':'" + $('#ddlChitName').val() + "'}",
                datatype: "json",
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        $('#tblCustomerInChit').append("<tr><td class='tdclass'>" + data.d[i].ChitId + "</td><td class='tdclass'>" + data.d[i].CustomerId + "</td><td class='tdclass'>" + data.d[i].CustomerName + "</td><td class='tdclass'>" + data.d[i].GuaranterId + "</td><td class='tdclass'>" + data.d[i].MobileNo + "</td><td class='tdclass'>" + data.d[i].SubscriberDocId + "</td></tr>");
                    }
                },
                error: function () {
                    alert("error");
                }
            });
        }

        $(document).ready(function () {
            $('#divAvailableSubscriber,#divNom,#divGuaranter,#divUploadDocument,#divCustomerInchit,#div1').hide();
            $('#btnAddGuarantor').click(function () {
                //centering with css
                centerPopup('#div1');
                //load popup
                loadPopup('#div1');
                GetAddressProofIdName();
                GetIdProofData();
            });
            $('#ddlNomineeName').change(function () {
                $('#divGuaranter').show();
            });
            $('#ddlGuarantor').change(function () {
                $('#divUploadDocument').show();
            });

            $('#btnAddNominee').click(function () {
                //centering with css
                centerPopup('#divNominee');
                //load popup
                loadPopup('#divNominee');
            });


            $("#backgroundpopup").click(function () {
                disablePopup();
            });
            //Press Escape event!
            $(document).keydown(function (e) {
                if (e.keyCode == 27 && popupStatus == 1) {
                    disablePopup();
                }
            });
            GetChit();

            $('#btnInsertNominee').click(function () {
                var name = $('#txtNomineeName').val();
                var relation = $('#txtNomineeRelation').val();
                var dob = $('#txtNomineeDob').val();
                var age = $('#txtNomineeAge').val();
                var contactNo = $('#txtNomineeContact').val();
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: '../operator/AddRegisteredSubscriber.aspx/InsertNominee',
                    data: "{'name':'" + name + "','relation':'" + relation + "','dob':'" + dob + "','age':'" + age + "','contactNo':'" + contactNo + "'}",
                    datatype: "json",
                    async: false,
                    success: function (data) {
                        if (data.d > 0) {
                            GetNewNominee();
                            disablePopup();
                            $('#divGuaranter').show();
                        }
                    },
                    error: function () {
                        alert("error");
                    }
                });
            });
            $('#btnInsertGuarantor').click(function () {
                var name = $('#txtName').val();
                var date = $('#datepicker').val();
                var age = $('#txtAge').val();
                var relation = $('#txtRelation3').val();
                var contactNo = $('#txtContactNo').val();
                var idProofId = $('#ddlIdProof').val();
                var idProofDoc = $('#imgIdProof').attr("src");
                if (idProofDoc == "") {
                    alert("Select required documents")
                    return false;
                }

                var addProofId = $('#ddlAddressProof').val();
                var addProofDoc = $('#imgAddress').attr("src");
                if (addProofDoc == "") {
                    alert("Select required documents")
                    return false;
                }

                var occupation = $('#txtOccupation').val();
                var company = $('#txtCompany').val();
                var income = $('#txtIncome').val();

                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: '../operator/AddRegisteredSubscriber.aspx/InsertGuarantor',
                    data: "{'name':'" + name + "','date':'" + date + "','age':'" + age + "','relation':'" + relation + "','contactNo':'" + contactNo + "','idProofId':'" + idProofId + "','idProofDoc':'" + idProofDoc + "','addProofId':'" + addProofId + "','addProofDoc':'" + addProofDoc + "','occupation':'" + occupation + "','company':'" + company + "','income':'" + income + "'}",
                    datatype: "json",
                    success: function (data) {
                        if (data.d > 0) {
                            GetNewGuarantor();
                            disablePopup();
                            $('#divUploadDocument').show();

                        }
                    }
                    ,
                    error: function () {
                        alert("error")
                    }
                });

            });

          //  $('#btnAddToChitGroup').click(function () {
            function submitForm1() {
                var chitId = $('#ddlChitName').val();
                var customerId = $('#txtSubId').val();
                var nomineeId = $('#ddlNomineeName').val();
                var guarantorId = $('#ddlGuarantor').val();
                var applicationDoc = $('#imgApplicationDoc').attr("src");
                if (applicationDoc == "") {
                    alert("Select required documents")
                    return false;
                }
                var bidOfferDoc = $('#imgBidOfferDoc').attr("src");
                if (bidOfferDoc == "") {
                    alert("Select required documents")
                    return false;
                }
                var authorizationDoc = $('#imgAuthorizationDoc').attr("src");
                if (authorizationDoc == "") {
                    alert("Select required documents")
                    return false;
                }
                var agreementDoc = $('#imgAgreementDoc').attr("src");
                if (agreementDoc == "") {
                    alert("Select required documents")
                    return false;
                }
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: '../operator/AddRegisteredSubscriber.aspx/InsertCustomerToChit',
                    data: "{'customerId':'" + customerId + "','chitId':'" + chitId + "','nomineeId':'" + nomineeId + "','guarantorId':'" + guarantorId + "','applicationDoc':'" + applicationDoc + "','authorizationDoc':'" + authorizationDoc + "','bidOfferDoc':'" + bidOfferDoc + "','agreementDoc':'" + agreementDoc + "'}",
                    datatype: "json",
                    success: function (data) {
                        if (data.d > 0) {
                            alert("customer Added To Chit");
                            $('#divCustomerInchit').show();
                            GetCustomerFromChit();
                            $("#ddlChitName,#ddlNomineeName,#ddlGuarantor").val();

                            $('#txtSubId').val("");

                        }
                    }
                    ,
                    error: function () {
                        alert("error")
                    }
                });
                //    return false;
                //});
            }

            $('#ddlChitName').change(function () {
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: '../operator/AddRegisteredSubscriber.aspx/GetChitInfo',
                    data: "{'id':'" + this.value + "'}",
                    datatype: "json",
                    async: false,
                    success: function (data) {
                        if (data.d.length == 0) {
                            alert("Sorry No Information Is available for this chit..");
                            $('#ddlChitName').val(0);
                            $('#startDate,#noOfMonths,#availSlots,#chitVal,#monthlyInstallment').html("");
                        }
                        else {
                            for (var i = 0; i < data.d.length; i++) {
                                $('#startDate').html(data.d[i].ChitGroupStartDate);
                                $('#noOfMonths').html(data.d[i].NoOfMonths);
                                $('#availSlots').html(data.d[i].AvailableSlots);
                                $('#chitVal').html(data.d[i].ChitValue);
                                $('#monthlyInstallment').html(data.d[i].MonthlyInstallment);
                            }
                            $('#divAvailableSubscriber').show();
                        }
                    },
                    error: function () {
                        alert("error")
                    }
                });
            });
            SearchText();
        });
    </script>
    <style>
        #tblChit, #tblAvailableSubscriber, #tblNominee, #tblGuaranter, #tblUploadDocument, #tblCustomerInChit {
            border: 1px solid;
            background-color: silver;
        }

            #tblAvailableSubscriber tr:first-child, #tblNominee tr:first-child, #tblChit tr:first-child, #tblGuaranter tr:first-child, #tblUploadDocument tr:first-child, #tblCustomerInChit tr:first-child {
                background-color: aqua;
            }

        li {
            width: auto;
            background-color: lemonchiffon;
            color: white;
            cursor: pointer;
            font: small;
        }

        .tdclass {
            border-bottom: solid 1px #dadada;
            background-color: lemonchiffon;
            width: 250px;
            height: 30px;
        }

        .tdright {
            text-align: right;
            width: 200px;
        }

        .tdleft {
            text-align: left;
            width: 200px;
        }
    </style>
    <div id="Panel1" style="height: 800px;">
        <div id="div_tblChit" align="center">
            <table id="tblChit" border="1">
                <tr>
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                    <td colspan="2"><strong>CHITS AVAILABLE</strong></td>
                </tr>
                <tr>
                    <td class="tdright">Chit Group</td>
                    <td class="tdleft">
                        <select id="ddlChitName">
                            <option value="0">select Chit</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="tdright">Start Date:</td>
                    <td class="tdleft" id="startDate"></td>
                </tr>
                <tr>
                    <td class="tdright">Number of Months:</td>
                    <td class="tdleft" id="noOfMonths"></td>
                </tr>
                <tr>
                    <td class="tdright">Available Slots:</td>
                    <td class="tdleft" id="availSlots"></td>
                </tr>
                <tr>
                    <td class="tdright">Chit Value:</td>
                    <td class="tdleft" id="chitVal"></td>
                </tr>
                <tr>
                    <td class="tdright">Monthly Installment:</td>
                    <td class="tdleft" id="monthlyInstallment"></td>
                </tr>
            </table>
        </div>
        <br />
        <div id="divAvailableSubscriber" align="center">
            <table id="tblAvailableSubscriber" border="1">
                <tr>
                    <td colspan="6"><strong>LIST OF AVILABLE SUBSCRIBER</strong></td>
                </tr>
                <tr>
                    <td>Subscriber Name</td>
                    <td>
                        <input id="txtSubName" class="autosuggest" /></td>

                    <td>Subscriber Id</td>
                    <td>
                        <input id="txtSubId" data-validation="number" /><br /></td>

                </tr>
            </table>
        </div>
        <br />
        <div id="divNom" align="center">
            <table border="1" id="tblNominee">
                <tr>
                    <td colspan="3" style="width: 400px"><strong>NOMINEE DETAILS</strong>
                    </td>
                </tr>
                <tr>
                    <td>Select Nominee:</td>
                    <td>
                        <select id="ddlNomineeName" data-validation="required">
                            <option value="">Select Nominee</option>
                        </select><br /></td>
                    <td>
                        <input type="button" value="Add Nominee" id="btnAddNominee" /></td>
                </tr>
            </table>
            </br>
        </div>
        <div id="divNominee" style="display: none; position: fixed; _position: absolute; /* hack for internet explorer 6*/
            height: 200px; width: 408px; background: #FFFFFF; border: 2px solid #cecece; z-index: 2; padding: 12px; font-size: 13px; background-color: aqua;"
            align="center">
            <table>
                <tr>
                    <th colspan="2">
                        <h1>Add Nominee</h1>
                    </th>
                </tr>
                <tr>
                    <td>NAME:</td>
                    <td>
                        <input id="txtNomineeName" />
                    </td>
                </tr>
                <tr>
                    <td>RELATIONSHIP:</td>
                    <td>
                        <input id="txtNomineeRelation" />
                    </td>
                </tr>
                <tr>
                    <td>DATE OF BIRTH:</td>
                    <td>
                        <input type="date" id="txtNomineeDob" />(mm/dd/yyyy)
                    </td>
                </tr>
                <tr>
                    <td>AGE:</td>
                    <td>
                        <input id="txtNomineeAge" />
                    </td>
                </tr>
                <tr>
                    <td>CONTACT No:</td>
                    <td>
                        <input id="txtNomineeContact" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" colspan="2">
                        <input type="button" value="AddNominee" id="btnInsertNominee" />&nbsp;&nbsp;<input type="button" value="Clear" id="btnClearNominee" /></td>
                </tr>
            </table>
        </div>
        <div id="divGuaranter" align="center">
            <table id="tblGuaranter">
                <tr>
                    <td colspan="3"><strong>GUARANTOR DETAILS</strong></td>
                </tr>
                <tr>
                    <td>Select Guarantor:</td>
                    <td>
                        <select id="ddlGuarantor" data-validation="required">
                            <option value="">Select Guarantor</option>
                        </select><br />
                    </td>
                    <td>
                        <input type="button" id="btnAddGuarantor" value="Add Guarantor" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="div1" align="center">
            <table>
                <tr>
                    <th colspan="2">
                        <h1>Add Guarantor</h1>
                    </th>
                </tr>
                <tr>
                    <td>Guarantor Name:</td>
                    <td>
                        <input id="txtName" />
                    </td>
                </tr>
                <tr>
                    <td>Date of Birth:</td>
                    <td>
                        <input type="date" id="datepicker" />(mm/dd/yyyy) </td>
                </tr>
                <tr>
                    <td>Age:</td>
                    <td>
                        <input id="txtAge" />
                    </td>
                </tr>
                <tr>
                    <td>Relation:</td>
                    <td>
                        <input id="txtRelation3" />
                    </td>
                </tr>
                <tr>
                    <td>Contact No:</td>
                    <td>
                        <input id="txtContactNo" />
                    </td>
                </tr>

                <tr>
                    <td>ID Proof:</td>
                    <td>
                        <select id="ddlIdProof" >
                            <option value="">Select Id Proof</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Upload Id Proof:</td>
                    <td>
                        <img id="imgIdProof" src="" style="display: none" />
                        <input type="file" id="fileUploadId" onchange="readIdUrl(this)" />
                    </td>
                </tr>
                <tr>
                    <td>Address Proof:</td>
                    <td>

                        <select id="ddlAddressProof">
                            <option value="0">Select Id Proof</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Upload Address Proof:</td>
                    <td>
                        <img id="imgAddress" src="" style="display: none" />
                        <input type="file" id="fileUploadAddress" onchange="readAddressUrl(this);" />
                    </td>
                </tr>
                <tr>
                    <td>Occupation:</td>
                    <td>
                        <input id="txtOccupation" />
                    </td>
                </tr>
                <tr>
                    <td>Company:</td>
                    <td>
                        <input id="txtCompany" />
                    </td>
                </tr>
                <tr>
                    <td>Annual Income:</td>
                    <td>
                        <input id="txtIncome" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" colspan="2">
                        <input type="button" value="AddGuarantor" id="btnInsertGuarantor" />&nbsp;&nbsp;<input type="button" value="Clear" id="btnClearGuarantor" /></td>
                </tr>
            </table>
        </div>
        <div id="backgroundpopup"></div>
        <br />
        <div id="divUploadDocument" align="center">
            <table id="tblUploadDocument">
                <tr>
                    <td colspan="2"><strong>UPLOAD DOCUMENT</strong></td>
                </tr>
                <tr>
                    <td>Application Document:</td>
                    <td>
                        <img id="imgApplicationDoc" src="" style="display: none" />
                        <input type="file" id="fileApplicationDoc" data-validation="required" onchange="readApplicationUrl(this);" /><br />
                    </td>
                </tr>
                <tr>
                    <td>Bid Offer Document:</td>
                    <td>
                        <img id="imgBidOfferDoc" src="" style="display: none" />
                        <input type="file" id="fileBidOfferDoc" data-validation="required" onchange="readBidOfferUrl(this);" /><br />
                    </td>
                </tr>
                <tr>
                    <td>Authorization Document:</td>
                    <td>
                        <img id="imgAuthorizationDoc" src="" style="display: none" />
                        <input type="file" id="fileAuthorizationDoc" data-validation="required" onchange="readAuthorizationUrl(this);" /><br />
                    </td>
                </tr>
                <tr>
                    <td>Agreement Document:</td>
                    <td>
                        <img id="imgAgreementDoc" src="" style="display: none" />
                        <input type="file" id="fileAgreementDoc" data-validation="required" onchange="readAgreementUrl(this);" /><br /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnAddToChitGroup" ClientIDMode="Static" runat="server" Text="Add to chit group" />
                        <%--<input id="btnAddToChitGroup" onsubmit="#" type="submit" value="Add to chit group" />--%>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="btnReset" value="Reset" type="button" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div id="divCustomerInchit" align="center">
            <table id="tblCustomerInChit">
                <tr>
                    <th colspan="6"><strong>CUSTOMERS IN CHIT GROUP </strong></th>
                </tr>
                <tr>
                    <th>Chit Id</th>
                    <th>Customer Id</th>
                    <th>Customer Name</th>
                    <th>Guarenter Id</th>
                    <th>Mobile Number</th>
                    <th>Subscriber Doc Id</th>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>

