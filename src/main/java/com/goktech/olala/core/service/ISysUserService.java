package com.goktech.olala.core.service;

import com.goktech.olala.server.pojo.sys.SysUser;

public interface ISysUserService {

    SysUser querySysUserInfoById(Long userId);

    SysUser querySysUserInfoByExample(SysUser sysUser);

}
