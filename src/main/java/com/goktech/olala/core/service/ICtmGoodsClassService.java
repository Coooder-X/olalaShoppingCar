package com.goktech.olala.core.service;

import com.goktech.olala.server.pojo.customer.CtmGoodsClass;
import org.springframework.stereotype.Service;

import java.util.List;


public interface ICtmGoodsClassService {
    List<CtmGoodsClass> select();
}
