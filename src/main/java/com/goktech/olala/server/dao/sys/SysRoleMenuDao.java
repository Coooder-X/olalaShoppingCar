package com.goktech.olala.server.dao.sys;

import com.goktech.olala.server.pojo.sys.SysRoleMenu;
import java.util.List;

public interface SysRoleMenuDao {
    int deleteByPrimaryKey(Long rmId);

    int insert(SysRoleMenu record);

    SysRoleMenu selectByPrimaryKey(Long rmId);

    List<SysRoleMenu> selectAll();

    int updateByPrimaryKey(SysRoleMenu record);
}