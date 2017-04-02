<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.master" AutoEventWireup="true" CodeFile="ManageCust.aspx.cs" Inherits="ManageCust" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2
         {
            width: 58%;     
        }
   
             li
        {
            /*border:1px solid black;*/
            /*padding:4px 4px 4px 4px;*/
            width: auto;
            color: white;
            cursor: pointer;
            font: small;
        }
        .borderalltxt 
        {
        border:none;
        }

         .borderalltxt1
        {
        border: 2px solid red;
        }


        #txtEdit {
            width: 64px;
        }


        .auto-style15 {
        }
        .auto-style8 {
            width: 595px;
        }
        .auto-style14 {
            height: 26px;
            width: 1419px;
        }
        #btnEdit {
            width: 86px;
        }


        #txtaid {
            width: 20px;
        }


        .auto-style24 {
            width: 267px;
        }
        .auto-style26 {
            height: 26px;
            width: 267px;
        }
        #cmbState {
            width: 70px;
        }
        #cmbCity {
            width: 70px;
        }


        .auto-style29 {
            width: 313px;
        }


        #cmbAgent {
            width: 70px;
        }


        .auto-style31 {
            width: 1419px;
        }
        .auto-style32 {
            width: 499px;
        }
        #btnCancel {
            width: 83px;
        }


        .auto-style33 {
            width: 190px;
        }
        #File5 {
            width: 79px;
        }
        #File6 {
            width: 82px;
        }


        #txtdob1 {
            width: 103px;
        }


        #txtdob {
            width: 138px;
        }


        #File7 {
            width: 213px;
        }


        #p1 {
            height: 157px;
            width: 192px;
        }


        #imgAdd {
            height: 20px;
            width: 26px;
        }


        #imgId {
            height: 18px;
            width: 25px;
        }


        </style>
  
    
    <script src="../JS/jquery.js"></script>
    <script src="../JS/jquery-ui.min.js"></script>
    <link href="../css/jquery-ui.css" rel="stylesheet" />


<script type="text/javascript">
     
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#photo').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    function readURL1(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#imgAdd').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }



    function readURL2(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#imgId').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $(document).ready(function () {
        
        $('#custinfo').hide();
        $('#cmbState').change(function () {
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: 'ManageCust.aspx/GetCityName',
                data: "{'StateId':'" +this.value + "'}",
                datatype: "json",
                async: false,
                success: function (data) {
                    $('#cmbCity').empty();
                    var str="Select City";
                    $('#cmbCity').append('<option value=0>'+str+'</option>');
                    for (var i = 0; i < data.d.length; i++) {
                        if ($('#cmbCity :selected').text() != data.d[i].city)
                            $('#cmbCity').append('<option value=' + data.d[i].cityId + '>' + data.d[i].city + '</option>');
                    }},
                error: function () {
                    alert("error");}
            });});

        $('#btnEdit').click(function () {
            GetState();
            GetIdProofType();
            GetaddProofType();
           // $("#btnEdit").attr("disabled", true);
        });

        SearchText();
        $('#btnCancel').click(function () {
            $("#btnEdit").attr("disabled", false);
            $('#custinfo').hide();
        });
        $('#btnSearch').click(function () {
            if ($('#txtid').val() == "")
                alert("Enetr Name....");
            else {
                $('# cmbAddPType').empty();
                $('# cmbIddPType').empty();
               
              GetAddProof();
                getSubData();
                GetIdProof();
                showDataCust();
            }
        });
        
       
        function getSubData() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ManageCust.aspx/GetSubscriber",
                data: "{'custid':'" + document.getElementById('txtid').value + "'}",
                dataType: "json",
                success: function (data) {
                    if (data.d.length >= 1) {
                        for (var i = 0; i < data.d.length; i++) {
                            document.getElementById("photo").src = data.d[i].imgurl;
                        }
                    }
                    else
                        document.getElementById("photo").src = "";
                },
                error: function (result) {
                    alert("Image is not correct formate....");
                }
            });
        }
        var add

        function showDataCust()
        {
          
            $('#custinfo').show();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ManageCust.aspx/GetAllData",
                data: "{'custid':'" + document.getElementById('txtid').value + "'}",
                dataType: "json",
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        $("#txtname").val(data.d[i].customerName);
                    
                        $("#txtdob").val(data.d[i].dob);

                        $("#txtmno").val(data.d[i].mobno);
                        $("#txtamno").val(data.d[i].altrmobno);
                        $("#txtsp").val(data.d[i].spouse);
                        $("#txteid").val(data.d[i].emailid);
                        $("#txtcp").val(data.d[i].contactperson);
                        add=(data.d[i].addid);
                        $("#txtArea").val(data.d[i].addName);
                        $("#txthn").val(data.d[i].houseNo);
                        $("#txtstreet").val(data.d[i].street);
                        $("#txtZip").val(data.d[i].Zip);
                        $("#cmbCity").empty();
                        $("#cmbState").empty();
                        $("#cmbCity").append('<option value=' + data.d[i].cityId + '>' + data.d[i].city + '</option>').select;
                        $("#cmbState").append('<option value=' + data.d[i].stateId + '>' + data.d[i].state + '</option>').select;
                    }
                },
                error: function (result) {
                    alert("Error");
                }
               
            });
        
        }
     
        function GetIdProof() {
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: 'ManageCust.aspx/GetIdProof',
                data: "{'custid':'" + document.getElementById('txtid').value + "'}",
                datatype: "json",
                async: false,
                success: function (data) {
                    $('#cmbIdPType').empty();
                    $('#idproof').html("NOt available");
                    document.getElementById("imgId").src = "";
                        for (var i = 0; i < data.d.length; i++) {
                            $('#cmbIdPType').append('<option value=' + data.d[i].IdPTypeId + '>' + data.d[i].IdPTypeName + '</option>');
                            if (data.d[i].idProofDoc == null) {
                                $('#idproof').html("NOt available");
                            }
                            else {
                                document.getElementById("imgId").src = data.d[i].idProofDoc;
                                $('#idproof').html("available");
                            }
                        }
                },
                error: function () {
                    alert("error");
                    imgDocId = null;
                }
            });
        }

        function GetAddProof() {
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: 'ManageCust.aspx/GetAddProof',
                data: "{'custid':'" + document.getElementById('txtid').value + "'}",
                datatype: "json",
                async: false,
                success: function (data) {
                    $('#cmbAddPType').empty();
                    $('#addp').html("NOt available");
                    document.getElementById("imgAdd").src = "";
                        for (var i = 0; i < data.d.length; i++) {
                            $('#cmbAddPType').append('<option value=' + data.d[i].addProofId + '>' + data.d[i].addProofName + '</option>');
                            if (data.d[i].addProofDoc == null) {
                                $('#addp').html("NOt available");
                            }
                            else {
                                document.getElementById("imgAdd").src = data.d[i].addProofDoc;
                                $('#addp').html("available");
                            }
                        }
                   
                },
                error: function () {
                    alert("error");
                }
            });
        }

        function GetIdProofType() {
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: 'ManageCust.aspx/GetIdType',
                data: "{}",
                datatype: "json",
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        if ($('#cmbIdPType :selected').text() != data.d[i].idProofName)
                            $('#cmbIdPType').append('<option value=' + data.d[i].IdPTypeId + '>' + data.d[i].IdPTypeName + '</option>');
                    }
                },
                error: function () {
                    alert("error");
                }
            });
        }
        function GetaddProofType() {
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: 'ManageCust.aspx/GetAddType',
                data: "{}",
                datatype: "json",
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        if ($('#cmbAddPType :selected').text() != data.d[i].addProofName)
                            $('#cmbAddPType').append('<option value=' + data.d[i].addProofId + '>' + data.d[i].addProofName + '</option>');
                    }
                },
                error: function () {
                    alert("error");
                }
            });
        }

        function GetState()  {
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: 'ManageCust.aspx/GetStateName',
                data: "{}",
                datatype: "json",
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        if($('#cmbState :selected').text()!=data.d[i].state )
                            $('#cmbState').append('<option value=' + data.d[i].stateId + '>' + data.d[i].state + '</option>');
                    }},
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
                        url: "ManageCust.aspx/GetAutoCompleteData",
                        data: "{'username':'" + document.getElementById('txtSearch').value + "'}",
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
                    $("#txtid").val(ui.item.val);
                },
                change: function (event, ui) {
                    //$("#txtid").val(ui.item.val);
                },
                focus: function (event, ui) {
                    $("#txtSearch").val(ui.item.label);
                    $("#txtid").val(ui.item.val);

                }
            });
        }

        $('#<%=btnUpdate.ClientID%>').click(function () {
            var custid = $('#txtid').val();
            var addid = add;
            var cityid = $('#cmbCity').val();
            var stateId = $('#cmbState').val();;
            var addptypeid = $('#cmbAddPType').val();
            var idptypeid = $('#cmbIdPType').val();
            var img = $("#photo").attr("src");
            if (img == "")
                img = null;
            var docAdd = $("#imgAdd").attr("src");
            if (docAdd == "")
                docAdd = null;
 
            var docId = $("#imgId").attr("src");
            if (docId == "")
                docId = null;
            var custname = $('#txtname').val();
            var dob = $('#txtdob').val();
            var mobNo = $('#txtmno').val();
            var aMobNo = $('#txtamno').val();
            var emailId = $('#txteid').val();
            var area = $('#txtArea').val();
            var houseNO = $('#txthn').val();
            var street = $('#txtstreet').val();
            var zip = $('#txtZip').val();
            var sp = $('#txtsp').val();
            var cp = $('#txtcp').val();

            var contactNoExp = mobNoExp = /^[7-9][0-9]{9}$/;

            var emailExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/;



            if (custname == '') {
                $('#txtName').html("Enter Name");
                $('#txtname').focus();
                return false;
            }
            else
                $('#txtName').html("");


            if (dob == '') {
                $('#txtDob').html("Enter Date Of Birth");
                return false;
            }
            else
                $('#txtDob').html("");


            if (mobNo != ''|| mobNo=='') {
                if (!mobNo.match(contactNoExp)) {
                    $('#txtMobno').html("Contact No start with 7,8 or 9 and must be 10 digit");
                    $('#txtmob').focus();
                    return false;
                }
                $('#txtMobno').html("");
            }
            if (aMobNo != ''|| aMobNo=='') {
                if (!aMobNo.match(contactNoExp)) {
                    $('#txtaltMobno').html("Contact No start with 7,8 or 9 and must be 10 digit");
                    $('#txtamno').focus();
                    return false;
                }
                $('#txtaltMobno').html("");
            }

            if (sp == '') {
                $('#txtSp').html("Enter Spouse ");
                $('#txtsp').focus();
                return false;
            }
            else
                $('#txtSp').html("");

            if (emailId != ''||emailId=='') {
                if (!emailId.match(emailExp)) {
                    $('#txtEmail').html("Enter Correct Email Id");
                    $('#txteid').focus();
                    return false;
                }
                $('#txtEmail').html("");
            }
           
            if (cp == '') {
                $('#txtCp').html("Enter Contact Person");
                $('#txtcp').focus();
                return false;
            }
            else
                $('#txtCp').html("");

            if (area == '') {
                $('#txtare').html("Enter area");
                $('#txtArea').focus();
                return false;
            }
            else
                $('#txtarea').html("");

            if (houseNO == '') {
                $('#txtHn').html("Enter Area ");
                $('#txthn').focus();
                return false;
            }
            else
                $('#txtHn').html("");

            
            if (street == '') {
                $('#txtStreet').html("Enter street");
                $('#txtstreet').focus();
                return false;
            }
            else
                $('#txtStreet').html("");

            
        
            if (zip == '') {
                $('#txtzip').html("Enter Zip code ");
                $('#txtZip').focus();
                return false;
            }
            else
                $('#txtzip').html("");
        
            $.ajax({
                   type: 'POST',
                   contentType: "application/json; charset=utf-8",
                   url: 'ManageCust.aspx/Insert_Data',
                   data: "{'custid':'" + custid + "','cp':'"+cp+"','addid':'" + addid + "','sp':'" + sp + "','cityid':'" + cityid + "','stateId':'" + stateId + "','addptypeid':'" + addptypeid + "','img':'" + img + "','docAdd':'" + docAdd + "','idptypeid':'" + idptypeid + "','docId':'" + docId + "','name':'" + custname + "','dob':'" + dob + "','mobNo':'" + mobNo + "','aMobNo':'" + aMobNo + "','emailId':'" + emailId + "','area':'" + area + "','houseNO':'" + houseNO + "','street':'" + street + "','zip':'" + zip + "'}",
                   success: function (response) {
                       if(response.d>0)
                           alert("Record saved successfully..!!");
                       else
                           alert("")
                   },
                   error: function () {
                       alert("Image Invalid....");
                   }
               });
        });
    });

    $('#imgAdd').  click(function (){

    });



</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
    <div>
        <table class="auto-style2" style="background-color: #CCFFCC; border: thin solid #000000"><tr><td></td><td></td></tr>
            <tr>
                <td style="text-align: right; font-family: verdana, Geneva, Tahoma, sans-serif; font-size: 14px;">
                    <asp:Label ID="Label1" runat="server" Text="Enter Subscriber Name :"></asp:Label>
                &nbsp;
                </td>
                <td style="text-align: left">
    &nbsp;
    <input type="text" id="txtSearch" class="autosuggest" />
                    <%--<asp:Button ID="btnSerach" value="Search" runat="server" OnClick="btnSerach_Click" Text="Get Data"/>--%>&nbsp;</td>
                
            </tr>
            <tr>
                <td style="text-align: right; font-family: verdana, Geneva, Tahoma, sans-serif; font-size: 14px;">
                    
                    <asp:Label ID="Label2" runat="server" Text="Subscriber ID :"></asp:Label>
                &nbsp;
                    
                </td>
                <td style="text-align: left">
                     &nbsp;
    <input type="text" id="txtid" readonly="true" />&nbsp; 
                    <input type="button" id="btnSearch" value="GetData" class="btnsearchclass" /></td>
                
            </tr><tr><td></td><td></td></tr>
        </table>
       
    </div>

    <div id="custinfo" >
        <br />
    <table class="auto-style2" style="border-style: solid solid none solid; border-width: thin; border-color: #000000; background-color: #FFE8FF; height: 335px;">
       <tr><td class="auto-style31"></td><td></td><td class="auto-style32"></td><td>
           &nbsp;</td></tr> <tr>
            <td class="auto-style31" style="font-size: 14px; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">&nbsp;&nbsp; Customer Name:</td>
            <td class="auto-style24" style="text-align: left">
                <input type="text" id="txtname"    /><span id="txtName" style="color: #EF0C2E">  </span></td>
            <td class="auto-style15" style="text-align: center; font-family: verdana, Geneva, Tahoma, sans-serif; font-size: 14px;" colspan="2" rowspan="5">&nbsp;<img id="photo"  src="" style="border: medium solid #000000; height: 125px; width: 111px" />
                <br />
                &nbsp;
        <input  onchange="readURL(this);" type="file" style="width: 78px"   /></td>
        </tr>
        <tr>
            <td class="auto-style31" style="font-size: 14px; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">&nbsp; Date of Birth:</td>
            <td class="auto-style24" style="text-align: left"><input type="date" id="txtdob" />
                <span id="txtDob"  style="color: #EF0C2E">  &nbsp;</span></td>
        </tr>
        <tr>
            <td class="auto-style31" style="font-size: 14px; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mobile Number:</td>
            <td class="auto-style24" style="text-align: left">
             <input type="text" id="txtmno"    /><span id="txtMobno"  style="color: #EF0C2E">  </span></td>
        </tr>
        <tr>
            <td class="auto-style14" style="font-size: 14px; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alternate Number:</td>
            <td class="auto-style26" style="text-align: left">
                <input type="text" id="txtamno"    /><span id="txtaltMobno"  style="color: #EF0C2E">  </span></td>
        </tr>
        <tr>
            <td class="auto-style14" style="font-size: 14px; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Spouse:</td>
            <td class="auto-style26" style="text-align: left">
                <input type="text" id="txtsp" /><span id="txtSp" style="color: #EF0C2E">  </span></td>
        </tr>
        <tr>
            <td class="auto-style31" style="font-size: 14px; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email Id:</td>
            <td style="text-align: left" class="auto-style24">
                <input type="text" id="txteid"    /><span id="txtEmail"  style="color: #EF0C2E">  </span></td>
            <td class="auto-style32" style="text-align: right; font-family: verdana, Geneva, Tahoma, sans-serif; font-size: 14px;">Street:</td>
            <td class="auto-style8" style="text-align: left"><input id="txtstreet" type="text"     /><span id="txtStreet"  style="color: #EF0C2E">  </span></td>
        </tr>
        <tr>
            <td class="auto-style31" style="font-size: 14px; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">Contact Person:</td>
            <td style="text-align: left" class="auto-style24">
                <input type="text" id="txtcp"   /><span id="txtCp"  style="color: #EF0C2E">  </span></td>
            <td class="auto-style32" style="text-align: right; font-family: verdana, Geneva, Tahoma, sans-serif; font-size: 14px;">Zip:</td>
            <td class="auto-style8" style="text-align: left">
                <input id="txtZip" type="text"    /><span id="txtzip"  style="color: #EF0C2E">  </span></td>
        </tr>
        <tr>
            <td class="auto-style31" style="font-size: 14px; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">Area:</td>
            <td style="text-align: left" class="auto-style24">
                <input id="txtArea" type="text"   /><span id="txtarea"  style="color: #EF0C2E">  </span></td>
            <td class="auto-style32" style="text-align: right; font-family: verdana, Geneva, Tahoma, sans-serif; font-size: 14px;">Select State:</td>
            <td class="auto-style8" style="text-align: left"><select id="cmbState" name="D1"   enabled="true">
                
                </select></td>
        </tr>
        <tr>
            <td class="auto-style31" style="font-size: 14px; font-family: verdana, Geneva, Tahoma, sans-serif; text-align: right;">House Number:</td>
            <td style="text-align: left" class="auto-style24">
                <input id="txthn" type="text"   /><span id="txtHn"  style="color: #EF0C2E">  </span></td>
            <td class="auto-style32" style="text-align: right; font-family: verdana, Geneva, Tahoma, sans-serif; font-size: 14px;">Select City:</td>
            <td class="auto-style8" style="text-align: left"><select id="cmbCity" name="D2   readonly="true"/>              
                </select>&nbsp;
                </td>
        </tr>
        <tr><td class="auto-style31"></td><td></td><td class="auto-style32"></td><td></td></tr>
        </table>
            <table style="border-style: none solid solid solid; border-width: thin; border-color: #000000; width: 640px; background-color: #FFD5FF;"  >
        <tr>
            <td class="auto-style33" style="text-align: right; font-size: 14px; font-family: verdana, Geneva, Tahoma, sans-serif;">Address Proof Type:</td>
            <td class="auto-style29" style="text-align: left">
                &nbsp;<select id="cmbAddPType" name="D3"    >
             
                </select><img id="imgAdd"  src=""/>&nbsp;&nbsp;&nbsp; <input id="File5" type="file"   onchange="readURL1(this);" />
        
                <span id="addp" style="color: #CC0000">Not Available</span></td>
        </tr>
        <tr>
            <td class="auto-style33" style="text-align: right; font-size: 14px; font-family: verdana, Geneva, Tahoma, sans-serif;">&nbsp; Id Proof Type:</td>
            <td class="auto-style29" style="text-align: left">
                <select id="cmbIdPType" name="D4"    >
                   
                </select><img id="imgId"  src="" />&nbsp;&nbsp;&nbsp; <input id="File6" type="file"   onchange="readURL2(this);" /> <span id="idproof" style="color: #CC0000">Not Available</span></td>
        </tr>
        <tr>
            <td class="auto-style33" style="text-align: right; font-size: 14px; font-family: verdana, Geneva, Tahoma, sans-serif;">&nbsp;</td>
            <td class="auto-style29" style="text-align: left">&nbsp;</td>
        </tr>
    </table>
         <br />
         <input type="button" id="btnEdit" value="Edit" style="color: #990000; font-size: large;" />&nbsp;&nbsp;&nbsp;
          <asp:Button ID="btnUpdate" runat="server" Text="Update" style="color: #990000; font-size: large;"/>
      &nbsp;&nbsp;&nbsp;
      <input type="button" id="btnCancel" value="Cancel" style="color: #990000; font-size: large;" /> 
        <br />
        <br />
        </div>
     </div>
    </asp:Content>