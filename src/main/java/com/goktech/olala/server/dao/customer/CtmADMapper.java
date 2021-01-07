package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmAD;
import java.util.List;

public interface CtmADMapper {
    int insert(CtmAD record);

    List<CtmAD> selectAll();
    String queryName();
}