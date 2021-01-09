package com.goktech.olala.core.service;

import com.goktech.olala.server.pojo.customer.CtmGoodsinfos;

import java.util.List;

public interface ICtmsearchService {
    List<CtmGoodsinfos> select(String name);
    List<CtmGoodsinfos> selectone(String id);
    void delete(String id);
}
