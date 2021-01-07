package com.goktech.olala.core.service;

import com.goktech.olala.server.pojo.customer.CtmGoods;
import com.goktech.olala.server.pojo.customer.CtmGoodsinfo;
import com.goktech.olala.server.pojo.customer.CtmGoodsinformation;

import java.util.List;

public interface ICtmsearchService {
    List<CtmGoodsinformation> select(String name);
    CtmGoodsinfo selectone(String name , String id);
}
