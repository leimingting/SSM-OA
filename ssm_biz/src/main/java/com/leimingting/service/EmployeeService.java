package com.leimingting.service;

import com.leimingting.pojo.Employee;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 小T
 * @since 2021-06-28
 */
public interface EmployeeService extends IService<Employee> {
    List<Employee> findAll(String selName,String selDepartmentSn);

    List<Employee> selectBySnCheck(String sn);
}
