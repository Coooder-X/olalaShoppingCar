package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmGoods;
import java.util.List;

public interface CtmGoodsMapper {
    int deleteByPrimaryKey(Integer wpId);

    int insert(CtmGoods record);

    CtmGoods selectByPrimaryKey(Integer wpId);

    List<CtmGoods> selectAll();

    int updateByPrimaryKey(CtmGoods record);
}