<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/jquery-ui-1.10.4.min.css" rel="stylesheet" />
   <link href="../css/bootstrap.min.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<script src="../JS/jquery-1.10.2.min.js"></script>
    <script src="../JS/jquery-1.10.4-ui.js"></script>
    
    <script type="text/javascript">
        var Goto = "ViewReport.aspx?Report=*report*&By=*by*&Value=*value*"

        $(document).ready(function () {
            $('#ddlAreaWise').hide();
            $('#ddlAgentWise').hide();
            $('#divDynamic').hide();
            $('#txtMonthly').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'MM yy'
            });
            $('#txtYearly').datepicker({
                changeMonth: false,
                changeYear: true,
                dateFormat: 'yy'
            });
            $('#txtDatewise').datepicker();
            $('#txtStarted').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'MM yy'
            });
            $('#txtEnded').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'MM yy'
            });
            var isPostBack = true;
            var z = true;
            var y = true;
            var sid = true;
            var sid1 = true;
            $('#TEMP').hide();
            $('#divAdmin').hide();
            $('#divAgent').hide();
            $('#divOperator').hide();
            $('#divChit').hide();
            $('#divSubscriber').hide();
            $('#txtAmount').hide();
            $('#txtAgent').hide();
            $('#txtOperator').hide();
            $('#txtSubscriber').hide();
            $('#txtMonthly').hide();
            $('#txtYearly').hide();
            $('#txtDatewise').hide();
            $('#txtStarted').hide();
            $('#txtEnded').hide();

            $('#ddlChit').change(function () {
                if ($('#ddlChit').val() == 0) {
                    $('#txtAmount').hide();
                    $('#txtMonthly').hide();
                    $('#txtYearly').hide();
                    $('#txtDatewise').hide();
                    $('#txtStarted').hide();
                    $('#txtEnded').hide();
                } else
                    if ($('#ddlChit').val() == 1) {
                        $('#txtAmount').show();
                        $('#txtMonthly').hide();
                        $('#txtYearly').hide();
                        $('#txtDatewise').hide();
                        $('#txtStarted').hide();
                        $('#txtEnded').hide();
                    }
                    else if ($('#ddlChit').val() == 3) {
                        $('#txtMonthly').show();
                        $('#txtYearly').hide();
                        $('#txtDatewise').hide();
                        $('#txtStarted').hide();
                        $('#txtEnded').hide();
                        $('#txtAmount').hide();
                    }
                    else if ($('#ddlChit').val() == 4) {
                        $('#txtYearly').show();
                        $('#txtMonthly').hide();
                        $('#txtDatewise').hide();
                        $('#txtStarted').hide();
                        $('#txtEnded').hide();
                        $('#txtAmount').hide();
                    }
                    else if ($('#ddlChit').val() == 5) {
                        $('#txtDatewise').show();
                        $('#txtMonthly').hide();
                        $('#txtYearly').hide();
                        $('#txtStarted').hide();
                        $('#txtEnded').hide();
                        $('#txtAmount').hide();
                    }
                    else if ($('#ddlChit').val() == 6) {
                        $('#txtStarted').show();
                        $('#txtMonthly').hide();
                        $('#txtYearly').hide();
                        $('#txtDatewise').hide();
                        $('#txtEnded').hide();
                        $('#txtAmount').hide();
                    }
                    else if ($('#ddlChit').val() == 7) {
                        $('#txtEnded').show();
                        $('#txtMonthly').hide();
                        $('#txtYearly').hide();
                        $('#txtDatewise').hide();
                        $('#txtStarted').hide();
                        $('#txtAmount').hide();
                    }
                    else {
                        $('#txtMonthly').hide();
                        $('#txtYearly').hide();
                        $('#txtDatewise').hide();
                        $('#txtStarted').hide();
                        $('#txtEnded').hide();
                        $('#txtAmount').hide();
                    }

            });

            $('#ddlSubscriber').change(function () {
                if ($('#ddlSubscriber').val() == 1) {
                    $('#ddlAreaWise').hide();
                    $('#ddlAgentWise').hide();
                    $('#txtSubscriber').show();
                }
                else if ($('#ddlSubscriber').val() == 3) {
                    $('#ddlAreaWise').hide();
                    if (sid1) {
                        $.ajax({
                            type: 'POST',
                            contentType: "application/json; charset=utf-8",
                            url: 'Report.aspx/GetAgentName',
                            data: "{}",
                            datatype: "json",
                            async: true,
                            success: function (data) {
                                for (var i = 0; i < data.d.length; i++) {
                                    $("#ddlAgentWise").append("<option value='" + data.d[i].AgentId + "'>" + data.d[i].AgentName + "</option>");
                                }
                            },
                            error: function () {
                                alert("error")
                            }
                        });
                        sid1 = false;
                    }
                    $('#ddlAgentWise').show();
                    $('#txtSubscriber').hide();
                }
                else if ($('#ddlSubscriber').val() == 4) {
                    if (sid) {
                        $.ajax({
                            type: 'POST',
                            contentType: "application/json; charset=utf-8",
                            url: 'Report.aspx/GetAreaWise',
                            data: "{}",
                            datatype: "json",
                            async: true,
                            success: function (data) {
                                for (var i = 0; i < data.d.length; i++) {
                                    $("#ddlAreaWise").append("<option value='" + data.d[i].AreaId + "'>" + data.d[i].AreaName + "</option>");
                                }
                            },
                            error: function () {
                                alert("error")
                            }
                        });
                        sid = false;
                    }
                    $('#ddlAreaWise').show();
                    $('#ddlAgentWise').hide();
                    $('#txtSubscriber').hide();
                }
                else {
                    $('#ddlAreaWise').hide();
                    $('#ddlAgentWise').hide();
                    $('#txtSubscriber').hide();
                }
            });

        }
        );

    </script>
    <script>
        $(document).ready(function () {

            $('#lnkAdmin').click(function () {
                $('#txtAmount').hide();
                $('#txtAgent').hide();
                $('#txtOperator').hide();
                $('#txtSubscriber').hide();
                Goto = Goto.replace("*report*", "Admin");
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: 'Report.aspx/GetAdminName',
                    data: "{}",
                    datatype: "json",
                    async: true,
                    success: function (data) {
                        for (var i = 0; i < data.d.length; i++) {
                            $("#ddlAdmin").append("<option value='" + data.d[i].AdminId + "'>" + data.d[i].AdminName + "</option>");
                        }
                    },
                    error: function () {
                        alert("error")
                    }
                });


                $("#divAdmin").dialog({
                    title: "ADMIN POPUP",
                    modal: true,
                    show: {
                        effect: "blind",
                        duration: 500
                    },
                    hide: {
                        effect: "explode",
                        duration: 500
                    },
                    buttons: {
                        Go: function () {
                            if ($('#ddlAdmin').val() == 0) {
                                Goto = Goto.replace("*by*", "All");
                                Goto = Goto.replace("*value*", "");
                                window.location.href = Goto;

                            }
                            else if ($('#ddlAdmin').val() != 0) {
                                Goto = Goto.replace("*by*", "Id");
                                Goto = Goto.replace("*value*", $('#ddlAdmin').val());
                                window.location.href = Goto;

                            }

                        }
                    }
                });
            });

            $('#lnkAgent').click(function () {
                Goto = Goto.replace("*report*", "Agent");
                $('#ddlAgent').val('0');
                $('#txtAmount').hide();
                $('#txtAgent').hide();
                $('#txtOperator').hide();
                $('#txtSubscriber').hide();

                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: 'Report.aspx/GetAgentName',
                    data: "{}",
                    datatype: "json",
                    async: true,
                    success: function (data) {
                        for (var i = 0; i < data.d.length; i++) {
                            $("#ddlAgent").append("<option value='" + data.d[i].AgentId + "'>" + data.d[i].AgentName + "</option>");
                        }
                    },
                    error: function () {
                        alert("error")
                    }
                });
                $("#divAgent").dialog({
                    title: "AGENT POPUP",
                    modal: true,
                    show: {
                        effect: "blind",
                        duration: 500
                    },
                    hide: {
                        effect: "explode",
                        duration: 500
                    },
                    buttons: {
                        Go: function () {
                            if ($('#ddlAgent').val() == 0) {
                                Goto = Goto.replace("*by*", "All");
                                Goto = Goto.replace("*value*", "");
                                window.location.href = Goto;
                            }
                            else {
                                Goto = Goto.replace("*by*", "Id");
                                Goto = Goto.replace("*value*", $('#ddlAgent').val());
                                window.location.href = Goto;
                            }
                        }
                    },
                    Close: function () {
                        $(this).dialog('close');
                    }
                });
            });

            $('#lnkOperator').click(function () {
                $('#ddlOperator').val('0');
                $('#txtAmount').hide();
                $('#txtAgent').hide();
                $('#txtOperator').hide();
                $('#txtSubscriber').hide();
                Goto = Goto.replace("*report*", "Operator");
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: 'Report.aspx/GetoperatorName',
                    data: "{}",
                    datatype: "json",
                    async: true,
                    success: function (data) {
                        for (var i = 0; i < data.d.length; i++) {
                            $("#ddlOperator").append("<option value='" + data.d[i].OperatorId + "'>" + data.d[i].Operatorname + "</option>");
                        }
                    },
                    error: function () {
                        alert("error")
                    }
                });
                $("#divOperator").dialog({
                    title: "OPERATOR POPUP",
                    modal: true,
                    show: {
                        effect: "blind",
                        duration: 500
                    },
                    hide: {
                        effect: "explode",
                        duration: 500
                    },

                    buttons: {
                        Go: function () {
                            if ($('#ddlOperator').val() == 0) {
                                Goto = Goto.replace("*by*", "All");
                                Goto = Goto.replace("*value*", "");
                                window.location.href = Goto;
                            }
                            else {
                                Goto = Goto.replace("*by*", "Id");
                                Goto = Goto.replace("*value*", $('#ddlOperator').val());
                                window.location.href = Goto;
                            }
                        },
                        Close: function () {
                            $(this).dialog('close');
                        }
                    }
                });
            });
            $('#lnkChit').click(function () {
                $('#ddlChit').val('-1');
                $('#txtAmount').hide();
                $('#txtAgent').hide();
                $('#txtOperator').hide();
                $('#txtSubscriber').hide();
                $('#txtMonthly').hide();
                $('#txtYearly').hide();
                $('#txtDatewise').hide();
                $('#txtStarted').hide();
                $('#txtEnded').hide();
                Goto = Goto.replace("*report*", "Chit");
                $("#divChit").dialog({
                    title: "CHIT POPUP",
                    modal: true,
                    show: {
                        effect: "blind",
                        duration: 500
                    },
                    hide: {
                        effect: "explode",
                        duration: 500
                    },
                    buttons: {
                        Go: function () {
                            if ($('#ddlChit').val() == -1) {
                                alert("Select Something first.");
                            }
                            else if ($('#ddlChit').val() == 0) {
                                Goto = Goto.replace("*by*", "ActiveChit");
                                Goto = Goto.replace("*value*", "");
                                window.location.href = Goto;
                            }


                            else if ($('#ddlChit').val() == 1) {
                                if ($('#txtAmount').val().trim() == "") {
                                    alert("Provide Amount");
                                }
                                else {
                                    var value = $('#txtAmount').val();
                                    Goto = Goto.replace("*by*", "Amount");
                                    Goto = Goto.replace("*value*", value);
                                    window.location.href = Goto;
                                }
                            } else if ($('#ddlChit').val() == 2) {
                                Goto = Goto.replace("*by*", "InActiveChit");
                                Goto = Goto.replace("*value*", "");
                                window.location.href = Goto;
                            }
                            else if ($('#ddlChit').val() == 3) {
                                if ($('#txtMonthly').val().trim() == "") {
                                    alert("Select Date First");
                                }
                                else {
                                    Goto = Goto.replace("*by*", "Monthly");
                                    Goto = Goto.replace("*value*", $('#txtMonthly').val());
                                    window.location.href = Goto;
                                }
                            }
                            else if ($('#ddlChit').val() == 4) {
                                if ($('#txtYearly').val().trim() == "") {
                                    alert("Select Year First");
                                }
                                else {
                                    Goto = Goto.replace("*by*", "Yearly");
                                    Goto = Goto.replace("*value*", $('#txtYearly').val());
                                    window.location.href = Goto;
                                }

                            }
                            else if ($('#ddlChit').val() == 5) {
                                if ($('#txtDatewise').val().trim() == "") {
                                    alert("Select Date First");
                                }
                                else {
                                    Goto = Goto.replace("*by*", "Date");
                                    Goto = Goto.replace("*value*", $('#txtDatewise').val());
                                    window.location.href = Goto;
                                }
                            }
                            else if ($('#ddlChit').val() == 6) {
                                if ($('#txtStarted').val().trim() == "") {
                                    alert("Select Date First");
                                }
                                else {
                                    Goto = Goto.replace("*by*", "Started");
                                    Goto = Goto.replace("*value*", $('#txtStarted').val());
                                    window.location.href = Goto;
                                }
                            }
                            else if ($('#ddlChit').val() == 7) {
                                if ($('#txtEnded').val().trim() == "") {
                                    alert("Select Date First");
                                }
                                else {
                                    Goto = Goto.replace("*by*", "Ended");
                                    Goto = Goto.replace("*value*", $('#txtEnded').val());
                                    window.location.href = Goto;
                                }
                            }
                        },
                        Close: function () {
                            $(this).dialog('close');
                        }
                    }
                });
            });

            $('#lnkSubscriber').click(function () {
                $('#ddlSubscriber').val('0');
                $('#txtAmount').hide();
                $('#txtAgent').hide();
                $('#txtOperator').hide();
                $('#txtSubscriber').hide();
                $('#ddlAgentWise').hide();
                $('#ddlAreaWise').hide();
                Goto = Goto.replace("*report*", "Subscriber");
                $("#divSubscriber").dialog({
                    title: "SUBSCRIBER POPUP",
                    modal: true,
                    show: {
                        effect: "blind",
                        duration: 500
                    },
                    hide: {
                        effect: "explode",
                        duration: 500
                    },
                    buttons: {
                        Go: function () {
                            if ($('#ddlSubscriber').val() == 0) {
                                Goto = Goto.replace("*by*", "All");
                                Goto = Goto.replace("*value*", "");
                                window.location.href = Goto;
                            }
                            else if ($('#ddlSubscriber').val() == 1) {
                                if ($('#txtSubscriber').val().trim() == "") {
                                    alert("Provide Subscriber Id");
                                }
                                else {
                                    Goto = Goto.replace("*by*", "SubscriberId");
                                    Goto = Goto.replace("*value*", $('#txtSubscriber').val());
                                    window.location.href = Goto;
                                }
                            }
                            else if ($('#ddlSubscriber').val() == 2) {
                                Goto = Goto.replace("*by*", "Payment Due");
                                Goto = Goto.replace("*value*", "");
                                window.location.href = Goto;
                            }
                            else if ($('#ddlSubscriber').val() == 3) {

                                Goto = Goto.replace("*by*", "AgentId");
                                Goto = Goto.replace("*value*", $('#ddlAgentWise').val());
                                window.location.href = Goto;

                            }
                            else if ($('#ddlSubscriber').val() == 4) {

                                Goto = Goto.replace("*by*", "AreaId");
                                Goto = Goto.replace("*value*", $('#ddlAreaWise').val());
                                window.location.href = Goto;

                            }
                            else {
                                $("#TEMP").dialog({ modal: true });
                            }
                        },
                        Close: function () {
                            $(this).dialog('close');
                        }
                    }
                });
            });

        });
    </script>
    <div id="divDynamic" align="center">
        <table style="align-content: center; border: solid" id="tblDynamic">
        </table>
    </div>
    <div id="TEMP">
        <h1>THIS IS TEMP POPUP</h1>
    </div>
    <div id="divAdmin">
        <label id="lblAdmin">Select Admin Id/Name</label>&nbsp;&nbsp;
        <select id="ddlAdmin">
            <option value="0" selected="selected">Show All Admins</option>
        </select>
    </div>
    <div id="divAgent">
        <label id="lblAgent">Enter Agent Id/Name</label>&nbsp;&nbsp;
        <select id="ddlAgent">
            <option value="0" selected="selected">Show All Agents</option>

        </select>
        <div align="center">
            <input type="text" placeholder="AGENT" id="txtAgent" required="required" />
        </div>
    </div>
    <div id="divOperator">
        <label id="lblOperator">Enter Operator Id/Name</label>&nbsp;&nbsp;
        <select id="ddlOperator">
            <option value="0" selected="selected">Show All Operators</option>

        </select>
        <div align="center">
            <input type="text" placeholder="OPERATOR ID" id="txtOperator" required="required" />
        </div>
    </div>
    <div id="divChit">
        <label id="lblChit">Select Chit Id/Name</label>&nbsp;&nbsp;
        <select id="ddlChit">
            <option value="-1" selected="selected">--Select--</option>
            <option value="0">Active Chits</option>
            <option value="1">Amount</option>
            <option value="2">Inactive Chits</option>
            <option value="3">Monthly Amount Collection</option>
            <option value="4">Yearly Amount Collection</option>
            <option value="5">Datewise Amount Collection</option>
            <option value="6">No. of Chits started this month/year</option>
            <option value="7">No. of Chits ended this month/year</option>
        </select>
        <div align="center">
            <input type="text" id="txtAmount" placeholder="Enter Amount" />
        </div>
        <div align="center">
            <input type="text" id="txtMonthly" placeholder="Select Date" />
        </div>
        <div align="center">
            <input type="text" id="txtYearly" placeholder="Select Year" />
        </div>
        <div align="center">
            <input type="text" id="txtDatewise" placeholder="Select Date" />
        </div>
        <div align="center">
            <input type="text" id="txtStarted" placeholder="Select Month & Year" />
        </div>
        <div align="center">
            <input type="text" id="txtEnded" placeholder="Select Month & Year" />
        </div>
    </div>
    <div id="divSubscriber">
        <label id="lblSubscriber">Enter Subscriber Id/Name</label>&nbsp;&nbsp;
        <select id="ddlSubscriber">
            <option value="0" selected="selected">Show All Subscriber</option>
            <option value="1">Enter Subscriber Id</option>
            <option value="2">Payment Due</option>
            <option value="3">Agent Wise</option>
            <option value="4">Area Wise</option>
        </select>
        <div align="center">
            <input type="text" placeholder="SUBSCRIBER" id="txtSubscriber" required="required" />
            <select id="ddlAgentWise">
            </select>
            <select id="ddlAreaWise">
            </select>
        </div>
    </div>

    <div align="center">
        <div class="”container”">
            <h1><a href="#">Nacre ChitFund Management System</a></h1>
            <div class="row" align="center">
                <div>
                    <div class="hero-unit">
                        <h1>Want to Generate Report ?</h1>
                        <p>
                            Click on particular Category to generate reports based on !!<br />
                        </p>
                        <a href="#" class="btn btn-large btn-success" id="lnkAdmin" style="width: 500px">Admin Reports</a><br />
                        <a href="#" class="btn btn-large btn-success" id="lnkAgent" style="width: 500px">Agent Reports</a><br />
                        <a href="#" class="btn btn-large btn-success" id="lnkOperator" style="width: 500px">Operator Reports</a><br />
                        <a href="#" class="btn btn-large btn-success" id="lnkChit" style="width: 500px">Chit-wise Reports</a><br />
                        <a href="#" class="btn btn-large btn-success" id="lnkSubscriber" style="width: 500px">Subscriber-wise Reports</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

