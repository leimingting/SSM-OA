package com.leimingting.controller;

import com.leimingting.pojo.Employee;
import com.leimingting.service.GlobalService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @Author 小T
 * @Date 2021/6/30 9:02
 */
@Controller
public class GlobalController {

    @Resource
    private GlobalService globalService;

    /**
     * 员工登陆
     *
     * @param session
     * @param sn
     * @param password
     * @return
     */
    @ResponseBody
    @RequestMapping("/login")
    public String login(HttpSession session, String sn, String password) {
        Employee employee = globalService.login(sn, password);
        if (employee != null) {
            session.setAttribute("employee", employee);
            return "OK";
        } else {
            return "FALL";
        }

    }

    /**
     * 退出登陆
     *
     * @param session
     * @return
     */
    @RequestMapping("/quit")
    public String quit(HttpSession session) {
        session.setAttribute("employee", null);
        return "redirect:/go/login";
    }

    /**
     * 修改密码
     *
     * @param employee
     * @return
     */
    @ResponseBody
    @PutMapping("/updatePassword")
    public String updatePassword(Employee employee) {
        System.out.println(employee);
        Integer row = globalService.changePassword(employee);
        if (row > 0) {
            return "OK";
        } else {
            return "FALL";
        }
    }

}
