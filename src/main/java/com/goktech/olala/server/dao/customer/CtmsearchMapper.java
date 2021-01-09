package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmGoodsinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CtmsearchMapper {

    List<CtmGoodsinfo> select(@Param("name")String name);

    CtmGoodsinfo selectone(@Param("name") String name , @Param("id") String id);
    void delete(String id);
}
