package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.service.ICtmsearchService;
import com.goktech.olala.server.dao.customer.CtmGoodsinfosMapper;
import com.goktech.olala.server.pojo.customer.CtmGoodsinfo;
import com.goktech.olala.server.pojo.customer.CtmGoodsinfos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CtmsearchServicelmpl implements ICtmsearchService {
//    @Autowired
//    CtmsearchMapper ctmsearchMapper;
//
    @Autowired
    CtmGoodsinfosMapper ctmGoodsinfosMapper;
    @Override
    public List<CtmGoodsinfos> select(String name) {

        return ctmGoodsinfosMapper.selectAll(name);
    }
    public CtmGoodsinfo selectone(String name , String id) {
        return (CtmGoodsinfo) ctmGoodsinfosMapper.selectAll(name);
    }
}
