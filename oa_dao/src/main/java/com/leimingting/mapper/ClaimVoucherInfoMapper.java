package com.leimingting.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.leimingting.pojo.ClaimVoucherInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author 小T
 * @Date 2021/7/1 10:17
 */
public interface ClaimVoucherInfoMapper {

    /**
     * 查询报销单信息
     * @return
     */
    List<ClaimVoucherInfo> selectClaimVoucherInfo(@Param(Constants.WRAPPER) QueryWrapper<ClaimVoucherInfo> queryWrapper);

    List<ClaimVoucherInfo> selectClaimVoucherInfoStatic(@Param("createSn") String createSn);

    /**
     * 根据id查询报销单信息
     * @param id
     * @return
     */
    ClaimVoucherInfo selByIdClaimVoucherInfo(Integer id);

}
