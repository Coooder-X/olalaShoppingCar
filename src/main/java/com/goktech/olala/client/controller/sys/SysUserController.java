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
import java.text.SimpleDateFormat;
import java.util.Date;

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
        request.setCharacterEncoding("UTF-8");
        System.out.println("登陆");
        String userName = request.getParameter("userName");
        String pwd = request.getParameter("pwd");
        System.out.println(userName + " " + pwd);
        ModelAndView view = new ModelAndView();
        view.addObject("result", "0");

//        Subject subject = SecurityUtils.getSubject();
//        UsernamePasswordToken token = new UsernamePasswordToken(userName, pwd);
//        subject.login(token);//会跳到我们自定义的realm中
        SysUser sysUser = new SysUser();
        sysUser.setUserName(userName);
        sysUser.setPassword(pwd);
        System.out.println(sysUser);
        sysUser = sysUserService.querySysUserInfoByExample(sysUser);
        /*
        * 此处只实现了通过用户名登陆，
        * 应新增通过邮箱、手机登陆实现。
        * */
        if(null != sysUser){
            System.out.println("存在");
            request.getSession().setAttribute("sysUser", sysUser);
            view.addObject("result", "1");
            logUtil.info(sysUser.toString());
        }
        else{
            System.out.println("用户不存在");
            request.setAttribute("errorMsg", "账号或密码错误！！！");
            view.setViewName("forward:/business/home/login.jsp");
            return view;
        }
        view.addObject("SYSUSER",sysUser);
        System.out.println("要跳了");
        view.setViewName("home/index");
        return view;
    }

    @RequestMapping("/register")    //  使用邮箱注册
    public ModelAndView register(HttpServletRequest request){
        System.out.println("注册");
        String userName = request.getParameter("email");
        String pwd = request.getParameter("password");
        ModelAndView view = new ModelAndView();
        SysUser sysUser = new SysUser(userName, pwd);
        sysUser = sysUserService.querySysUserInfoByName(userName);
        if(sysUser != null){    //  用户已存在，返回登陆页面
            System.out.println("用户已存在");
            request.setAttribute("errorMsg", "用户已存在！");
            view.setViewName("home/register");
            return  view;
        }else{
            sysUser = new SysUser(userName, pwd);
        }
        System.out.println(userName + " " + pwd);
        sysUser.setEmail(userName);
        sysUser.setStatus((byte) 1);
        sysUser.setCreateBy(userName);  //  邮箱注册，但用户名为not null字段，在此默认设为邮箱
        sysUser.setCreateTime(new Date());
        System.out.println(sysUser);
        sysUserService.addUser(sysUser);
        System.out.println("要跳了");
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
