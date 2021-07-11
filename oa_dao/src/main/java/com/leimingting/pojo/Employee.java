package com.leimingting.pojo;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author 小T
 * @since 2021-06-28
 * 员工信息表
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value = "Employee对象", description = "")
public class Employee implements Serializable {

    private static final long serialVersionUID = 1L;

    private String sn;

    private String password;

    private String name;

    private String departmentSn;

    private String post;



}
