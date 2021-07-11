package com.leimingting.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.leimingting.pojo.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author 小T
 * @since 2021-06-28
 */
public interface EmployeeMapper extends BaseMapper<Employee> {
    /**
     * 查询所有员工信息
     *
     * @return
     */
    List<Employee> findAll(@Param(Constants.WRAPPER) QueryWrapper<Employee> wrapper);

    /**
     * 跟据编号和密码查询员工|登陆
     *
     * @param sn
     * @param password
     * @return
     */
    Employee selectEmployeeInfo(@Param("sn") String sn, @Param("password") String password);

    /**
     * 查询编号是否存在
     * @param wrapper
     * @return
     */
    List<Employee> selectBySnCheck(@Param(Constants.WRAPPER) QueryWrapper<Employee> wrapper);
}
