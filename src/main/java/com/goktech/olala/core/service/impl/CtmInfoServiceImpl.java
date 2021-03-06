package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.req.CtmInfoReq;
import com.goktech.olala.core.service.ICtmInfoService;
import com.goktech.olala.server.dao.customer.CtmConsigneeMapper;
import com.goktech.olala.server.dao.customer.CtmInfoMapper;
import com.goktech.olala.server.dao.customer.CtmLoginMapper;
import com.goktech.olala.server.pojo.customer.CTMSecondMenuDirction;
import com.goktech.olala.server.pojo.customer.CtmConsignee;
import com.goktech.olala.server.pojo.customer.CtmInfo;
import com.goktech.olala.server.pojo.customer.CtmLogin;
import com.mysql.cj.PreparedQuery;
import net.sf.ehcache.search.expression.Criteria;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Service("ctmInfoService")
public class CtmInfoServiceImpl implements ICtmInfoService {

    @Autowired
    CtmInfoMapper ctmInfoMapper;

    @Autowired
    CtmLoginMapper ctmLoginMapper;

    @Autowired
    CtmConsigneeMapper ctmConsigneeMapper;


    @Override
    public List<String> querySecondMenu(String type) {
        return ctmInfoMapper.querySecondMenu(type);
    }

    @Override
    public List<String> querySecondMenuBussiness(String type) {
        return ctmInfoMapper.querySecondMenuBussiness(type);
    }

    @Override
    public List<CTMSecondMenuDirction> querySecondMenuNumber() {
        return ctmInfoMapper.querySecondMenuNumber();
    }


    @Override
    public int updateMember(CtmInfo ctmInfo) {
        return ctmInfoMapper.updateMember(ctmInfo);
    }

    @Override
    public CtmConsignee queryAddress(Integer addID) {
        return ctmConsigneeMapper.selectByPrimaryKey(addID);
    }

    @Override
    public int updateAdd(CtmConsignee consignee) {
        return ctmConsigneeMapper.updateByPrimaryKey(consignee);
    }

    @Override
    public int removeAddByAddId(Integer addID) {
        return ctmConsigneeMapper.deleteByPrimaryKey(addID);
    }

    @Override
    public List<CtmConsignee> findAllAddress(String cmtID) {
        return ctmConsigneeMapper.selectAll(cmtID);
    }

    @Override
    public int saveAddress(CtmConsignee consignee) {
        return ctmConsigneeMapper.insert(consignee);
    }

    @Override
    public int updatePwdByID(String ctmID, String password) {
        if(password == null)
            return 0;
        return ctmLoginMapper.updatePwdByID(ctmID, password);
    }

    /**
     * 前台客户登录
     *
     * @param userName
     * @param password
     * @return
     */
    @Override
    public CtmLogin queryCmtInfoForLogin(String userName, String password) {
        if(StringUtils.isBlank(userName) || StringUtils.isBlank(password)){
            return null;
        }
        return ctmLoginMapper.selectByParam(userName, password);
    }

    @Override
    public CtmLogin queryCmtInfoForLoginByName(String userName) {
        return ctmLoginMapper.selectByName(userName);
    }

    @Override
    public CtmInfo queryCmtInfoForReg(String userName) {
        return ctmInfoMapper.queryCmtInfoForReg(userName);
    }


    @Override
    public CtmLogin findByUser(CtmLogin ctmLogin) {
        return ctmLoginMapper.selectByUser(ctmLogin);
    }

    @Override
    public int saveCmtLogin(CtmLogin ctmLogin) {
        return ctmLoginMapper.insert(ctmLogin);
    }

    @Override
    public CtmLogin queryCmtLoginByID(String customerId) {
        return ctmLoginMapper.selectByID(customerId);
    }

    @Override
    public List<CtmInfo> queryCmtInfoByExample(CtmInfo ctmInfo) {
        return ctmInfoMapper.selectByExample(ctmInfo);
    }

    @Override
    public CtmInfo queryCtmInfoByCtmID(String ctmID) {
        return  ctmInfoMapper.queryCtmInfoByCtmID(ctmID);
    }

    @Override
    public int insertCtmInfo(CtmInfo ctmInfo) {
        return ctmInfoMapper.insertCtmInfo(ctmInfo);
    }

    @Override
    public int saveCmtInfo(CtmInfo ctmInfo) {
        if(null == ctmInfo){
            return 0;
        }
        ctmInfo.setModifiedTime(new Timestamp(new Date().getTime()));
//        if(StringUtils.isNotBlank(ctmInfo.getCustomerInfId())){
            return ctmInfoMapper.updateByPrimaryKey(ctmInfo);
//        }
//        ctmInfo.setRegisterTime(new Timestamp(new Date().getTime()));
//        return ctmInfoMapper.insert(ctmInfo);
    }

    @Override
    public int removeById(String customerInfId) {
        if(StringUtils.isBlank(customerInfId)){
            return 0;
        }
        return ctmInfoMapper.deleteByPrimaryKey(customerInfId);
    }

    @Override
    public List<CtmInfo> findAllCtmInfo() {
        return ctmInfoMapper.selectAll();
    }

    @Override
    public int updateStatus(String customerId, Integer status) {
        if(StringUtils.isBlank(customerId)){
            return 0;
        }
        CtmInfo ctmInfo = new CtmInfo();
        ctmInfo.setCustomerStatus(status);
        ctmInfo.setCustomerId(customerId);
        return ctmInfoMapper.updateStatus(ctmInfo);
    }


}
