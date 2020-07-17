package com.goktech.olala.client.controller.sys;

import com.goktech.olala.client.controller.basic.BasicController;
import com.goktech.olala.core.service.ISysUserService;
import com.goktech.olala.server.pojo.sys.SysUser;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/sysUser")
public class SysUserController extends BasicController {

    @Autowired
    ISysUserService sysUserService;

    // 登陆错误信息
    private String errorMsg;

    private static final String toLogin = "toLogin";//跳转到登陆界面
    private static final String toLoginRedirect = "toLoginRedirect";//跳转到登陆界面
    private static final String toIndex = "toIndex";//跳转到门户首页

    @RequestMapping(value = "/login.do")
    @ResponseBody
    public ModelAndView login(HttpServletRequest request) throws Exception {
        String userName = request.getParameter("userName");
        String pwd = request.getParameter("pwd");
        ModelAndView view = new ModelAndView();
        view.addObject("result", "0");

        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(userName, pwd);
        subject.login(token);//会跳到我们自定义的realm中
        SysUser sysUser = new SysUser();
        sysUser.setUserName(userName);
        sysUser.setPassword(pwd);
        sysUser = sysUserService.querySysUserInfoByExample(sysUser);
        if(null != sysUser){
            request.getSession().setAttribute("sysUser", sysUser);
            view.addObject("result", "1");
            logUtil.info(sysUser.toString());
        }
        view.addObject("SYSUSER",sysUser);
        view.setViewName("home/login");
        return view;
    }

    @RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request) {
        ModelAndView view = new ModelAndView();
        request.getSession().invalidate();
        view.setViewName("home/login");
        return view;
    }

}
