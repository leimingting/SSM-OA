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
  <meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme" />
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

<body class="admin-validation-page" data-spy="scroll" data-target="#nav-spy" data-offset="200">

  <!-- Begin: Content -->
  <section id="content" class="table-layout animated fadeIn">

    <!-- begin: .tray-center -->
    <div class="tray tray-center">

      <!-- Begin: Content Header -->
      <div class="content-header">
        <h2> 个人报销单</h2>
        <p class="lead"></p>
      </div>
      <!-- message listing panel -->
      <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
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
                  <button type="button" class="btn btn-default light">
                    <i class="fa fa-chevron-left"></i>
                  </button>
                  <button type="button" class="btn btn-default light">
                    <i class="fa fa-chevron-right"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
          <!-- message listings table -->
          <div class="panel-body pn">
            <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
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
              <tr class="message-unread">
                <td class="hidden-xs">
                  <label class="option block mn">
                    <input type="checkbox" name="mobileos" value="FR">
                    <span class="checkbox mn"></span>
                  </label>
                </td>
                <td class="">XX支行瓢饮系统开发出差</td>
                <td class="hidden-xs">
                  <span class="badge badge-warning mr10 fs11"> 待审核 </span>
                </td>
                <td class="">张三</td>
                <td class="">￥1000.00</td>
                <td class="text-center fw600">2000-9-9 9:20</td>
                <td>
                  <a href="add.html">修改</a>
                  <a href="info.html">查看</a>
                </td>
              </tr>
              <tr class="message-unread">
                <td class="hidden-xs">
                  <label class="option block mn">
                    <input type="checkbox" name="mobileos" value="FR">
                    <span class="checkbox mn"></span>
                  </label>
                </td>
                <td class="">XX支行瓢饮系统开发出差</td>
                <td class="hidden-xs">
                  <span class="badge badge-warning mr10 fs11"> 待审核 </span>
                </td>
                <td class="">张三</td>
                <td class="">￥1000.00</td>
                <td class="text-center fw600">2000-9-9 9:20</td>
                <td>
                  <a href="#">修改</a>
                  <a href="#">查看</a>
                </td>
              </tr>
              <tr class="message-unread">
                <td class="hidden-xs">
                  <label class="option block mn">
                    <input type="checkbox" name="mobileos" value="FR">
                    <span class="checkbox mn"></span>
                  </label>
                </td>
                <td class="">XX支行瓢饮系统开发出差</td>
                <td class="hidden-xs">
                  <span class="badge badge-warning mr10 fs11"> 待审核 </span>
                </td>
                <td class="">张三</td>
                <td class="">￥1000.00</td>
                <td class="text-center fw600">2000-9-9 9:20</td>
                <td>
                  <a href="#">修改</a>
                  <a href="#">查看</a>
                </td>
              </tr>
<%--              <tr class="message-unread">--%>
<%--                <td class="hidden-xs">--%>
<%--                  <label class="option block mn">--%>
<%--                    <input type="checkbox" name="mobileos" value="FR">--%>
<%--                    <span class="checkbox mn"></span>--%>
<%--                  </label>--%>
<%--                </td>--%>
<%--                <td class="">XX支行瓢饮系统开发出差</td>--%>
<%--                <td class="hidden-xs">--%>
<%--                  <span class="badge badge-warning mr10 fs11"> 待审核 </span>--%>
<%--                </td>--%>
<%--                <td class="">张三</td>--%>
<%--                <td class="">￥1000.00</td>--%>
<%--                <td class="text-center fw600">2000-9-9 9:20</td>--%>
<%--                <td>--%>
<%--                  <a href="#">修改</a>--%>
<%--                  <a href="#">查看</a>--%>
<%--                </td>--%>
<%--              </tr>--%>
              </tbody>
            </table>
          </div>

        </div>
        <!-- end: .admin-form -->
      </div>
    </div>
      <!-- end: .tray-center -->
  </section>
  <!-- End: Content -->
  <!-- End: Content-Wrapper -->
</div>
<!-- End: Main -->

<!-- BEGIN: PAGE SCRIPTS -->

<style>
  /* demo page styles */
  body { min-height: 2300px; }

  .content-header b,
  .admin-form .panel.heading-border:before,
  .admin-form .panel .heading-border:before {
    transition: all 0.7s ease;
  }
  /* responsive demo styles */
  @media (max-width: 800px) {
    .admin-form .panel-body { padding: 18px 12px; }
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
