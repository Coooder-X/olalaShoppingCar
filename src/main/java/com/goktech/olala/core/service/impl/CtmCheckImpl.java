package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.service.ICtmCheckService;
import com.goktech.olala.server.dao.customer.CtmCheckMapper;
import com.goktech.olala.server.pojo.customer.CtmCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CtmCheckImpl implements ICtmCheckService {

    @Autowired
    CtmCheckMapper ctmCheckMapper;

    public String queryCheck(String word){
        return ctmCheckMapper.queryCheck(word);
    }
}
