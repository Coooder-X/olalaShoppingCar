package com.goktech.olala.core.service;

import com.goktech.olala.server.pojo.customer.CtmInfo;

public interface ICtmInfoService {

    CtmInfo queryCmtInfoForLogin(String userName, String password);

    CtmInfo queryCmtInfoByExample(CtmInfo ctmInfo);

    CtmInfo saveCmtInfo(CtmInfo ctmInfo);

}
