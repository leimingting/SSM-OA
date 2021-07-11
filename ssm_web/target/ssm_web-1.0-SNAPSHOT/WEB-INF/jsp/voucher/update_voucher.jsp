<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/30
  Time: 17:17
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
</head>
<body>
<!-- Start: Content-Wrapper -->
<!-- Begin: Content -->
<!-- Begin: Content -->
<!-- Begin: Content -->
<section id="content" class="table-layout animated fadeIn">

    <!-- begin: .tray-center -->
    <div class="tray tray-center">

        <!-- Begin: Content Header -->
        <div class="content-header">
            <h2> 修改报销单</h2>
            <p class="lead"></p>
        </div>

        <!-- Validation Example -->
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">

            <div class="panel heading-border">

                <form id="update_claimVoucherInfo_form">
                    <input type="hidden" value="${claimVoucherInfo.id}" name="id">

                    <div class="panel-body bg-light">

                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <!-- .section-divider -->


                        <div class="section">
                            <label for="cause" class="field prepend-icon">
                                <input type="text" name="cause" id="cause" class="gui-input" placeholder="报销事由"
                                       value="${claimVoucherInfo.cause}">
                                <label for="cause" class="field-icon">
                                    <i class="fa fa-envelope"></i>
                                </label>
                            </label>

                        </div>

                        <div class="section-divider mv40">
                            <span> 报销明细 </span>
                        </div>
                        <!-- .section-divider -->
                        <div class="section row" id="items">
                            <c:forEach items="${claimVoucherInfo.items}" varStatus="stf" var="item">
                                <div>
                                    <div class="col-md-3">
                                        <label class="field select">
                                            <input type="hidden" name="items[${stf.index}].id" value="${item.id}">
                                            <select id="language" name="item">
                                                <option value="">花销类型...</option>
                                                <option value="交通" <c:if test="${item.item=='交通'}">selected</c:if>>交通
                                                </option>
                                                <option value="住宿" <c:if test="${item.item=='住宿'}">selected</c:if>>住宿
                                                </option>
                                                <option value="会议" <c:if test="${item.item=='会议'}">selected</c:if>>会议
                                                </option>
                                                <option value="其他" <c:if test="${item.item=='其他'}">selected</c:if>>其他
                                                </option>
                                            </select>
                                            <i class="arrow double"></i>
                                        </label>
                                    </div>
                                    <!-- end section -->
                                    <div class="col-md-3">
                                        <label class="field prepend-icon">
                                            <input type="text" name="amount" class="gui-input money" placeholder="金额..."
                                                   value="${item.amount}">
                                            <label class="field-icon">
                                                <i class="fa fa-user"></i>
                                            </label>
                                        </label>
                                    </div>
                                    <!-- end section -->
                                    <div class="col-md-5">
                                        <label class="field prepend-icon">
                                            <input type="text" name="cause" class="gui-input" placeholder="备注"
                                                   value="${item.comment}">
                                            <label for="cause" class="field-icon">
                                                <i class="fa fa-envelope"></i>
                                            </label>
                                        </label>
                                    </div>
                                    <!-- end section -->
                                    <div class="col-md-1" style="text-align:right;">
                                        <button type="button" class="button"> X</button>
                                    </div>
                                    <!-- end section -->
                                </div>
                            </c:forEach>
                        </div>
                        <!-- end .section row section -->
                        <div class="section row">
                            <div class="col-md-3">
                                <label class="field prepend-icon">
                                    <input type="text" name="totalAmount" id="totalAmount" class="gui-input"
                                           placeholder="总金额..." value="${claimVoucherInfo.totalAmount}">
                                    <label for="totalAmount" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <!-- end section -->
                            <div class="section" style="text-align:right;">
                                <div class="col-md-9">
                                    <button type="button" class="button" id="addItemButton"> +</button>
                                </div>
                            </div>
                            <!-- end section -->
                        </div>
                        <!-- end section -->
                        <!-- end .form-body section -->
                        <div class="panel-footer text-right">
                            <button type="button" class="button" onclick="updateClaimVoucherInfo()">修改</button>
                            <button type="button" class="button"
                                    onclick="javascript:window.location.href='${pageContext.request.contextPath}/go/handleVoucherList';">
                                返回
                            </button>
                        </div>
                        <!-- end .form-footer section -->
                    </div>
                </form>

            </div>

        </div>
        <!-- end: .admin-form -->

    </div>
    <!-- end: .tray-center -->
</section>
<!-- End: Content -->
<!-- End: Content -->
<!-- End: Content -->
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
    function updateClaimVoucherInfo() {
        $.ajax({
            url: "${pageContext.request.contextPath}/claimVoucher/updateVoucher",
            type: "PUT",
            data: $('#update_claimVoucherInfo_form').serialize(),
            success: function (data) {
                if (data == 'OK') {
                    alert("修改成功")
                    window.location.href = "${pageContext.request.contextPath}/go/handleVoucherList";
                } else {
                    alert("修改失败")
                }
            }
        })
    }
</script>

</body>
</html>
