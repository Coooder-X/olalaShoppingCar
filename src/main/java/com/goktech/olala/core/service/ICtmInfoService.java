package com.goktech.olala.core.service;

import com.goktech.olala.server.pojo.customer.CtmInfo;
import com.goktech.olala.server.pojo.customer.CtmLogin;

import java.util.List;

public interface ICtmInfoService {

    CtmLogin queryCmtInfoForLogin(String userName, String password);

    List<CtmInfo> queryCmtInfoByExample(CtmInfo ctmInfo);

    int saveCmtInfo(CtmInfo ctmInfo);

    int removeById(String customerInfId);

    /**
     * 修改会员的状态
     *
     * @param status
     * @return
     */
    int updateStatus(String customerId, Integer status);

}
