package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmGoodsPhoto;

import java.util.List;

public interface CtmGoodsPhotoMapper {
    CtmGoodsPhoto queryByGoodID(Integer goodID);

    int deleteByPrimaryKey(Long id);

    int insert(CtmGoodsPhoto record);

    CtmGoodsPhoto selectByPrimaryKey(Long id);

    List<CtmGoodsPhoto> selectAll();

    int updateByPrimaryKey(CtmGoodsPhoto record);
}