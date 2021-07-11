package com.leimingting.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
 * 报销单明细表
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("claim_voucher_item")
@ApiModel(value = "VoucherItem对象", description = "")
public class VoucherItem implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer claimVoucherId;

    private String item;

    private Double amount;

    private String comment;


}
