package com.goktech.olala.core.resp;

import java.io.Serializable;

/**
 * 角色视图
 */
public class RespRoleVo implements Serializable {

     private Long roleId;
     private String roleName;
     private String description;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
