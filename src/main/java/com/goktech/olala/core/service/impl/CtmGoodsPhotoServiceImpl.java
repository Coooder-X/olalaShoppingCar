package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.service.ICtmGoodsPhotoService;
import com.goktech.olala.server.dao.customer.CtmGoodsPhotoMapper;
import com.goktech.olala.server.pojo.customer.CtmGoodsPhoto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CtmGoodsPhotoServiceImpl implements ICtmGoodsPhotoService {

    @Autowired
    CtmGoodsPhotoMapper ctmGoodsPhotoMapper;

    @Override
    public CtmGoodsPhoto queryPhotoByGoodID(Integer goodID) {
        return ctmGoodsPhotoMapper.queryByGoodID(goodID);
    }
}
