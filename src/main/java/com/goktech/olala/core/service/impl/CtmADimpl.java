package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.service.ICtmADService;
import com.goktech.olala.server.dao.customer.CtmADMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CtmADimpl implements ICtmADService {

    @Autowired
    CtmADMapper ctmADMapper;

    public String queryName(){
        return ctmADMapper.queryName();
    }
}
