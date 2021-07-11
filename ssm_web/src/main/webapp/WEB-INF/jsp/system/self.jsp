<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/30
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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

    <link href="${pageContext.request.contextPath}/static/bootstrap-3.4.1-dist/css/bootstrap.css">
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style>
        body {
            font-size: 15px;
        }

        .form-horizontal .control-label {
            color: #00a2cd;
        }
    </style>
</head>
<body class="admin-validation-page" data-spy="scroll" data-target="#nav-spy" data-offset="200">
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">

        <!-- Begin: Content Header -->
        <div class="content-header">
            <h2> 个人信息</h2>
            <p class="lead"></p>
        </div>

        <!-- Validation Example -->
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">

            <div class="panel heading-border">
                <div class="panel-body bg-light">

                    <div class="section-divider  mt20 mb40">
                        <span> 基本信息 </span>
                    </div>
                    <form class="form-horizontal" style="width: 800px;text-align: center" id="info_form">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">工号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" value="${employee.sn}" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" value="${employee.name}" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" value="${employee.departmentSn}" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">职务</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" value="${employee.post}" readonly>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
        <!-- end: .admin-form -->
    </div>
</section>
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
</body>
</html>
