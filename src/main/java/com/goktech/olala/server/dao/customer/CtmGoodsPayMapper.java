package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmGoodsinfo;

import java.util.List;

public interface CtmGoodsPayMapper {
    public void pay(List<CtmGoodsinfo> list);
    public void update(String id , String name , int num , int sum);
}
