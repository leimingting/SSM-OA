<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/28
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<!-- Mirrored from admindesigns.com/demos/absolute/1.1/pages_login.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 06 Aug 2015 02:55:38 GMT -->
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <title>欢迎使用爱慕课OA</title>
    <meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme"/>
    <meta name="description" content="AbsoluteAdmin - A Responsive HTML5 Admin UI Framework">
    <meta name="author" content="AbsoluteAdmin">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Theme CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/assets/skin/default_skin/css/theme.css">

    <!-- Admin Forms CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/assets/admin-tools/admin-forms/css/admin-forms.css">

    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/assets/img/favicon.ico">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body class="external-page external-alt sb-l-c sb-r-c">

<!-- Start: Main -->
<div id="main" class="animated fadeIn">

    <!-- Start: Content-Wrapper -->
    <section id="content_wrapper">

        <!-- Begin: Content -->
        <section id="content">

            <div class="admin-form theme-info mw500" id="login">

                <!-- Login Logo -->
                <div class="content-header">
                    <h1> 爱慕课OA</h1>
                    <p class="lead">欢迎使用爱慕课自动化管理系统</p>
                </div>
                <!-- Login Panel/Form -->
                <div class="panel mt30 mb25">

                    <form method="post"  id="contact">
                        <div class="panel-body bg-light p25 pb15">
                            <!-- Username Input -->
                            <div class="section ">
                                <label for="username" class="field-label text-muted fs18 mb10">工号</label>
                                <label for="username" class="field prepend-icon">
                                    <input type="text" name="sn" id="username" class="gui-input"
                                           placeholder="请输入工号...">
                                    <label for="username" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                    <span id="snCheck" class="help-block"></span>
                                </label>
                            </div>

                            <!-- Password Input -->
                            <div class="section">
                                <label for="username" class="field-label text-muted fs18 mb10">密码</label>
                                <label for="password" class="field prepend-icon">
                                    <input type="password" name="password" id="password" class="gui-input"
                                           placeholder="请输入密码...">
                                    <label for="password" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                    <span id="passwordCheck" class="help-block"></span>
                                </label>
                            </div>
                            <div class="section">
                                <label for="username" class="field-label text-muted fs18 mb10">验证码</label>
                                <label for="password" class="field prepend-icon">
                                    <input type="text" name="verification" id="verification" class="gui-input" style="width: 150px">
                                    <img id="num" src="${pageContext.request.contextPath}/go/getImage"/>
                                    <a href="javascript:;" onclick="document.getElementById('num').src = '${pageContext.request.contextPath}/go/getImage?'+(new Date()).getTime()">换一张</a>
                                    <span id="verificationCheck" class="help-block"></span>
                                </label>
                            </div>
                        </div>

                        <div class="panel-footer clearfix">
                            <button type="button" class="button btn-primary mr10 pull-right" id="loginBtn">登陆</button>
                            <label class="switch ib switch-primary mt10">
                                <input type="checkbox" name="remember" id="remember" checked>
                                <label for="remember" data-on="是" data-off="否"></label>
                                <span>记住我</span>
                            </label>
                        </div>

                    </form>
                </div>


            </div>

        </section>
        <!-- End: Content -->

    </section>
    <!-- End: Content-Wrapper -->

</div>
<!-- End: Main -->


<!-- BEGIN: PAGE SCRIPTS -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/static/vendor/jquery/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/vendor/jquery/jquery_ui/jquery-ui.min.js"></script>

<!-- Theme Javascript -->
<script src="${pageContext.request.contextPath}/static/assets/js/utility/utility.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/demo/demo.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/main.js"></script>

<!-- END: PAGE SCRIPTS -->

<script>
    $('#password').focus(function (){
        $('#passwordCheck').text("")
    });
    $('#verification').focus(function (){
        $('#verificationCheck').text("")
    });
    $('#username').change(function (){
        let sn=this.value;
        $.ajax({
            url:"${pageContext.request.contextPath}/employee/selectBySnCheck/"+sn,
            type:"GET",
            success:function (data){
                $('#snCheck').parent().removeClass("has-success has-error");
                if (data=='OK'){
                    $('#snCheck').parent().addClass("has-success");
                    $('#snCheck').text("");
                }else {
                    $('#snCheck').parent().addClass("has-error");
                    $('#snCheck').text("工号不存在");
                }
            }
        })
    })

    $('#loginBtn').click(function (){
        $.ajax({
            url:"${pageContext.request.contextPath}/login",
            type:"POST",
            data:$('#contact').serialize(),
            success:function (data){
                $('#passwordCheck').parent().removeClass("has-success has-error");
                $('#verificationCheck').parent().removeClass("has-success has-error");
                console.log(data)
                if (data=="code error"){
                    $('#verificationCheck').parent().addClass("has-error");
                    $('#verificationCheck').text("验证码错误");
                    document.getElementById('num').src = '${pageContext.request.contextPath}/go/getImage?'+(new Date()).getTime();
                }
                if (data=="OK"){
                    $.get(
                        window.location.replace("${pageContext.request.contextPath}/go/index")
                    )
                }else if (data=="FALL"){
                    $('#passwordCheck').parent().addClass("has-error");
                    $('#passwordCheck').text("工号或密码错误")
                }
            }
        })
    })
</script>

</body>


<!-- Mirrored from admindesigns.com/demos/absolute/1.1/pages_login.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 06 Aug 2015 02:55:42 GMT -->
</html>
