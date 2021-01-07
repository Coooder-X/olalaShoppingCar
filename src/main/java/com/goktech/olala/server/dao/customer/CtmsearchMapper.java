package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmGoodsinfo;
import com.goktech.olala.server.pojo.customer.CtmGoodsinformation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CtmsearchMapper {
    List<CtmGoodsinformation> select(@Param("name") String name);

    CtmGoodsinfo selectone(@Param("name") String name , @Param("id") String id);
}
