package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.service.ICtmInfoService;
import com.goktech.olala.server.dao.customer.CtmInfoMapper;
import com.goktech.olala.server.pojo.customer.CtmInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ctmInfoService")
public class CtmInfoServiceImpl implements ICtmInfoService {

    @Autowired
    CtmInfoMapper ctmInfoMapper;

    @Override
    public CtmInfo queryCmtInfoForLogin(String userName, String password) {
        return null;
    }

    @Override
    public CtmInfo queryCmtInfoByExample(CtmInfo ctmInfo) {
        return null;
    }

    @Override
    public CtmInfo saveCmtInfo(CtmInfo ctmInfo) {
        return null;
    }
}
