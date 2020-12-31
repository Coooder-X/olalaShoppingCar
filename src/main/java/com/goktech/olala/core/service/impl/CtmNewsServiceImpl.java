package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.service.ICtmNewsService;
import com.goktech.olala.server.dao.customer.CtmNewsMapper;
import com.goktech.olala.server.pojo.customer.CtmNews;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("iCtmNewsService")
public class CtmNewsServiceImpl implements ICtmNewsService {

    @Autowired
    CtmNewsMapper ctmNewsMapper;


    @Override
    public List<CtmNews> q() {
        return ctmNewsMapper.selectAll();
    }
}
