package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.service.ICtmGoodsClassService;
import com.goktech.olala.server.dao.customer.CtmGoodsClassMapper;
import com.goktech.olala.server.pojo.customer.CtmGoodsClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CtmGoodsClassServiceImpl implements ICtmGoodsClassService {
    @Autowired
    CtmGoodsClassMapper ctmGoodsClassMapper;

    @Override
    public List<CtmGoodsClass> select(){
        return ctmGoodsClassMapper.select();
    }

}
