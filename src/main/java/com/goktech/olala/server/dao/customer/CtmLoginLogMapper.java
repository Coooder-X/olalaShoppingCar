package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmLoginLog;
import java.util.List;

public interface CtmLoginLogMapper {
    int deleteByPrimaryKey(Long loginId);

    int insert(CtmLoginLog record);

    CtmLoginLog selectByPrimaryKey(Long loginId);

    List<CtmLoginLog> selectAll();

    int updateByPrimaryKey(CtmLoginLog record);
}