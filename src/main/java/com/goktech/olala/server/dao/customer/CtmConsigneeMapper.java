package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmConsignee;
import java.util.List;

public interface CtmConsigneeMapper {
    int deleteByPrimaryKey(Integer customerAddrId);

    int insert(CtmConsignee record);

    CtmConsignee selectByPrimaryKey(Integer customerAddrId);

    List<CtmConsignee> selectAll();

    int updateByPrimaryKey(CtmConsignee record);
}