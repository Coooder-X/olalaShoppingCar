package com.goktech.olala.core.service;

import com.goktech.olala.server.pojo.customer.CtmGoodsinfo;

import java.util.List;

public interface ICtmGoodsPayService {
    public void pay(List<CtmGoodsinfo> list);
    public void update(String id , String name , int num , int sum);
}
