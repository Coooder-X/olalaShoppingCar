package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.resp.RespRoleVo;
import com.goktech.olala.core.service.ISysRoleService;
import com.goktech.olala.server.dao.sys.SysRoleDao;
import com.goktech.olala.server.pojo.sys.SysRole;
import com.goktech.olala.server.pojo.sys.SysUserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

@Service("sysRoleService")
public class SysRoleServiceIml implements ISysRoleService {

    @Autowired
    SysRoleDao sysRoleDao;

    @Override
    public SysRole findOne(String roleId) {
        return null;
    }

    @Override
    public void store(SysRole role) {

    }

    @Override
    public void store(SysUserRole userRole) {

    }

    @Override
    public SysRole findOneByName(String name) {
        return null;
    }

    @Override
    public List<RespRoleVo> getRoles(String userId) {
        return null;
    }
}
