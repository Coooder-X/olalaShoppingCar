package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmLogin;
import java.util.List;

public interface CtmLoginMapper {
    int insert(CtmLogin record);

    List<CtmLogin> selectAll();

    CtmLogin selectByParam(String userName, String password);
}