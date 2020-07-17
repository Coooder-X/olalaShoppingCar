package com.goktech.olala.core.config;

import com.goktech.olala.core.resp.RespUserVo;
import com.goktech.olala.core.service.ISysRoleService;
import com.goktech.olala.core.service.ISysUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.stream.Collectors;

/**
 *Realm接口实现类
 */
public class AuthRealm extends AuthorizingRealm {

    @Autowired
    private ISysRoleService sysRoleService;

    @Autowired
    private ISysUserService sysUserService;

    /**
     * 用来为当前登陆成功的用户授予权限和角色（已经登陆成功了）
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(
            PrincipalCollection principals) {
        //获取用户名
        //String username = (String) principals.getPrimaryPrincipal();
        //获取当前用户
        RespUserVo userVo = (RespUserVo) principals.fromRealm(getName()).iterator().next();
        //得到权限字符串
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

        info.addRoles(sysRoleService.getRoles(userVo.getUserId())
                .stream().map(respRoleVo -> respRoleVo.getRoleName()).collect(Collectors.toList()));
        info.addStringPermissions(sysUserService.getPermissionByUser(userVo.getUserId())
                .stream().map(respPermissionVo -> respPermissionVo.getPermissionName()).collect(Collectors.toList()));
        return info;
    }

    /**
     * 用来验证当前登录的用户，获取认证信息
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken upToken = (UsernamePasswordToken) authcToken;

        RespUserVo userVo = sysUserService.findOneByUsername(upToken.getUsername());
        if (userVo == null) {
            return null;
        } else {
            AuthenticationInfo info = new SimpleAuthenticationInfo(userVo, userVo.getPassword(), getName());
            return info;
        }
    }

}
