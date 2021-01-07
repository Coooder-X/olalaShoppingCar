package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmGoodsinfos;
import java.util.List;

public interface CtmGoodsinfosMapper {
    int deleteByPrimaryKey(String goodsId);

    int insert(CtmGoodsinfos record);

    CtmGoodsinfos selectByPrimaryKey(String goodsId);

    List<CtmGoodsinfos> selectAll(String name);

    int updateByPrimaryKey(CtmGoodsinfos record);
}