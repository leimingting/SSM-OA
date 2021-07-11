package com.leimingting.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.leimingting.mapper.ClaimVoucherInfoMapper;
import com.leimingting.mapper.DealRecordMapper;
import com.leimingting.mapper.VoucherItemMapper;
import com.leimingting.mapper.VoucherMapper;
import com.leimingting.pojo.*;
import com.leimingting.service.ClaimVoucherInfoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author 小T
 * @Date 2021/6/30 23:25
 */
@Service
@Transactional
public class ClaimVoucherInfoServiceImpl implements ClaimVoucherInfoService {
    //职务
    public static final String POST_FM = "部门经理";
    public static final String POST_GM = "总经理";
    public static final String POST_CASHIER = "财务";

    //报销单状态
    public static final String CLAIMVOUCHER_CREATED = "未提交";
    public static final String CLAIMVOUCHER_SUBMIT = "已提交";
    public static final String CLAIMVOUCHER_APPROVED = "已审核";
    public static final String Pending_review_APPROVED = "待复审";
    public static final String CLAIMVOUCHER_TERMINATED = "已拒绝";
    public static final String CLAIMVOUCHER_BACK = "已打回";
    public static final String CLAIMVOUCHER_PAID = "已打款";

    //处理方式
    public static final String DEAL_SUBMIT = "提交";
    public static final String DEAL_UPDATE = "修改";
    public static final String DEAL_BACK = "打回";
    public static final String DEAL_REJECT = "拒绝";
    public static final String DEAL_PASS = "通过";
    public static final String DEAL_PAID = "打款";
    @Resource
    private VoucherMapper voucherMapper;

    @Resource
    private VoucherItemMapper voucherItemMapper;

    @Resource
    private ClaimVoucherInfoMapper claimVoucherInfoMapper;

    @Resource
    private DealRecordMapper dealRecordMapper;

    /**
     * 保存报销单信息
     *
     * @param claimVoucherInfo
     * @return
     */
    @Override
    public Integer save(ClaimVoucherInfo claimVoucherInfo) {
        String cause = claimVoucherInfo.getCause();
        String createSn = claimVoucherInfo.getCreateSn();
        String nextDealSn = claimVoucherInfo.getNextDealSn();
        Double totalAmount = claimVoucherInfo.getTotalAmount();
        Voucher voucher = new Voucher();
        voucher.setCause(cause);
        voucher.setCreateSn(createSn);
        voucher.setNextDealSn(nextDealSn);
        voucher.setTotalAmount(totalAmount);
        voucher.setStatus(CLAIMVOUCHER_CREATED);
        int row;

        row = voucherMapper.insert(voucher);//插入报销单信息

        if (row > 0) {
            //插入报销单详情
            List<VoucherItem> items = claimVoucherInfo.getItems();
            QueryWrapper<Voucher> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("id", voucher.getId());
            for (VoucherItem item : items) {
                VoucherItem voucherItem = new VoucherItem();
                voucherItem.setClaimVoucherId(voucher.getId());
                voucherItem.setItem(item.getItem());
                voucherItem.setAmount(item.getAmount());
                voucherItem.setComment(item.getComment());
                row = voucherItemMapper.insert(voucherItem);
            }
        }
        return row;
    }

    /**
     * 跟据id查询报销单信息
     *
     * @param id
     * @return
     */
    @Override
    public ClaimVoucherInfo selById(Integer id) {
        ClaimVoucherInfo claimVoucherInfo = claimVoucherInfoMapper.selByIdClaimVoucherInfo(id);
        List<VoucherItem> voucherItems = selectVoucherItem(id);
        List<DealRecord> dealRecords = selectDealRecord(id);
        claimVoucherInfo.setItems(voucherItems);
        claimVoucherInfo.setDealRecords(dealRecords);
        return claimVoucherInfo;
    }

    /**
     * 查询报销单详情
     *
     * @param id
     * @return
     */
    private List<VoucherItem> selectVoucherItem(Integer id) {
        QueryWrapper<VoucherItem> voucherItemQueryWrapper = new QueryWrapper<>();
        voucherItemQueryWrapper.eq("claim_voucher_id", id);
        List<VoucherItem> voucherItems = voucherItemMapper.selectList(voucherItemQueryWrapper);
        return voucherItems;
    }

    /**
     * 查询处理流程
     *
     * @param id
     * @return
     */
    private List<DealRecord> selectDealRecord(Integer id) {
        List<DealRecord> dealRecords = dealRecordMapper.selectAllByIdDealRecordInfo(id);
        return dealRecords;
    }

    /**
     * 查询员工所有报销单信息
     *
     * @param createSn
     * @return
     */
    @Override
    public List<ClaimVoucherInfo> findAll(String createSn) {
        QueryWrapper<ClaimVoucherInfo> claimVoucherInfoQueryWrapper = new QueryWrapper<>();
        claimVoucherInfoQueryWrapper.eq("create_sn", createSn);
        List<ClaimVoucherInfo> claimVoucherInfos = claimVoucherInfoMapper.selectClaimVoucherInfo(claimVoucherInfoQueryWrapper);
        return claimVoucherInfos;
    }

    /**
     * 查询待处理报销单
     *
     * @param employee
     * @return
     */
    @Override
    public List<ClaimVoucherInfo> selectHandlerClaimVoucherInfo(Employee employee) {
        String post = employee.getPost();
        List<ClaimVoucherInfo> claimVoucherInfos;
        QueryWrapper<ClaimVoucherInfo> wrapper = new QueryWrapper<>();
        if (post.equals(POST_GM)) {
            wrapper.eq("status", Pending_review_APPROVED);
            claimVoucherInfos = claimVoucherInfoMapper.selectClaimVoucherInfo(wrapper);
        } else if (post.equals(POST_FM)) {
            wrapper.eq("status", CLAIMVOUCHER_SUBMIT);
            claimVoucherInfos = claimVoucherInfoMapper.selectClaimVoucherInfo(wrapper);
        } else if (post.equals(POST_CASHIER)) {
            wrapper.eq("status", CLAIMVOUCHER_APPROVED);
            claimVoucherInfos = claimVoucherInfoMapper.selectClaimVoucherInfo(wrapper);
        } else {
            wrapper.eq("create_sn", employee.getSn())
                    .eq("status", CLAIMVOUCHER_CREATED)
                    .or().eq("status", CLAIMVOUCHER_BACK);
            claimVoucherInfos = claimVoucherInfoMapper.selectClaimVoucherInfo(wrapper);
        }
        return claimVoucherInfos;
    }

    /**
     * 处理报销单
     *
     * @param employee
     * @param id
     * @param totalAmount
     * @param comment
     * @param status
     * @return
     */
    @Override
    public Integer dealClaimVoucherInfo(Employee employee, Integer id, Double totalAmount, String comment, String status) {
        String dealStatus = null;
        int row;
        if (status.equals(DEAL_SUBMIT)) {
            dealStatus = CLAIMVOUCHER_SUBMIT;
        } else if (status.equals(DEAL_BACK)) {
            dealStatus = CLAIMVOUCHER_BACK;
        } else if (status.equals(DEAL_PASS)) {
            if (totalAmount > 5000) {
                dealStatus = Pending_review_APPROVED;
            } else {
                dealStatus = CLAIMVOUCHER_APPROVED;
            }
        } else if (status.equals(DEAL_REJECT)) {
            dealStatus = CLAIMVOUCHER_TERMINATED;
        } else if (status.equals(DEAL_PAID)) {
            dealStatus = CLAIMVOUCHER_PAID;
        }

        if (status.equals(DEAL_PASS)&&employee.getPost().equals(POST_GM)){
            dealStatus = CLAIMVOUCHER_APPROVED;
        }

        UpdateWrapper<Voucher> voucherUpdateWrapper = new UpdateWrapper<>();
        voucherUpdateWrapper.eq("id", id);
        Voucher voucher = new Voucher();
        voucher.setStatus(dealStatus);
        row = voucherMapper.update(voucher, voucherUpdateWrapper);
        DealRecord dealRecord = new DealRecord(null, id, employee.getSn(), null, status, status, comment);
        row += dealRecordMapper.insert(dealRecord);
        return row;
    }

    /**
     * 修改报销单信息
     *
     * @param claimVoucherInfo
     * @return
     */
    @Override
    public Integer updateClaimVoucherInfo(ClaimVoucherInfo claimVoucherInfo) {
        Integer row;
        Integer claimVoucherInfoId = claimVoucherInfo.getId();
        String cause = claimVoucherInfo.getCause();
        String createSn = claimVoucherInfo.getCreateSn();
        String nextDealSn = claimVoucherInfo.getNextDealSn();
        Double totalAmount = claimVoucherInfo.getTotalAmount();
        Voucher voucher = new Voucher();
        voucher.setId(claimVoucherInfoId);
        voucher.setCause(cause);
        voucher.setCreateSn(createSn);
        voucher.setNextDealSn(nextDealSn);
        voucher.setTotalAmount(totalAmount);
        voucher.setStatus(CLAIMVOUCHER_CREATED);
        row = voucherMapper.updateById(voucher);


        List<VoucherItem> items = claimVoucherInfo.getItems();
        QueryWrapper<VoucherItem> itemQueryWrapper = new QueryWrapper<>();
        itemQueryWrapper.eq("claim_voucher_id", voucher.getId());
        List<VoucherItem> olds = voucherItemMapper.selectList(itemQueryWrapper);

        for (VoucherItem old : olds) {
            boolean isHave = false;
            for (VoucherItem item : items) {
                if (item.getId() == old.getId()) {
                    isHave = true;
                    break;
                }
            }
            if (!isHave) {
                voucherItemMapper.deleteById(old);
            }
        }

        for (VoucherItem item : items) {
            item.setClaimVoucherId(voucher.getId());
            if (item.getId() != null) {
                voucherItemMapper.updateById(item);
            } else {
                voucherItemMapper.insert(item);
            }
        }

        return row;
    }
}
