package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmPointLog;
import java.util.List;

public interface CtmPointLogMapper {
    int deleteByPrimaryKey(Long pointId);

    int insert(CtmPointLog record);

    CtmPointLog selectByPrimaryKey(Long pointId);

    List<CtmPointLog> selectAll();

    int updateByPrimaryKey(CtmPointLog record);
}