package com.leimingting.service;

import com.leimingting.pojo.ClaimVoucherInfo;
import com.leimingting.pojo.Employee;

import java.util.List;

/**
 * @Author 小T
 * @Date 2021/6/30 23:25
 */
public interface ClaimVoucherInfoService {

    Integer save(ClaimVoucherInfo claimVoucherInfo);

    ClaimVoucherInfo selById(Integer id);

    List<ClaimVoucherInfo> findAll(String createSn);

    List<ClaimVoucherInfo> selectHandlerClaimVoucherInfo(Employee employee);

    Integer dealClaimVoucherInfo(Employee employee,Integer id,Double totalAmount, String comment ,String status);

    Integer updateClaimVoucherInfo(ClaimVoucherInfo claimVoucherInfo);
}
