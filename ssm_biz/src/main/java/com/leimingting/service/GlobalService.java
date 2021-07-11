package com.leimingting.service;

import com.leimingting.pojo.Employee;

/**
 * @Author 小T
 * @Date 2021/6/30 8:54
 */
public interface GlobalService {
    Employee login(String sn,String password);

    Integer changePassword(Employee employee);
}
