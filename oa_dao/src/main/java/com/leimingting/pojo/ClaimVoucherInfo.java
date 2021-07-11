package com.leimingting.pojo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @Author 小T
 * @Date 2021/6/30 23:06
 * 报销单信息
 */
@Data
public class ClaimVoucherInfo {
    private Integer id;//报销单id
    private String cause;//事由
    private String createSn;//创建人编号
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;//创建时间
    private String nextDealSn;//待处理人id
    private Double totalAmount;//总金额
    private String status;//状态
    private Employee createEmployee;//创建人
    private Employee handler;//处理人
    private List<VoucherItem> items;//报销单明细
    private List<DealRecord> dealRecords;
}
