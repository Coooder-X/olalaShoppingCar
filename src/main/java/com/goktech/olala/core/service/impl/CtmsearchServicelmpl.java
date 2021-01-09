package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.service.ICtmsearchService;
import com.goktech.olala.server.dao.customer.CtmGoodsinfosMapper;
import com.goktech.olala.server.pojo.customer.CtmGoodsinfos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("CtmSearchService")
class CtmsearchService implements ICtmsearchService {
    @Autowired
    CtmGoodsinfosMapper ctmGoodsinfosMapper;
    @Override
    public List<CtmGoodsinfos> select(String name) {
        return ctmGoodsinfosMapper.selectAll(name);
    }

    @Override
    public List<CtmGoodsinfos> selectone(String id) {
        return (List<CtmGoodsinfos>) ctmGoodsinfosMapper.selectone(id);
    }
    public void delete(String id){
        ctmGoodsinfosMapper.deleteByPrimaryKey(id);
    }
}
