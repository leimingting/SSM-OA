package com.leimingting.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.util.StringUtil;
import com.leimingting.mapper.EmployeeMapper;
import com.leimingting.pojo.Employee;
import com.leimingting.service.EmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 小T
 * @since 2021-06-28
 */
@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee> implements EmployeeService {
    @Resource
    private EmployeeMapper employeeMapper;

    @Override
    public List<Employee> findAll(String selName, String selDepartmentSn) {
        QueryWrapper<Employee> employeeQueryWrapper = new QueryWrapper<>();
        employeeQueryWrapper.like(StringUtil.isNotEmpty(selName), "e.name", selName);
        employeeQueryWrapper.eq(StringUtil.isNotEmpty(selDepartmentSn), "department_sn", selDepartmentSn);
        List<Employee> employeeMapperAll = employeeMapper.findAll(employeeQueryWrapper);
        return employeeMapperAll;
    }


    @Override
    public List<Employee> selectBySnCheck(String sn) {
        QueryWrapper<Employee> employeeQueryWrapper = new QueryWrapper<>();
        employeeQueryWrapper.eq("sn", sn);
        return employeeMapper.selectBySnCheck(employeeQueryWrapper);
    }
}
