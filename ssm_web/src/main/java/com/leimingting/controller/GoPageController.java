package com.leimingting.controller;

import com.leimingting.utils.VerifyCodeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

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

    //生成验证码
    @GetMapping("getImage")
    public void getImage(HttpSession session, HttpServletResponse response) throws IOException {
        //生成验证码
        String securityCode = VerifyCodeUtils.getSecurityCode();
        //将验证码放入session
        session.setAttribute("code",securityCode);
        //生成图片
        BufferedImage image = VerifyCodeUtils.createImage(securityCode);
        //输出图片
        ServletOutputStream outputStream = response.getOutputStream();
        //调用工具类
        ImageIO.write(image,"png",outputStream);
    }

}
