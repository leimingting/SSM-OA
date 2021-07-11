<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/29
  Time: 8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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

        tr, th {
            text-align: center;
        }

        #select_employee_blurry {
            width: 600px;
            margin: 15px auto;
        }

        #select_employee_blurry .form-group {
            margin-left: 30px;
        }
    </style>

</head>

<body class="admin-validation-page" data-spy="scroll" data-target="#nav-spy" data-offset="200">

<!-- Begin: Content -->
<section id="content" class="table-layout animated fadeIn">

    <!-- begin: .tray-center -->
    <div class="tray tray-center">

        <!-- Begin: Content Header -->
        <div class="content-header">
            <h2> 员工列表</h2>
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
                                <button type="button" class="btn btn-default light" onclick="">
                                    <i class="fa fa-refresh"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-trash"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-plus" onclick="add_employee()"></i>
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
                <form class="form-inline" id="select_employee_blurry">
                    <div class="form-group">
                        <label>姓名</label>
                        <input type="text" class="form-control" name="selName">
                    </div>
                    <div class="form-group">
                        <label>部门</label>
                        <select class="form-control" name="selDepartmentSn" id="selDepartmentSn">
                        </select>
                    </div>
                    <button type="button" class="btn  btn-sm btn-primary" onclick="select_employee_findAll(1)">查询
                    </button>
                </form>

                <div class="panel-body pn">
                    <table id="employee_table" class="table admin-form theme-warning tc-checkbox-1">
                        <thead>
                        <tr class="">
                            <th class="text-center hidden-xs">Select</th>
                            <th class="hidden-xs">员工编号</th>
                            <th class="hidden-xs">姓名</th>
                            <th class="hidden-xs">部门</th>
                            <th class="hidden-xs">职位</th>
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
<%--保存员工信息--%>
<div class="modal fade" tabindex="-1" role="dialog" id="add_employee_model">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">部门信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="employee_form">
                    <div class="form-group">
                        <label for="sn" class="col-sm-2 control-label">员工工号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="sn" name="sn" placeholder="员工编号">
                            <span id="snCheck" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" name="name" placeholder="姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="departmentSn" id="departmentSn">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">职务</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="post" name="post" placeholder="职务">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="saveEmployeeBtn">保存
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<%--修改员工信息--%>
<div class="modal fade" tabindex="-1" role="dialog" id="update_employee_model">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">部门信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_employee_form">
                    <div class="form-group">
                        <label for="sn" class="col-sm-2 control-label">员工工号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="updateSn" name="updateSn" placeholder="员工工号"
                                   readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="updateName" name="updateName" placeholder="姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="updateDepartmentSn" id="updateDepartmentSn">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">职务</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="updatePost" name="updatePost" placeholder="职务">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="update_employee_info()">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
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
    $(function () {
        select_department_findAll("#selDepartmentSn");
        select_employee_findAll(1);
    })


    /**
     * 发送查询员工请求
     */
    function select_employee_findAll(pn) {
        $.ajax({
            url: "${pageContext.request.contextPath}/employee/findAll",
            type: "GET",
            data: "pn=" + pn + '&' + $('#select_employee_blurry').serialize(),
            success: function (data) {
                console.log(data);
                pageNum = data.pageNum;
                pages = data.pages;
                build_employee_table(data);
            }
        })
    }

    /**
     *下一页
     */
    $('#nextPage').click(function () {
        if (pageNum == pages) {
            select_employee_findAll(pages);
        } else {
            select_employee_findAll(pageNum + 1);
        }
    })

    /**
     *上一页
     */
    $('#previousPage').click(function () {
        if (pageNum == 1) {
            select_employee_findAll(1);
        } else {
            select_employee_findAll(pageNum - 1);
        }
    })


    /**
     * 解析员工信息并显示在表格中
     */
    function build_employee_table(data) {
        $("#employee_table tbody").empty();
        let departmentInfo = data.list;
        $.each(departmentInfo, function (index, item) {
            let checkBoxTd = $("<td class='hidden-xs'> <label class='option block mn'> <input type='checkbox' name='mobileos' value='FR'> <span class='checkbox mn'></span> </label> </td>")
            let snTd = $("<td></td>").append(item.sn);
            let nameTd = $("<td></td>").append(item.name);
            let departmentAddressTd = $("<td></td>").append(item.departmentSn);
            let postTd = $("<td></td>").append(item.post);
            let editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append("编辑");
            editBtn.attr("edit_id", item.sn);
            let deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append("删除");
            deleteBtn.attr("delete_id", item.sn);
            let btnTd = $("<td></td>").append(editBtn).append("").append(deleteBtn);
            $("<tr></tr>").addClass("message-unread")
                .append(checkBoxTd)
                .append(snTd)
                .append(nameTd)
                .append(departmentAddressTd)
                .append(postTd)
                .append(btnTd)
                .appendTo("#employee_table tbody");
        })
    }

    /**
     * 打开保存员工模态框
     */
    function add_employee() {
        $("#employee_form")[0].reset();
        select_department_findAll("#departmentSn");
        $('#add_employee_model').modal({
            backdrop: "static"
        })
    }

    /**
     * 校验工号是否存在
     */
    $('#sn').focus(function () {
        let sn = this.value;
        employeeSnCheck(sn);
    })

    $('#sn').change(function () {
        let sn = this.value;
        employeeSnCheck(sn);
    })

    /**
     * 发送查询工号请求
     */
    function employeeSnCheck(sn) {
        if ($('#sn').val() == "") {
            $('#snCheck').parent().addClass("has-error");
            $('#snCheck').text("工号不能为空");
            return false;
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/employee/selectBySnCheck/" + sn,
            type: "GET",
            success: function (data) {
                $('#snCheck').parent().removeClass("has-success has-error");
                if (data == 'OK') {
                    $('#snCheck').parent().addClass("has-error");
                    $('#snCheck').text("工号已存在");
                    $("#saveEmployeeBtn").attr("ajax-va", "error");
                } else {
                    $('#snCheck').parent().addClass("has-success");
                    $('#snCheck').text("工号可用");
                    $("#saveEmployeeBtn").attr("ajax-va", "success");
                }
            }
        })
    }

    /**
     * 发送查询部门信息请求
     */
    function select_department_findAll(ele) {
        $.ajax({
            url: "${pageContext.request.contextPath}/department/selectDepartment",
            type: "GET",
            success: function (data) {
                console.log(data);
                build_select(data, ele);
            }
        })
    }

    /**
     * 将部门信息添加到option中
     */
    function build_select(data, ele) {
        $(ele).empty();
        let option = $("<option></option>").append("请选择").attr("value", "");
        option.appendTo(ele);
        $.each(data, function (index, item) {
            let optionEle = $("<option></option>").append(item.name).attr("value", item.sn);
            optionEle.appendTo(ele);
        });
    }

    /**
     *发送保存用户请求
     */
    $("#saveEmployeeBtn").click(function () {
        if ($(this).attr("ajax-va") == "error") {
            return false;
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/employee/save",
            type: "POST",
            data: $('#employee_form').serialize(),
            success: function (data) {
                if (data == "OK") {
                    alert("保存成功");
                    select_employee_findAll(pages);
                    $('#add_employee_model').modal('toggle');
                } else {
                    alert("保存失败");
                    select_employee_findAll(pages);
                    $('#add_employee_model').modal('toggle');
                }
            }
        })
    })

    /**
     *打开修改用户模态框
     */
    $(document).on('click', '.edit_btn', function () {
        let sn = $(this).attr("edit_id");
        select_department_findAll("#updateDepartmentSn");
        selById_employee(sn)
        $('#update_employee_model').modal({
            backdrop: "static"
        })
    })

    /**
     *根据编号查询员工信息
     */
    function selById_employee(sn) {
        $.ajax({
            url: "${pageContext.request.contextPath}/employee/selById/" + sn,
            type: "GET",
            success: function (data) {
                console.log(data);
                build_employee_info(data)
            }
        })
    }

    /**
     * 解析员工信息并显示在修改用户模态框中
     * @param data
     */
    function build_employee_info(data) {
        $('#updateSn').val(data.sn);
        $('#updateName').val(data.name);
        $('#updateDepartmentSn').val(data.departmentSn);
        $('#updatePost').val(data.post);
    }

    /**
     * 发送修改员工信息请求
     */
    function update_employee_info() {
        $.ajax({
            url: "${pageContext.request.contextPath}/employee/updateEmployee",
            type: "PUT",
            data: $("#update_employee_form").serialize(),
            success: function (data) {
                if (data == "OK") {
                    alert("修改成功");
                    select_employee_findAll(pageNum);
                    $('#update_employee_model').modal('toggle');
                } else {
                    alert("修改失败")
                    select_employee_findAll(pageNum);
                    $('#update_employee_model').modal('toggle');
                }
            }
        })
    }

    /**
     * 发送删除员工信息请求
     */
    $(document).on('click', '.delete_btn', function () {
        let name = $(this).parents("tr").find("td:eq(2)").text();
        let sn = $(this).parents("tr").find("td:eq(1)").text();
        if (confirm("确认删除【" + name + "】吗？")) {
            $.ajax({
                url: "${pageContext.request.contextPath}/employee/deleteEmployee/" + sn,
                type: "DELETE",
                success: function (data) {
                    if (data == "OK") {
                        alert("删除成功");
                        select_employee_findAll(1);
                    } else {
                        alert("删除失败");
                        select_employee_findAll(1);
                    }
                }
            })
        }
    })

</script>
</body>
</html>
