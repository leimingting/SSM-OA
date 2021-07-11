<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/7/2
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <title>爱慕课OA</title>
    <meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme"/>
    <meta name="description" content="AbsoluteAdmin - A Responsive HTML5 Admin UI Framework">
    <meta name="author" content="AbsoluteAdmin">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Theme CSS -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/assets/skin/default_skin/css/theme.css">

    <!-- Admin Forms CSS -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/assets/admin-tools/admin-forms/css/admin-forms.css">

    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/assets/img/favicon.ico">
    <style>
        .admin-form .prepend-icon .field-icon {
            top: 15px;
            left: 0;
        }
    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style>
        .container {
            width: 600px;
        }

        tr, th {
            text-align: center;
        }

        .mybtn {
            width: 65px;
        }

        #voucherItem_table, #dealRecord_table, #handler_voucherItem_table, #handler_dealRecord_table tr {
            font-size: 10px;
        }
    </style>
</head>
<body>
<section id="content" class="table-layout animated fadeIn">

    <!-- begin: .tray-center -->
    <div class="tray tray-center">

        <!-- Begin: Content Header -->
        <div class="content-header">
            <h2> 待处理报销单</h2>
            <p class="lead"></p>
        </div>
        <!-- message listing panel -->
        <div class="admin-form theme-primary mw1000 center-block">
            <div class="panel  heading-border">

                <!-- message toolbar header -->
                <div class="panel-menu">
                    <div class="row">
                        <div class="hidden-xs hidden-sm col-md-3">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-refresh"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-trash"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-plus" onclick="javascript:window.location.href='add.html';"></i>
                                </button>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-9 text-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default light" id="previousPage">
                                    <i class="fa fa-chevron-left"></i>
                                </button>
                                <button type="button" class="btn btn-default light" id="nextPage">
                                    <i class="fa fa-chevron-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- message listings table -->
                <div class="panel-body pn">
                    <table id="claimVoucherInfo_table" class="table admin-form theme-warning tc-checkbox-1">
                        <thead>
                        <tr class="">
                            <th class="text-center hidden-xs">Select</th>
                            <th class="hidden-xs">事由</th>
                            <th>状态</th>
                            <th class="hidden-xs">创建人</th>
                            <th class="hidden-xs">金额</th>
                            <th class="text-center">创建时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>

            </div>
            <!-- end: .admin-form -->
        </div>
    </div>
    <!-- end: .tray-center -->
</section>
<%--查看待处理报销单--%>
<div class="modal fade" tabindex="-1" role="dialog" id="select_claimVoucherInfo">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">处理报销单</h4>
            </div>
            <div class="tray tray-center">

                <!-- Validation Example -->
                <div class="admin-form theme-primary mw1000 center-block">

                    <div class="panel heading-border">

                        <form id="select_claimVoucherInfo_from">

                            <div class="panel-body bg-light">

                                <div class="section-divider mt20 mb40">
                                    <span> 基本信息 </span>
                                </div>


                                <div class="section row">
                                    <div class="col-md-2">报销事由</div>
                                    <div class="col-md-9" id="cause"></div>
                                </div>
                                <div class="section row">
                                    <div class="col-md-2">报销人</div>
                                    <div class="col-md-4" id="employeeName"></div>
                                    <div class="col-md-2">创建时间</div>
                                    <div class="col-md-4" id="createTime"></div>
                                </div>
                                <div class="section row">
                                    <div class="col-md-2">总金额</div>
                                    <div class="col-md-4" id="totalAmount"></div>
                                    <div class="col-md-2">状态</div>
                                    <div class="col-md-4" id="status"></div>

                                    <div class="section-divider mv40">
                                        <span> 报销明细 </span>
                                    </div>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-9">
                                                <table class="table" id="voucherItem_table">
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="section-divider mv40">
                                        <span> 审核记录 </span>
                                    </div>

                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-9">
                                                <table class="table" id="dealRecord_table">
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
                <!-- end: .admin-form -->

            </div>
            <!-- end: .tray-center -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<%--处理报销单--%>
<div class="modal fade" tabindex="-1" role="dialog" id="handler_claimVoucherInfo">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">处理报销单</h4>
            </div>
            <div class="tray tray-center">

                <!-- Validation Example -->
                <div class="admin-form theme-primary mw1000 center-block">

                    <div class="panel heading-border">

                        <form id="handler_claimVoucherInfo_from">

                            <div class="panel-body bg-light">

                                <div class="section-divider mt20 mb40">
                                    <span> 基本信息 </span>
                                </div>


                                <div class="section row">
                                    <div class="col-md-2">报销事由</div>
                                    <div class="col-md-9" id="handler_cause"></div>
                                </div>
                                <div class="section row">
                                    <div class="col-md-2">报销人</div>
                                    <div class="col-md-4" id="handler_employeeName"></div>
                                    <div class="col-md-2">创建时间</div>
                                    <div class="col-md-4" id="handler_createTime"></div>
                                </div>
                                <div class="section row">
                                    <div class="col-md-2">总金额</div>
                                    <div class="col-md-4" id="handler_totalAmount"></div>
                                    <div class="col-md-2">状态</div>
                                    <div class="col-md-4" id="handler_status"></div>

                                    <div class="section-divider mv40">
                                        <span> 报销明细 </span>
                                    </div>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-9">
                                                <table class="table" id="handler_voucherItem_table">
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="section-divider mv40">
                                        <span> 审核记录 </span>
                                    </div>

                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-9">
                                                <table class="table" id="handler_dealRecord_table">
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="section-divider mv40">
                                        <span> 备注 </span>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <input type="email" class="form-control" id="comment" placeholder="备注">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
                <!-- end: .admin-form -->

            </div>
            <!-- end: .tray-center -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="pass"> 通过</button>
                <button type="button" class="btn btn-primary" id="back"> 打回</button>
                <button type="button" class="btn btn-primary" id="reject"> 拒绝</button>
                <button type="button" class="btn btn-info" data-dismiss="modal">返回</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- End: Content -->
<!-- End: Content-Wrapper -->
<style>
    /* demo page styles */
    body {
        min-height: 2300px;
    }

    .content-header b,
    .admin-form .panel.heading-border:before,
    .admin-form .panel .heading-border:before {
        transition: all 0.7s ease;
    }

    /* responsive demo styles */
    @media (max-width: 800px) {
        .admin-form .panel-body {
            padding: 18px 12px;
        }
    }
</style>

<style>
    .ui-datepicker select.ui-datepicker-month,
    .ui-datepicker select.ui-datepicker-year {
        width: 48%;
        margin-top: 0;
        margin-bottom: 0;

        line-height: 25px;
        text-indent: 3px;

        color: #888;
        border-color: #DDD;
        background-color: #FDFDFD;

        -webkit-appearance: none; /*Optionally disable dropdown arrow*/
    }
</style>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/static/vendor/jquery/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/vendor/jquery/jquery_ui/jquery-ui.min.js"></script>

<!-- jQuery Validate Plugin-->
<script src="${pageContext.request.contextPath}/static/assets/admin-tools/admin-forms/js/jquery.validate.min.js"></script>

<!-- jQuery Validate Addon -->
<script src="${pageContext.request.contextPath}/static/assets/admin-tools/admin-forms/js/additional-methods.min.js"></script>

<!-- AdminForms JS -->
<script src="${pageContext.request.contextPath}/static/assets/admin-tools/admin-forms/js/jquery-ui-datepicker.min.js"></script>

<!-- Theme Javascript -->
<script src="${pageContext.request.contextPath}/static/assets/js/utility/utility.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/demo/demo.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/main.js"></script>
<!-- END: PAGE SCRIPTS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/pages.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/items.js"></script>
<!-- END: PAGE SCRIPTS -->

<script>
    let pageNum, pages;
    let comment, text, totalAmount;
    let post = "${employee.post}";
    $(function () {
        select_handle_claimVoucher_info(1);
    })

    function select_handle_claimVoucher_info(pn) {
        $.ajax({
            url: "${pageContext.request.contextPath}/claimVoucher/selectHandlerClaimVoucherInfo",
            type: "GET",
            data: "pn=" + pn,
            success: function (data) {
                console.log(data);
                build_claimVoucher_table(data);
                pageNum = data.pageNum;
                pages = data.pages;
            }
        })
    }

    /**
     *下一页
     */
    $('#nextPage').click(function () {
        if (pageNum == pages) {
            select_handle_claimVoucher_info(pages);
        } else {
            select_handle_claimVoucher_info(pageNum + 1);
        }
    })

    /**
     *上一页
     */
    $('#previousPage').click(function () {
        if (pageNum == 1) {
            select_handle_claimVoucher_info(1);
        } else {
            select_handle_claimVoucher_info(pageNum - 1);
        }
    })

    /**
     * 解析报销单信息并显示在表格中
     */
    function build_claimVoucher_table(data) {
        $("#claimVoucherInfo_table tbody").empty();
        let departmentInfo = data.list;
        $.each(departmentInfo, function (index, item) {
            let checkBoxTd = $("<td class='hidden-xs'> <label class='option block mn'> <input type='checkbox' name='mobileos' value='FR'> <span class='checkbox mn'></span> </label> </td>")
            let causeTd = $("<td></td>").append(item.cause);
            let statusTd = $("<td></td>").append($("<span></span>").append(item.status).addClass("badge badge-warning mr10 fs11"));
            let nameTd = $("<td></td>").append(item.createEmployee.name);
            let totalAmountTd = $("<td></td>").append(item.totalAmount);
            let createTimeTd = $("<td></td>").append(item.createTime);
            let subBtn;
            if (post == "总经理" || post == "部门经理") {
                subBtn = $("<button></button>").addClass("btn btn-primary  btn-sm handle_btn mybtn").append("审 核");
                subBtn.attr("sub_id", item.id);
            } else if (post == "财务") {
                subBtn = $("<button></button>").addClass("btn btn-primary  btn-sm determine_btn mybtn").append("打 款");
                subBtn.attr("sub_id", item.id);
            } else {
                subBtn = $("<button></button>").addClass("btn btn-primary  btn-sm sub_btn mybtn").append("提 交");
                subBtn.attr("sub_id", item.id);
                if (item.status != "未提交" && item.status != "已打回") {
                    subBtn.text("已提交");
                    subBtn.addClass("disabled");
                }
            }

            let deleteBtn = $("<button></button>").addClass("btn btn-success btn-sm select_btn mybtn").append("查 看");
            deleteBtn.attr("select_btn", item.id);
            let btnTd = $("<td></td>").append(subBtn).append(" ").append(deleteBtn);
            $("<tr></tr>").addClass("message-unread")
                .append(checkBoxTd)
                .append(causeTd)
                .append(statusTd)
                .append(nameTd)
                .append(totalAmountTd)
                .append(createTimeTd)
                .append(btnTd)
                .appendTo("#claimVoucherInfo_table tbody");
        })
    }

    /**
     * 根据id查询报销单信息
     * @param id
     */
    function selByIdClaimVoucher(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/claimVoucher/selById/" + id,
            type: "GET",
            success: function (data) {
                console.log(data);
                build_claimVoucher_info(data);
                build_voucherItem_table(data);
                build_dealRecord_table(data);
            }
        })
    }

    /**
     * 解析报销单信息
     * @param data
     */
    function build_claimVoucher_info(data) {
        $('#cause').text("");
        $('#employeeName').text("");
        $('#createTime').text("");
        $('#totalAmount').text("");
        $('#status').text("");

        $('#cause').append(data.cause);
        $('#employeeName').append(data.createEmployee.name);
        $('#createTime').append(data.createTime);
        $('#totalAmount').append(data.totalAmount);
        $('#status').append(data.status);
    }

    /**
     * 解析报销单详细信息
     * @param data
     */
    function build_voucherItem_table(data) {
        $("#voucherItem_table tbody").empty();
        let voucherItemInfo = data.items;
        $.each(voucherItemInfo, function (index, item) {
            let itemTd = $('<td></td>').append(item.item);
            let amountTd = $('<td></td>').append(item.amount);
            let commentTd = $('<td></td>').append(item.comment);
            $('<tr></tr>').append(itemTd).append(amountTd).append(commentTd).appendTo("#voucherItem_table tbody")
        })
    }

    /**
     * 解析处理报销单信息
     * @param data
     */
    function build_dealRecord_table(data) {
        $("#dealRecord_table tbody").empty();
        let dealRecordInfo = data.dealRecords;
        $.each(dealRecordInfo, function (index, item) {
            let dealTimeTd = $('<td></td>').append(item.dealTime);
            let dealSnTd = $('<td></td>').append(item.dealSn);
            let dealWayTd = $('<td></td>').append(item.dealWay);
            let commentTd = $('<td></td>').append(item.comment);
            $('<tr></tr>').append(dealTimeTd).append(dealSnTd).append(dealWayTd).append(commentTd).appendTo("#dealRecord_table tbody")
        })
    }

    /**
     * 打开查询报销单详情模态框
     */
    $(document).on('click', '.select_btn', function () {
        let id = $(this).attr("select_btn");
        selByIdClaimVoucher(id)
        $('#select_claimVoucherInfo').modal({
            backdrop: "static"
        })
    })
    /**
     * 提交报销单详情
     */
    $(document).on('click', '.sub_btn', function () {
        text = "提交";
        comment = "无";
        let id = $(this).attr("sub_id");
        totalAmount = 0;
        if (confirm("是否提交")) {
            $.ajax({
                url: "${pageContext.request.contextPath}/claimVoucher/dealClaimVoucherInfo/" + id + "/" + totalAmount + "/" + comment + "/" + text,
                type: "PUT",
                success: function (data) {
                    if (data == "OK") {
                        alert("提交成功");
                        select_handle_claimVoucher_info(1);

                    } else {
                        alert("提交失败")
                        select_handle_claimVoucher_info(1);
                    }
                }
            })
        }
    })

    /**
     * 打开处理报销单模态框
     */
    $(document).on('click', '.handle_btn', function () {
        let id = $(this).attr("sub_id");
        $("#pass").attr("sub_id", id);
        $("#back").attr("sub_id", id);
        $("#reject").attr("sub_id", id);

        handle_ClaimVoucherInfo(id);
        $('#handler_claimVoucherInfo').modal({
            backdrop: "static"
        })
    })

    function handle_ClaimVoucherInfo(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/claimVoucher/selById/" + id,
            type: "GET",
            success: function (data) {
                build_handle_claimVoucher_info(data);
                build_handle_voucherItem_table(data);
                build_handle_dealRecord_table(data)
            }
        })
    }

    /**
     * 解析报销单信息
     * @param data
     */
    function build_handle_claimVoucher_info(data) {
        $('#handler_cause').text("");
        $('#handler_employeeName').text("");
        $('#handler_createTime').text("");
        $('#handler_totalAmount').text("");
        $('#handler_status').text("");

        $('#handler_cause').append(data.cause);
        $('#handler_employeeName').append(data.createEmployee.name);
        $('#handler_createTime').append(data.createTime);
        $('#handler_totalAmount').append(data.totalAmount);
        $('#handler_status').append(data.status);
    }

    /**
     * 解析报销单详细信息
     * @param data
     */
    function build_handle_voucherItem_table(data) {
        $("#handler_voucherItem_table tbody").empty();
        let voucherItemInfo = data.items;
        $.each(voucherItemInfo, function (index, item) {
            let itemTd = $('<td></td>').append(item.item);
            let amountTd = $('<td></td>').append(item.amount);
            let commentTd = $('<td></td>').append(item.comment);
            $('<tr></tr>').append(itemTd).append(amountTd).append(commentTd).appendTo("#handler_voucherItem_table tbody")
        })
    }

    /**
     * 解析处理报销单信息
     * @param data
     */
    function build_handle_dealRecord_table(data) {
        $("#handler_dealRecord_table tbody").empty();
        let dealRecordInfo = data.dealRecords;
        $.each(dealRecordInfo, function (index, item) {
            let dealTimeTd = $('<td></td>').append(item.dealTime);
            let dealSnTd = $('<td></td>').append(item.dealSn);
            let dealWayTd = $('<td></td>').append(item.dealWay);
            let commentTd = $('<td></td>').append(item.comment);
            $('<tr></tr>').append(dealTimeTd).append(dealSnTd).append(dealWayTd).append(commentTd).appendTo("#handler_dealRecord_table tbody")
        })
    }

    /**
     * 报销单信息通过审核
     */
    $('#pass').click(function () {
        let id = $(this).attr("sub_id");
        text = "通过";
        comment = $("#comment").val();
        if (comment == "") {
            comment = "无";
        }
        totalAmount = $("#handler_totalAmount").text();
        $.ajax({
            url: "${pageContext.request.contextPath}/claimVoucher/dealClaimVoucherInfo/" + id + "/" + totalAmount + "/" + comment + "/" + text,
            type: "PUT",
            success: function (data) {
                if (data == "OK") {
                    alert("提交成功");
                    select_handle_claimVoucher_info(1);
                    $('#handler_claimVoucherInfo').modal('toggle');
                } else {
                    alert("提交失败");
                    select_handle_claimVoucher_info(1);

                    $('#handler_claimVoucherInfo').modal('toggle');

                }
            }
        })
    })
    /**
     * 报销单信息被打回
     */
    $('#back').click(function () {
        let id = $(this).attr("sub_id");
        text = "打回";
        comment = $("#comment").val();
        if (comment == "") {
            comment = "无";
        }
        totalAmount = $("#handler_totalAmount").text();
        $.ajax({
            url: "${pageContext.request.contextPath}/claimVoucher/dealClaimVoucherInfo/" + id + "/" + totalAmount + "/" + comment + "/" + text,
            type: "PUT",
            success: function (data) {
                if (data == "OK") {
                    alert("提交成功");
                    select_handle_claimVoucher_info(1);
                    $('#handler_claimVoucherInfo').modal('toggle');
                } else {
                    alert("提交失败");
                    select_handle_claimVoucher_info(1);
                    $('#handler_claimVoucherInfo').modal('toggle');
                }
            }
        })
    })
    /**
     * 报销单信息被拒绝
     */
    $('#reject').click(function () {
        let id = $(this).attr("sub_id");
        text = "拒绝";
        comment = $("#comment").val();
        if (comment == "") {
            comment = "无";
        }
        totalAmount = $("#handler_totalAmount").text();
        $.ajax({
            url: "${pageContext.request.contextPath}/claimVoucher/dealClaimVoucherInfo/" + id + "/" + totalAmount + "/" + comment + "/" + text,
            type: "PUT",
            success: function (data) {
                if (data == "OK") {
                    alert("提交成功");
                    select_handle_claimVoucher_info(1);
                    $('#handler_claimVoucherInfo').modal('toggle');
                } else {
                    alert("提交失败");
                    select_handle_claimVoucher_info(1);
                    $('#handler_claimVoucherInfo').modal('toggle');
                }
            }
        })
    })

    /**
     * 打款
     */
    $(document).on('click', '.determine_btn', function () {
        let id = $(this).attr("sub_id");
        text = "打款";
        comment = $("#comment").val();
        if (comment == "") {
            comment = "无";
        }
        totalAmount = 0;
        if (confirm("是否打款")) {
            $.ajax({
                url: "${pageContext.request.contextPath}/claimVoucher/dealClaimVoucherInfo/" + id + "/" + totalAmount + "/" + comment + "/" + text,
                type: "PUT",
                success: function (data) {
                    if (data == "OK") {
                        alert("打款成功");
                        select_handle_claimVoucher_info(1);
                    } else {
                        alert("打款失败");
                        select_handle_claimVoucher_info(1);
                    }
                }
            })
        }
    })
</script>
</body>
</html>
