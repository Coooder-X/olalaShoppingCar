package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.service.ICtmGoodsPayService;
import com.goktech.olala.server.dao.customer.CtmGoodsPayMapper;
import com.goktech.olala.server.pojo.customer.CtmGoodsinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CtmGoodsPayServiceImpl implements ICtmGoodsPayService {
    @Autowired
    CtmGoodsPayMapper ctmGoodsPayMapper;
    @Override
    public void pay(List<CtmGoodsinfo> list) {
        for(CtmGoodsinfo l : list){
            update(l.getGoodID() , l.getGoodName() , l.getNumber() , l.getSum());
            list.remove(l);
        }
    }

    @Override
    public void update(String id, String name, int num, int sum) {
        ctmGoodsPayMapper.update(id , name , num , sum);
    }
}
