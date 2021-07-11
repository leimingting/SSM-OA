package com.leimingting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author 小T
 * @Date 2021/6/28 15:47
 * 页面跳转控制器
 */
@Controller
@RequestMapping("/go")
public class GoPageController {
    @RequestMapping("/listVoucher")
    public String listVoucher(){
        return "voucher/list_voucher";
    }

    @RequestMapping("/departmentList")
    public String goDepartmentList(){
        return "department/department_list";
    }

    @RequestMapping("/employeeList")
    public String goEmployeeList(){
        return "employee/employee_list";
    }

    @RequestMapping("/login")
    public String toLogin(){
        return "system/login";
    }

    @RequestMapping("/self")
    public String self(){
        return "system/self";
    }

    @RequestMapping("/index")
    public String index(){
        return "system/index";
    }

    @RequestMapping("/addVoucher")
    public String addVoucher(){
        return "voucher/add_voucher";
    }

    @RequestMapping("/handleVoucherList")
    public String handleVoucherList(){
        return "voucher/handle_voucher_list";
    }

}
