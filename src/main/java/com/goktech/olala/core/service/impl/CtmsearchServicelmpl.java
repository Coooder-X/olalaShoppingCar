package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.service.ICtmsearchService;
import com.goktech.olala.server.dao.customer.CtmsearchMapper;
import com.goktech.olala.server.pojo.customer.CtmGoodsinfo;
import com.goktech.olala.server.pojo.customer.CtmGoodsinformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CtmsearchServicelmpl implements ICtmsearchService {
    @Autowired
    CtmsearchMapper ctmsearchMapper;
    @Override
    public List<CtmGoodsinformation> select(String name) {
        return ctmsearchMapper.select(name);
    }
    public CtmGoodsinfo selectone(String name , String id) {
        return ctmsearchMapper.selectone(name , id);
    }
}
