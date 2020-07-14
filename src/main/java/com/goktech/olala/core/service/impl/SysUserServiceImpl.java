package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.service.ISysUserService;
import com.goktech.olala.server.dao.sys.SysUserMapper;
import com.goktech.olala.server.pojo.sys.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("sysUserService")
public class SysUserServiceImpl implements ISysUserService {

    @Autowired
    SysUserMapper sysUserMapper;

    @Override
    public SysUser querySysUserInfoById(Long userId) {
        return sysUserMapper.selectByPrimaryKey(userId);
    }

    @Override
    public SysUser querySysUserInfoByExample(SysUser sysUser) {
        return sysUserMapper.selectByExample(sysUser);
    }
}
