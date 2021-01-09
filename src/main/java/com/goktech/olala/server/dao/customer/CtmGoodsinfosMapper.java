package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmGoodsinfos;
import java.util.List;

public interface CtmGoodsinfosMapper {
    int deleteByPrimaryKey(String categoryId);

    int insert(CtmGoodsinfos record);

    List<CtmGoodsinfos> selectone(String id);

    List<CtmGoodsinfos> selectAll(String name);

    int updateByPrimaryKey(CtmGoodsinfos record);
}