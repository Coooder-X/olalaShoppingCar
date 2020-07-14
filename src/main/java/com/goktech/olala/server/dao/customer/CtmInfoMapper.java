package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmInfo;
import java.util.List;

public interface CtmInfoMapper {
    int deleteByPrimaryKey(String customerInfId);

    int insert(CtmInfo record);

    CtmInfo selectByPrimaryKey(String customerInfId);

    List<CtmInfo> selectAll();

    int updateByPrimaryKey(CtmInfo record);
}