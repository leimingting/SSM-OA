package com.leimingting.pojo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author 小T
 * @since 2021-06-28
 * 报销单信息表
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("claim_voucher")
@ApiModel(value = "Voucher对象", description = "")
public class Voucher implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String cause;

    private String createSn;

    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    private String nextDealSn;

    private Double totalAmount;

    private String status;


}
