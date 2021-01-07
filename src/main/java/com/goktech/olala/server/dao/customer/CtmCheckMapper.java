package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmCheck;
import java.util.List;

public interface CtmCheckMapper {
    int insert(CtmCheck record);

    List<CtmCheck> selectAll();

    String queryCheck(String word);
}