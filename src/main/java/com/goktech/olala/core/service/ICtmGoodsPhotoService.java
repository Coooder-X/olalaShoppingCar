package com.goktech.olala.core.service;

import com.goktech.olala.server.pojo.customer.CtmGoodsPhoto;

public interface ICtmGoodsPhotoService {
    CtmGoodsPhoto queryPhotoByGoodID(Integer goodID);
}
