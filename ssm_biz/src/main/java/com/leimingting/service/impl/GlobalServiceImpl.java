package com.leimingting.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.leimingting.mapper.EmployeeMapper;
import com.leimingting.pojo.Employee;
import com.leimingting.service.GlobalService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * @Author 小T
 * @Date 2021/6/30 8:56
 */
@Service
@Transactional
public class GlobalServiceImpl implements GlobalService {

    @Resource
    private EmployeeMapper employeeMapper;

    @Override
    public Employee login(String sn, String password) {
        Employee employee = employeeMapper.selectEmployeeInfo(sn, password);
        if (employee != null) {
            return employee;
        }
        return null;
    }

    @Override
    public Integer changePassword(Employee employee) {
        UpdateWrapper<Employee> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("sn", employee.getSn());
        int row = employeeMapper.update(employee, updateWrapper);
        return row;
    }
}
