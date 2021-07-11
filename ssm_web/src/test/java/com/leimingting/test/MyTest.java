package com.leimingting.test;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.leimingting.mapper.ClaimVoucherInfoMapper;
import com.leimingting.pojo.ClaimVoucherInfo;
import com.leimingting.pojo.Employee;
import com.leimingting.service.ClaimVoucherInfoService;
import com.leimingting.service.EmployeeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @Author 小T
 * @Date 2021/6/28 11:18
 */
@ContextConfiguration(locations = "classpath:spring/applicationContext.xml")
@RunWith(value = SpringJUnit4ClassRunner.class)
public class MyTest {
    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private ClaimVoucherInfoMapper claimVoucherInfoMapper;

    @Autowired
    private ClaimVoucherInfoService claimVoucherInfoService;

    @Test
    public void MyTest() {
        QueryWrapper<Employee> queryWrapper = new QueryWrapper();
        queryWrapper.eq("sn", "10003").eq("password", "000000");
        Employee employee = employeeService.getOne(queryWrapper);
        System.out.println(employee);
    }

    @Test
    public void selectClaimVoucherInfoTest() {
        QueryWrapper<ClaimVoucherInfo> claimVoucherInfoQueryWrapper = new QueryWrapper<>();
        claimVoucherInfoQueryWrapper.eq("status", "未提交");
        List<ClaimVoucherInfo> claimVoucherInfos = claimVoucherInfoMapper.selectClaimVoucherInfo(claimVoucherInfoQueryWrapper);
        System.out.println(claimVoucherInfos);
    }

    @Test
    public void selById() {
        ClaimVoucherInfo claimVoucherInfo = claimVoucherInfoService.selById(3);
        System.out.println(claimVoucherInfo);
    }

    @Test
    public void selectHandlerClaimVoucherInfoTest() {
        QueryWrapper<Employee> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("sn", "10004");
        Employee employee = employeeService.getOne(queryWrapper);
        List<ClaimVoucherInfo> claimVoucherInfos = claimVoucherInfoService.selectHandlerClaimVoucherInfo(employee);
        for (ClaimVoucherInfo claimVoucherInfo : claimVoucherInfos) {
            System.out.println(claimVoucherInfo);
        }
    }

    @Test
    public void findAllTest() {
        List<Employee> all = employeeService.findAll(null,null);
        for (Employee employee : all) {
            System.out.println(employee);
        }
    }
}
