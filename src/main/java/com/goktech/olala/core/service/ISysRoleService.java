package com.goktech.olala.core.service;

import com.goktech.olala.core.resp.RespRoleVo;
import com.goktech.olala.core.resp.RespUserVo;
import com.goktech.olala.server.pojo.sys.SysRole;
import com.goktech.olala.server.pojo.sys.SysUser;
import com.goktech.olala.server.pojo.sys.SysUserRole;

import java.util.Collection;
import java.util.List;

public interface ISysRoleService {

    public SysRole findOne(String roleId);
    public void store(SysRole role);
    public void store(SysUserRole userRole);
    public SysRole findOneByName(String name);
    public List<RespRoleVo> getRoles(String userId);
}
