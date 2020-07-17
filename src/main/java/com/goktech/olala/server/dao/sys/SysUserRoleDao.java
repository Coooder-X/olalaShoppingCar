package com.goktech.olala.server.dao.sys;

import com.goktech.olala.server.pojo.sys.SysUserRole;
import java.util.List;

public interface SysUserRoleDao {
    int deleteByPrimaryKey(Long urId);

    int insert(SysUserRole record);

    SysUserRole selectByPrimaryKey(Long urId);

    List<SysUserRole> selectAll();

    int updateByPrimaryKey(SysUserRole record);
}