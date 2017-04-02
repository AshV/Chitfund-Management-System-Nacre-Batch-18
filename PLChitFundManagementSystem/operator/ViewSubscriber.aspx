<%@ Page Title="" Language="C#" MasterPageFile="~/ChitFund.master" AutoEventWireup="true" CodeFile="ViewSubscriber.aspx.cs" Inherits="_ViewSubscriber" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
   <%-- <link href="../css/View.css" rel="stylesheet" />
    <link href="../css/ViewCustomer.css" rel="stylesheet" />
   --%> <link href="../css/table.css" rel="stylesheet" />
    <script src="../JS/jquery-1.4.3.min.js"></script>
    <link href="../css/Styles/style.css" rel="stylesheet" />
    <link href="../css/Styles/style-responsive.css" rel="stylesheet" />
    <script src="../JS/jquery.tablesorter.min.js"></script>

    <style>
        /*th {
            cursor: pointer;
            color: Black;
            font-weight: bold;
            width: 200px;
            background-color: aqua;
            text-align: center;
            height: 30px;
        }
            th.headerSortUp {
                background-image: url(images/ah2wt.png);
                background-position: right center;
                background-repeat: no-repeat;
            }
            th.headerSortDown {
                background-image: url(images/sort-arrow-down.gif);
                background-position: right center;
                background-repeat: no-repeat;
            }
        .tdclass {
            border-bottom: solid 1px #dadada;
            background-color: lemonchiffon;
            width:250px;
            height:30px;
        }*/
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: 'ViewSubscriber.aspx/GetAddress',
                data: "{}",
                datatype: "json",
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        $('#DropDownList1').append('<option value=' + data.d[i].AddressId + '>' + data.d[i].Area + '</option>');
                    }
                },
                error: function () {
                    alert("error");
                }
            });
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: 'ViewSubscriber.aspx/GetAgent',
                data: "{}",
                datatype: "json",
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        $('#DropDownList2').append('<option value=' + data.d[i].UserId + '>' + data.d[i].FirstName + '</option>');
                    }
                },
                error: function () {
                    alert("error");
                }
            });
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: 'ViewSubscriber.aspx/GetChit',
                data: "{}",
                datatype: "json",
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        $('#DropDownList3').append('<option value=' + data.d[i].ChitId + '>' + data.d[i].ChitName + '</option>');
                    }
                },
                error: function () {
                    alert("error");
                }
            });

            $('select').change(function () {
                $('select').not("#" + this.id).val(0);
                $("[id*=GridView1] tr").not($("#tr1")).remove();
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: 'ViewSubscriber.aspx/GetData',
                    data: "{'id':'" + this.value + "','type':'" + this.id + "'}",
                    datatype: "json",
                    async: false,
                    success: function (data) {
                        for (var i = 0; i < data.d.length; i++) {
                            $('#GridView1').append("<tr><td class='tdclass'>" + data.d[i].CustomerId + "</td><td class='tdclass'>" + data.d[i].CustomerName + "</td><td class='tdclass'>" + data.d[i].DOB + "</td><td class='tdclass'>" + data.d[i].DOJ + "</td><td class='tdclass'>" + data.d[i].MobileNo + "</td><td class='tdclass'>" + data.d[i].EmailId + "</td></tr>");
                        }
                    },
                    error: function () {
                        alert("error")
                    }
                });
            });
            $('table').tablesorter();
        });
    </script>
    <div class="page-container" id="Panel1" style="margin-top: 50px; text-align: center">
         
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption"><i class="icon-home"></i>Subscriber List</div>
            </div>
            <div class="portlet-body flip-scroll">
                <section class="">
                    <div id="view" style="width: 800px; margin: 0 auto;">
                        <div class="dropdown" align="left">
                            <select id="DropDownList1" class="dropdown-select">
                                <option value="0">select Area</option>
                            </select>
                             
                            <select id="DropDownList2" class="dropdown-select">
                                <option value="0">select Agent</option>
                            </select>
                             <select id="DropDownList3" class="dropdown-select">
                                <option value="0">select Chit</option>
                            </select>

                        </div>
                       
                </section>

                <table id="GridView1" class="zebra">
                    <tr id="tr1">
                        <th>Id</th>
                        <th>Name</th>
                        <th>Date Of Birth</th>
                        <th>Date Of Join</th>
                        <th>Mobile No</th>
                        <th>EmailId</th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>


