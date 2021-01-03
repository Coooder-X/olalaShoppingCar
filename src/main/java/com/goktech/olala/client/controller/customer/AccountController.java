package com.goktech.olala.client.controller.customer;

import com.goktech.olala.client.controller.basic.BasicController;
import com.goktech.olala.core.service.ICtmInfoService;
import com.goktech.olala.core.service.ISysUserService;
import com.goktech.olala.server.pojo.customer.CtmInfo;
import com.goktech.olala.server.pojo.customer.CtmLogin;
import com.goktech.olala.server.pojo.sys.SysUser;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Random;

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
        CtmLogin tmp = new CtmLogin(userName, pwd);
        CtmLogin ctmLogin = iCtmInfoService.queryCmtInfoForLogin(userName, pwd);
        if(ctmLogin == null){
            System.out.println("用户不存在");
            request.setAttribute("errorMsg", "账号或密码错误！！！");
            view.setViewName("forward:/business/home/login.jsp");
            return view;
        }
        ctmLogin.setUserStatus(true);   //  设置用户状态为已登陆
        System.out.println(ctmLogin);
        view.addObject("CTMLOGIN", ctmLogin);
        request.getSession().setAttribute("USERINFO",ctmLogin.getLoginName());
        request.getSession().setAttribute("CTMLOGIN",ctmLogin);
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
        String email = request.getParameter("email");
        String pwd = request.getParameter("password");

        ModelAndView view = new ModelAndView();
        CtmLogin ctmLogin = iCtmInfoService.queryCmtInfoForLoginByName(email);// 在登陆表中判断用户是否存在
        CtmInfo tmp = iCtmInfoService.queryCmtInfoForReg(email);//  可能有已注册的用户未登陆过，因此在用户表中也要判断存在
        if(ctmLogin != null || tmp != null){    //  用户已存在，返回登陆页面
            System.out.println("用户已存在");
            request.setAttribute("errorMsg", "用户已存在！");
            view.setViewName("home/register");
            return view;
        }else{
            ctmLogin = new CtmLogin(email, pwd);
            ctmLogin.setUserStatus(false);      //  此时状态还是未登录
            do{
                String cmtID = getRandomID();  // 随机生成11位字符串作为cmtID
                ctmLogin.setModifiedTime(new Date());
                if((CtmLogin)iCtmInfoService.queryCmtLoginByID(cmtID) == null){//保证id唯一
                    ctmLogin.setCustomerId(cmtID);
                    break;
                }
            }while(true);
        }
        System.out.println("注册用户：" + email + " " + pwd);
        System.out.println(ctmLogin);
        iCtmInfoService.saveCmtLogin(ctmLogin); //  保存登陆表信息
        CtmInfo ctmInfo = new CtmInfo();
        if(email.contains("@")){    //  判断邮箱或手机号登陆
            ctmInfo.setEmail(email);
        }else{
            ctmInfo.setUserMobile(email);
        }
        System.out.println("ctmInfo = " + ctmInfo);
        iCtmInfoService.saveCmtInfo(ctmInfo);   //  保存用户表信息

        view.setViewName("home/login");
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

    public String getRandomID(){  // 随机生成11位字符串作为ID
        return RandomStringUtils.randomAlphanumeric(11);
    }
}
