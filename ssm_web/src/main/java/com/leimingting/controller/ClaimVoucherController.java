package com.leimingting.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.leimingting.pojo.ClaimVoucherInfo;
import com.leimingting.pojo.Employee;
import com.leimingting.service.ClaimVoucherInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author 小T
 * @since 2021-06-28
 */
@Controller
@RequestMapping("/claimVoucher")
public class ClaimVoucherController {

    @Resource
    private ClaimVoucherInfoService claimVoucherInfoService;


    /**
     * 保存报销单信息
     *
     * @param session
     * @param claimVoucherInfo
     * @return
     */
    @ResponseBody
    @PostMapping("/save")
    public String save(HttpSession session, ClaimVoucherInfo claimVoucherInfo) {
        Employee employee = (Employee) session.getAttribute("employee");
        claimVoucherInfo.setCreateSn(employee.getSn());
        claimVoucherInfo.setCreateEmployee(employee);
        Integer row = claimVoucherInfoService.save(claimVoucherInfo);
        if (row > 0) {
            return "OK";
        } else {
            return "FALL";
        }
    }

    /**
     * 查询报销单信息
     *
     * @param session
     * @param pn
     * @return
     */
    @ResponseBody
    @GetMapping("/findAll")
    public PageInfo<ClaimVoucherInfo> findAll(HttpSession session, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        Employee employee = (Employee) session.getAttribute("employee");
        PageHelper.startPage(pn, 5);
        List<ClaimVoucherInfo> claimVoucherInfoList = claimVoucherInfoService.findAll(employee.getSn());
        PageInfo<ClaimVoucherInfo> pageInfo = new PageInfo<>(claimVoucherInfoList);
        return pageInfo;
    }

    /**
     * 根据id查询报销单信息
     *
     * @param id
     * @return
     */
    @ResponseBody
    @GetMapping("/selById/{id}")
    public ClaimVoucherInfo selById(@PathVariable Integer id) {
        ClaimVoucherInfo claimVoucherInfo = claimVoucherInfoService.selById(id);
        return claimVoucherInfo;
    }

    /**
     * 查询待处理的报销单请求
     *
     * @param session
     * @param pn
     * @return
     */
    @ResponseBody
    @GetMapping("/selectHandlerClaimVoucherInfo")
    public PageInfo<ClaimVoucherInfo> selectHandlerClaimVoucherInfo(HttpSession session, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        Employee employee = (Employee) session.getAttribute("employee");
        PageHelper.startPage(pn, 5);
        List<ClaimVoucherInfo> claimVoucherInfos = claimVoucherInfoService.selectHandlerClaimVoucherInfo(employee);
        PageInfo<ClaimVoucherInfo> pageInfo = new PageInfo<>(claimVoucherInfos);
        return pageInfo;
    }

    /**
     * 处理报销单
     *
     * @param session
     * @param id
     * @param totalAmount
     * @param comment
     * @param status
     * @return
     */
    @ResponseBody
    @PutMapping("/dealClaimVoucherInfo/{id}/{totalAmount}/{comment}/{status}")
    public String dealClaimVoucherInfo(HttpSession session, @PathVariable Integer id, @PathVariable Double totalAmount, @PathVariable String comment, @PathVariable String status) {
        Employee employee = (Employee) session.getAttribute("employee");
        Integer row = claimVoucherInfoService.dealClaimVoucherInfo(employee, id, totalAmount, comment, status);
        if (row > 0) {
            return "OK";
        } else {
            return "FALL";
        }
    }


    /**
     * 根据id查询报销单信息
     *
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/goUpdateVoucher/{id}")
    public String goUpdateVoucher(Model model, @PathVariable Integer id) {
        ClaimVoucherInfo claimVoucherInfo = claimVoucherInfoService.selById(id);
        model.addAttribute("claimVoucherInfo", claimVoucherInfo);
        return "voucher/update_voucher";
    }

    /**
     * 修改报销单信息
     *
     * @param claimVoucherInfo
     * @return
     */
    @ResponseBody
    @PutMapping("/updateVoucher")
    public String updateVoucher(ClaimVoucherInfo claimVoucherInfo) {
        Integer row = claimVoucherInfoService.updateClaimVoucherInfo(claimVoucherInfo);
        if (row > 0) {
            return "OK";
        } else {
            return "FALL";
        }
    }
}

