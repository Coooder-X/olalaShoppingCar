package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmLogin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CtmLoginMapper {
    int updatePwdByID(@Param("ctmID") String ctmID, @Param("password") String password);

    int insert(CtmLogin record);

    List<CtmLogin> selectAll();

    CtmLogin selectByParam(String userName, String password);

    CtmLogin selectByName(String userName);

    CtmLogin selectByID(String customerId);

    CtmLogin selectByUser(CtmLogin ctmLogin);
}