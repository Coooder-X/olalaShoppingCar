package com.goktech.olala.core.service;

import com.goktech.olala.server.pojo.customer.CtmInfo;
import com.goktech.olala.server.pojo.customer.CtmLogin;

import java.util.List;

public interface ICtmInfoService {

    int updatePwdByID(String ctmID, String password);

    CtmLogin queryCmtInfoForLogin(String userName, String password);

    CtmLogin queryCmtInfoForLoginByName(String userName);

    CtmInfo queryCmtInfoForReg(String userName);

    CtmLogin findByUser(CtmLogin ctmLogin);

    int saveCmtLogin(CtmLogin ctmLogin);    //  新添加的保存用户登陆信息的方法

    CtmLogin queryCmtLoginByID(String customerId);

    List<CtmInfo> queryCmtInfoByExample(CtmInfo ctmInfo);

    CtmInfo queryCtmInfoByCtmID(String ctmID);

    int insertCtmInfo(CtmInfo ctmInfo);

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
