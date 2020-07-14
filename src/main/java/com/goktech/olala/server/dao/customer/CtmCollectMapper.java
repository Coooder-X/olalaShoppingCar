package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmCollect;
import java.util.List;

public interface CtmCollectMapper {
    int deleteByPrimaryKey(Integer collectId);

    int insert(CtmCollect record);

    CtmCollect selectByPrimaryKey(Integer collectId);

    List<CtmCollect> selectAll();

    int updateByPrimaryKey(CtmCollect record);
}