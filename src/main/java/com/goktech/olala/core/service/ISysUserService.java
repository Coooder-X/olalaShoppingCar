package com.goktech.olala.core.service;

import com.goktech.olala.core.resp.RespPermissionVo;
import com.goktech.olala.core.resp.RespUserVo;
import com.goktech.olala.server.pojo.sys.SysUser;

import java.util.Collection;
import java.util.List;

public interface ISysUserService {

    SysUser querySysUserInfoById(Long userId);

    SysUser querySysUserInfoByExample(SysUser sysUser);

    RespUserVo findOneByUsername(String userName);

    public RespPermissionVo findOne(String permissionId);

    public List<RespPermissionVo> getPermissionByRole(String roleId);

    public List<RespPermissionVo> getPermissionByUser(String userId);

    public void store(RespPermissionVo permission);

    public RespPermissionVo findOneByName(String name);

    public int addUser(SysUser user);
}
