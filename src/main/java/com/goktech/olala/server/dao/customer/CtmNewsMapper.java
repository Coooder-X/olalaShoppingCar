package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmNews;
import java.util.List;

public interface CtmNewsMapper {
    int insert(CtmNews record);

    List<CtmNews> selectAll();

}