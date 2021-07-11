package com.leimingting.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.leimingting.pojo.Employee;
import com.leimingting.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
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
@RequestMapping("/employee")
public class EmployeeController {

    @Resource
    private EmployeeService employeeService;

    /**
     * 查询员工信息
     * 分页查询
     *
     * @return
     */
    @ResponseBody
    @GetMapping("/findAll")
    public PageInfo<Employee> findAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String selName,String selDepartmentSn){
        PageHelper.startPage(pn,5);
        List<Employee> list = employeeService.findAll(selName, selDepartmentSn);
        PageInfo<Employee> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存员工信息
     *
     * @param employee
     * @return
     */
    @ResponseBody
    @PostMapping("/save")
    public String save(Employee employee) {
        employee.setPassword("000000");//员工默认密码000000
        boolean flag = employeeService.save(employee);
        if (flag) {
            return "OK";
        } else {
            return "FALL";
        }
    }

    /**
     * 根据编号查询员工信息
     *
     * @param sn
     * @return
     */
    @ResponseBody
    @GetMapping("/selById/{sn}")
    public Employee selById(@PathVariable String sn) {
        QueryWrapper<Employee> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("sn", sn);
        final Employee employee = employeeService.getOne(queryWrapper);
        return employee;
    }

    /**
     * 修改员工信息
     *
     * @param updateSn
     * @param updateName
     * @param updateDepartmentSn
     * @param updatePost
     * @return
     */
    @ResponseBody
    @PutMapping("/updateEmployee")
    public String updateEmployee(String updateSn, String updateName, String updateDepartmentSn, String updatePost) {
        Employee employee = new Employee();
        employee.setSn(updateSn);
        employee.setName(updateName);
        employee.setDepartmentSn(updateDepartmentSn);
        employee.setPost(updatePost);
        UpdateWrapper<Employee> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("sn", employee.getSn());
        boolean flag = employeeService.update(employee, updateWrapper);
        if (flag) {
            return "OK";
        } else {
            return "FALL";
        }
    }

    /**
     * 删除员工信息
     *
     * @param sn
     * @return
     */
    @ResponseBody
    @DeleteMapping("/deleteEmployee/{sn}")
    public String deleteEmployee(@PathVariable String sn) {
        QueryWrapper<Employee> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("sn", sn);
        boolean flag = employeeService.remove(queryWrapper);
        if (flag) {
            return "OK";
        } else {
            return "FALL";
        }
    }

    /**
     * 校验工号是否存在
     * @param sn
     * @return
     */
    @ResponseBody
    @GetMapping("/selectBySnCheck/{sn}")
    public String selectBySnCheck(@PathVariable String sn) {
        List<Employee> employees = employeeService.selectBySnCheck(sn);
        if (employees.size() > 0) {
            return "OK";
        } else {
            return "FALL";
        }
    }

}

