package com.goktech.olala.client.controller.customer;

import com.goktech.olala.client.controller.basic.BasicController;
import com.goktech.olala.core.service.ICtmInfoService;
import com.goktech.olala.core.service.ISysUserService;
import com.goktech.olala.server.pojo.customer.CtmLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/cntApi")
public class AccountController extends BasicController {

    /**
     * 前台登录
     *
     * @param request
     * @return
     * @throws Exception
     */
    @Autowired
    ICtmInfoService iCtmInfoService;

    @RequestMapping(value = "/login.do")
    @ResponseBody
    public ModelAndView login(HttpServletRequest request) throws Exception {
        System.out.println("登陆");
        String userName = request.getParameter("userName");
        String pwd = request.getParameter("pwd");

        ModelAndView view = new ModelAndView();
        CtmLogin ctmLogin = iCtmInfoService.queryCmtInfoForLogin(userName, pwd);
        System.out.println(ctmLogin);
        if(ctmLogin == null){
            System.out.println("用户不存在");
            request.setAttribute("errorMsg", "账号或密码错误！！！");
            view.setViewName("forward:/business/home/login.jsp");
            return view;
        }
        view.addObject("CTMLOGIN", ctmLogin);
        request.getSession().setAttribute("USERINFO","");
        view.setViewName("home/index");

        return view;
    }

    /**
     * 前台注册
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/register.do")
    @ResponseBody
    public ModelAndView register(HttpServletRequest request) throws Exception {
        System.out.println("注册");
        String userName = request.getParameter("userName");
        String pwd = request.getParameter("pwd");




        ModelAndView view = new ModelAndView();

        return view;
    }

    /**
     * 退出登录
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/loginOut.do")
    @ResponseBody
    public ModelAndView loginOut(HttpServletRequest request) throws Exception {
        request.getSession().removeAttribute("USERINFO");

        ModelAndView view = new ModelAndView();

        return view;
    }
}
