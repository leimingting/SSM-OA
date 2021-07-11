package com.leimingting.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.leimingting.pojo.Department;
import com.leimingting.service.DepartmentService;
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
@RestController
@RequestMapping("/department")
public class DepartmentController {

    @Resource
    private DepartmentService departmentService;

    /**
     * 查询部门信息
     * 分页查询
     *
     * @return
     */
    @GetMapping("/findAll")
    public PageInfo<Department> findAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Department> list = departmentService.list();
        PageInfo<Department> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @GetMapping("/selectDepartment")
    public List<Department> selectDepartment() {
        List<Department> list = departmentService.list();
        return list;
    }

    /**
     * 保存部门信息
     *
     * @param department
     * @return
     */
    @PostMapping("/save")
    public String save(Department department) {
        System.out.println(department);
        boolean flag = departmentService.save(department);
        if (flag) {
            return "OK";
        } else {
            return "FALL";
        }
    }

    /**
     * 删除部门信息
     *
     * @param sn
     * @return
     */
    @DeleteMapping("/deleteDepartment/{sn}")
    public String deleteDepartment(@PathVariable Integer sn) {
        QueryWrapper<Department> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("sn", sn);
        boolean flag = departmentService.remove(queryWrapper);
        if (flag) {
            return "OK";
        } else {
            return "FALL";
        }
    }

    /**
     * 根据id查询部门信息
     *
     * @param sn
     * @return
     */
    @GetMapping("/selById/{sn}")
    public Department selById(@PathVariable String sn) {
        QueryWrapper<Department> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("sn", sn);
        Department department = departmentService.getOne(queryWrapper);
        return department;
    }

    /**
     * 修改部门信息
     *
     * @param updateSn
     * @param updateName
     * @param updateAddress
     * @return
     */
    @PutMapping("/updateDepartment")
    public String updateDepartment(String updateSn, String updateName, String updateAddress) {
        Department department = new Department();
        department.setSn(updateSn);
        department.setName(updateName);
        department.setAddress(updateAddress);
        UpdateWrapper<Department> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("sn", department.getSn());
        boolean flag = departmentService.update(department, updateWrapper);
        if (flag) {
            return "OK";
        } else {
            return "FALL";
        }
    }

    /**
     * 判断部门编号是否存在
     * @param sn
     * @return
     */
    @GetMapping("/selectBySnCheck/{sn}")
    public String selectBySnCheck(@PathVariable String sn) {
        final QueryWrapper<Department> departmentQueryWrapper = new QueryWrapper<>();
        departmentQueryWrapper.eq("sn", sn);
        List<Department> list = departmentService.list(departmentQueryWrapper);
        if (list.size() > 0) {
            return "FALL";
        } else {
            return "OK";
        }
    }
}

