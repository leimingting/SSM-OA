<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/28
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from admindesigns.com/demos/absolute/1.1/admin_forms-validation.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 06 Aug 2015 02:56:15 GMT -->
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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

</head>

<body class="admin-validation-page" data-spy="scroll" data-target="#nav-spy" data-offset="200">

<!-- Start: Main -->
<div id="main">

    <!-- Start: Header -->
    <header class="navbar navbar-fixed-top navbar-shadow">
        <div class="navbar-branding">
            <a class="navbar-brand" href="dashboard.html">
                <b>爱慕课</b>OA
            </a>
            <span id="toggle_sidemenu_l" class="ad ad-lines"></span>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown menu-merge">
                <a href="#" class="dropdown-toggle fw600 p15" data-toggle="dropdown">
                    <img src="${pageContext.request.contextPath}/static/assets/img/avatars/5.jpg" alt="avatar"
                         class="mw30 br64">
                    <span class="hidden-xs pl15"> ${employee.name} </span>
                    <span class="caret caret-tp hidden-xs"></span>
                </a>
                <ul class="dropdown-menu list-group dropdown-persist w250" role="menu">
                    <li class="list-group-item">
                        <a href="${pageContext.request.contextPath}/go/self" target="iframeMain" class="animated animated-short fadeInUp">
                            <span class="fa fa-user"></span> 个人信息
                            <span class="label label-warning"></span>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a onclick="on_change_password_model()" class="animated animated-short fadeInUp">
                            <span class="fa fa-gear"></span> 设置密码 </a>
                    </li>
                    <li class="dropdown-footer">
                        <a href="${pageContext.request.contextPath}/quit" class="">
                            <span class="fa fa-power-off pr5"></span> 退出 </a>
                    </li>
                </ul>
            </li>
        </ul>
    </header>
    <!-- End: Header -->

    <!-- Start: Sidebar -->
    <aside id="sidebar_left" class="nano nano-light affix">

        <!-- Start: Sidebar Left Content -->
        <div class="sidebar-left-content nano-content">

            <!-- Start: Sidebar Header -->
            <header class="sidebar-header">

                <!-- Sidebar Widget - Author -->
                <div class="sidebar-widget author-widget">
                    <div class="media">
                        <a class="media-left" href="#">
                            <img src="${pageContext.request.contextPath}/static/assets/img/avatars/3.jpg"
                                 class="img-responsive">
                        </a>
                        <div class="media-body">
                            <div class="media-author">${employee.name}--${employee.post}</div>
                            <div class="media-links">
                                <a href="${pageContext.request.contextPath}/quit">退出</a>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Sidebar Widget - Search (hidden) -->
                <div class="sidebar-widget search-widget hidden">
                    <div class="input-group">
              <span class="input-group-addon">
                <i class="fa fa-search"></i>
              </span>
                        <input type="text" id="sidebar-search" class="form-control" placeholder="Search...">
                    </div>
                </div>

            </header>
            <!-- End: Sidebar Header -->

            <!-- Start: Sidebar Menu -->
            <ul class="nav sidebar-menu">
                <li class="sidebar-label pt20">日常管理</li>
                <li>
                    <a href="${pageContext.request.contextPath}/go/handleVoucherList" target="iframeMain">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">待处理报销单</span>
                        <span class="sidebar-title-tray">
                <span class="label label-xs bg-primary">New</span>
              </span>
                    </a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/go/listVoucher" target="iframeMain">
                        <span class="glyphicon glyphicon-home"></span>
                        <span class="sidebar-title">个人报销单</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/go/addVoucher" target="iframeMain">
                        <span class="fa fa-calendar"></span>
                        <span class="sidebar-title">填写报销单</span>
                    </a>
                </li>
                <li class="sidebar-label pt15">基础信息管理</li>
                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="glyphicon glyphicon-check"></span>
                        <span class="sidebar-title">员工管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li>
                            <a href="${pageContext.request.contextPath}/go/employeeList" target="iframeMain">
                                <span class="glyphicon glyphicon-calendar"></span> 所有员工 </a>
                        </li>
                        <li class="active">
                            <a href="admin_forms-validation.html">
                                <span class="glyphicon glyphicon-check"></span> 添加员工 </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="accordion-toggle" href="">
                        <span class="fa fa-columns"></span>
                        <span class="sidebar-title">部门管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li>
                            <a href="${pageContext.request.contextPath}/go/departmentList" target="iframeMain">
                                <span class="glyphicon glyphicon-calendar"></span> 所有部门 </a>
                        </li>
                        <li class="active">
                            <a href="admin_forms-validation.html">
                                <span class="glyphicon glyphicon-check"></span> 添加部门 </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- End: Sidebar Menu -->

            <!-- Start: Sidebar Collapse Button -->
            <div class="sidebar-toggle-mini">
                <a href="#">
                    <span class="fa fa-sign-out"></span>
                </a>
            </div>
            <!-- End: Sidebar Collapse Button -->

        </div>
        <!-- End: Sidebar Left Content -->

    </aside>

    <!-- Start: Content-Wrapper -->
    <section id="content_wrapper">
        <iframe name="iframeMain" id="iframeMain" src="${pageContext.request.contextPath}/go/self" style="width: 1715px"
                ; height="1000px" ;></iframe>
    </section>
    <!-- End: Content-Wrapper -->

</div>
<%--修改密码模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="change_password_model">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="change_password_form">
                    <input type="hidden" class="form-control"name="sn" value="${employee.sn}" >
                    <input type="hidden" class="form-control"  id="employee_password" value="${employee.password}" >
                    <div class="form-group">
                        <label for="old_password" class="col-sm-2 control-label">旧密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="old_password" >
                            <span id="passwordHelp" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="next_password" class="col-sm-2 control-label">新密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="next_password" name="password" >
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updatePassword()">修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End: Main -->

<!-- BEGIN: PAGE SCRIPTS -->

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
    function on_change_password_model(){
        $("#change_password_form")[0].reset();
        $('#change_password_model').modal({
            backdrop: "static"
        })
    }

    $('#old_password').change(function (){
        let employee_password=$('#employee_password').val();
        let old_password=$('#old_password').val();
        $('#passwordHelp').parent().removeClass("has-success has-error");
        if(!(employee_password==old_password)){
            $('#passwordHelp').parent().addClass("has-error");
            $('#passwordHelp').text("旧密码错误");
        }
    })

    function updatePassword(){
        let employee_password=$('#employee_password').val();
        let old_password=$('#old_password').val();
        if(!(employee_password==old_password)){
            return false;
        }
            $.ajax({
                url:"${pageContext.request.contextPath}/updatePassword",
                type:"PUT",
                data:$("#change_password_form").serialize(),
                success:function (data){
                    if (data=="OK"){
                        alert("修改成功，请重新登陆");
                        location.href="/quit";
                    }else {
                        alert("修改失败")
                    }
                }
            })
    }
</script>
</body>


</html>
