package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmGoodsinfos;
import java.util.List;

public interface CtmGoodsinfosMapper {
    int deleteByPrimaryKey(Integer categoryId);

    int insert(CtmGoodsinfos record);

    CtmGoodsinfos selectByPrimaryKey(Integer categoryId);

    List<CtmGoodsinfos> selectAll(String name);

    int updateByPrimaryKey(CtmGoodsinfos record);
}