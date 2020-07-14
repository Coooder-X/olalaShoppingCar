package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmLevelInfo;
import java.util.List;

public interface CtmLevelInfoMapper {
    int deleteByPrimaryKey(Integer customerLevelId);

    int insert(CtmLevelInfo record);

    CtmLevelInfo selectByPrimaryKey(Integer customerLevelId);

    List<CtmLevelInfo> selectAll();

    int updateByPrimaryKey(CtmLevelInfo record);
}