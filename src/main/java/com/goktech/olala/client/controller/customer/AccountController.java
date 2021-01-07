package com.goktech.olala.client.controller.customer;

import com.goktech.olala.client.controller.basic.BasicController;
import com.goktech.olala.core.service.ICtmGoodsClassService;
import com.goktech.olala.core.service.ICtmInfoService;
import com.goktech.olala.core.service.ICtmsearchService;
import com.goktech.olala.core.service.ISysUserService;
import com.goktech.olala.server.pojo.customer.*;
import com.goktech.olala.server.pojo.sys.SysUser;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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

    @Autowired
    ICtmGoodsClassService ctmGoodsClassService;

    @Autowired
    ICtmsearchService ctmsearchService;

    List<CtmGoodsinfo> goodList = new ArrayList<CtmGoodsinfo>();

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
        CtmInfo ctmInfo = iCtmInfoService.queryCtmInfoByCtmID(ctmLogin.getCustomerId());
//        System.out.println("USERINFO 插入" + ctmInfo);
//        List<CtmConsignee> list = iCtmInfoService.findAllAddress(ctmInfo.getCustomerId());
//        System.out.println(list);
//        request.getSession().setAttribute("ADDLIST", list);
        request.getSession().setAttribute("USERINFO",ctmInfo);
        request.getSession().setAttribute("CTMLOGIN",ctmLogin);
        view.setViewName("home/index");

        //-------------------------------------------------

        //二级内容
        List<CTMSecondMenuDirction> secondMenuNumber = iCtmInfoService.querySecondMenuNumber();
        System.out.println(secondMenuNumber);
        for(CTMSecondMenuDirction it: secondMenuNumber){
            System.out.println("lyh 6666");
            if(it == null) break;
            System.out.println(it.getGood_name() + " " + it.getGood_id());
        }
        List<String> secondMenuHouseHold = iCtmInfoService.querySecondMenu("1");
        List<String> secondMenuTV = iCtmInfoService.querySecondMenu("56");
        List<String> secondMenuairConditioner = iCtmInfoService.querySecondMenu("57");
        List<String> secondMenuWashingMeachine = iCtmInfoService.querySecondMenu("58");
        List<String> secondMenuBussinessOne = iCtmInfoService.querySecondMenuBussiness("1");
        List<String> secondMenuBussinessTwo = iCtmInfoService.querySecondMenuBussiness("2");
        System.out.println("2222222 lyh");
        for(String it: secondMenuHouseHold){
            System.out.println(it);
        }
        request.getSession().setAttribute("secondMenuHouseHold", secondMenuHouseHold);
        request.getSession().setAttribute("secondMenuTV", secondMenuTV);
        request.getSession().setAttribute("secondMenuairConditioner", secondMenuairConditioner);
        request.getSession().setAttribute("secondMenuWashingMeachine", secondMenuWashingMeachine);
        request.getSession().setAttribute("secondMenuBussinessOne", secondMenuBussinessOne);
        request.getSession().setAttribute("secondMenuBussinessTwo", secondMenuBussinessTwo);

        //----------------------------------------------------

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
        ctmInfo.setCustomerId(ctmLogin.getCustomerId());
        ctmInfo.setCustomerInfId(ctmLogin.getCustomerId());
        if(email.contains("@")){    //  判断邮箱或手机号登陆
            ctmInfo.setEmail(email);
        }else{
            ctmInfo.setUserMobile(email);
        }
        System.out.println("ctmInfo = " + ctmInfo);
        iCtmInfoService.insertCtmInfo(ctmInfo);   //  保存用户表信息

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

    static public String getRandomID(){  // 随机生成11位字符串作为ID
        return RandomStringUtils.randomAlphanumeric(11);
    }

    @RequestMapping(value = "/userInfo.do")
    @ResponseBody
    public ModelAndView updateInfo(HttpServletRequest request) throws Exception {
        CtmInfo oldCtmInfo = (CtmInfo) request.getSession().getAttribute("USERINFO");
        System.out.println("oldCtmInfo = " + oldCtmInfo);
        System.out.println("设置用户信息");
        ModelAndView modelAndView = new ModelAndView();
        String nickName = request.getParameter("user-name2");
        String name = request.getParameter("user-name");
        Integer gender = 0;
        String sex = request.getParameter("radio10");
        nickName = nickName.isEmpty()? oldCtmInfo.getCustomerName() : nickName;
        name = name.isEmpty()? oldCtmInfo.getRealName() : name;
        if(sex == null)
            gender = oldCtmInfo.getGender();
        else{
            if(sex.equals("male")){
                gender = 2;
            }else if(sex.equals("female")){
                gender = 1;
            }else{
                gender = 0;
            }
        }
        /*
        * 生日补上
        * */
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("date");
        String birthday = year + "-" + month + "-" + day;

        if(year == null || month == null || day == null)
            birthday = oldCtmInfo.getBirthday();
        oldCtmInfo.setBirthday(birthday);

        String phone = request.getParameter("user-phone");
        phone = phone.isEmpty()? oldCtmInfo.getUserMobile() : phone;
        String email = request.getParameter("user-email");
        email = email.isEmpty()? oldCtmInfo.getEmail() : email;
        oldCtmInfo.setCustomerName(nickName);
        oldCtmInfo.setRealName(name);
        oldCtmInfo.setGender(gender);
        oldCtmInfo.setEmail(email);
        oldCtmInfo.setUserMobile(phone);
        System.out.println(oldCtmInfo);
        iCtmInfoService.saveCmtInfo(oldCtmInfo);
        request.getSession().setAttribute("USERINFO",oldCtmInfo);

        modelAndView.setViewName("home/index");
        return modelAndView;
    }

    @RequestMapping(value = "/changepwd.do")
    @ResponseBody
    public ModelAndView changePwd(HttpServletRequest request) {
        ModelAndView view = new ModelAndView();
        System.out.println("修改密码");
        CtmLogin oldUser = (CtmLogin) request.getSession().getAttribute("CTMLOGIN");
        System.out.println("olduser = " + oldUser);
        String ctmID = oldUser.getCustomerId();
        String oldpwd = (String) request.getParameter("user-old-password");
        String newpwd = (String) request.getParameter("user-new-password");
        String reptpwd = (String) request.getParameter("user-confirm-password");
        System.out.println("newpwd = " + newpwd);
        System.out.println("oldpwd = " + oldpwd);
        System.out.println("rpt = " + reptpwd);
        Integer num = iCtmInfoService.updatePwdByID(ctmID, newpwd);
        System.out.println("num = " + num);

        view.setViewName("person/safety");
        return view;
    }

    @RequestMapping(value = "/addAddress.do")
    @ResponseBody
    public ModelAndView addAddress(HttpServletRequest request) {
        ModelAndView view = new ModelAndView();
        System.out.println("增加地址");
        String userName = request.getParameter("user-name");
        String phone = request.getParameter("user-phone");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String area = request.getParameter("area");
        String dedails = request.getParameter("user-intro");
//        System.out.println(userName + " " + phone + " " + province);
        CtmConsignee consignee = new CtmConsignee();
        CtmInfo  ctmInfo = (CtmInfo) request.getSession().getAttribute("USERINFO");

        consignee.setCustomerId(ctmInfo.getCustomerId());
        consignee.setProvince(province);
        consignee.setCity(city);
        consignee.setDistrict(area);
        consignee.setAddress(dedails);
        consignee.setUserName(userName);
        consignee.setPhone(phone);

        System.out.println(consignee);
        Integer num = iCtmInfoService.saveAddress(consignee);
        System.out.println("num = " + num);

        view.setViewName("redirect:/cntApi/listAddress.do");
        return view;
    }

    @RequestMapping(value = "/listAddress.do")
//    @ResponseBody
    public ModelAndView showListAddress(HttpServletRequest request) {
        ModelAndView view = new ModelAndView();
        System.out.println("/listAddress.do");
        CtmInfo ctmInfo = (CtmInfo) request.getSession().getAttribute("USERINFO");
        List<CtmConsignee> list = iCtmInfoService.findAllAddress(ctmInfo.getCustomerId());
        System.out.println(list);
        view.addObject("ADDLIST", list);
        view.setViewName("/person/address");
        return view;
    }

    @RequestMapping(value = "/deleteAddress.do")
    @ResponseBody
    public ModelAndView deleteAddress(Integer addID, HttpServletRequest request) {
        ModelAndView view = new ModelAndView();
        System.out.println(addID);
        Integer num = iCtmInfoService.removeAddByAddId(addID);
        System.out.println("delete " + num + " 条");

        CtmInfo ctmInfo = (CtmInfo) request.getSession().getAttribute("USERINFO");
        List<CtmConsignee> list = iCtmInfoService.findAllAddress(ctmInfo.getCustomerId());
        System.out.println(list);
        view.addObject("ADDLIST", list);
        view.setViewName("redirect:/cntApi/listAddress.do");
        return view;
    }

    @RequestMapping(value = "/setDefaultAddress.do")
//    @ResponseBody
    public ModelAndView setDefaultAddress(Integer addID, HttpServletRequest request) {
        System.out.println("setDefaultAddress.do");
        /*
        * 待做： 在设置本条地址为默认时，先把所有地址设为非默认
        * */
        ModelAndView view = new ModelAndView();
        System.out.println(addID);
        CtmConsignee consignee = iCtmInfoService.queryAddress(addID);
        consignee.setIsDefault(true);
        Integer num = iCtmInfoService.updateAdd(consignee);
        System.out.println("更新了 " + num + " 条");

        view.setViewName("redirect:/cntApi/listAddress.do");
        return view;
    }
    @RequestMapping(value = "/to_updateAddress.do")
    @ResponseBody
    public ModelAndView toUpdateAddress(Integer addID, HttpServletRequest request) {
        System.out.println("to_updateAddress.do");
        ModelAndView view = new ModelAndView();

        CtmConsignee consignee = iCtmInfoService.queryAddress(addID);
        view.addObject("oldAddress", consignee);
        view.addObject("addID", addID);
        view.setViewName("/person/address_update");
        return view;
    }
    @RequestMapping(value = "/updateAddress.do")
    @ResponseBody
    public ModelAndView updateAddress(Integer addID, HttpServletRequest request) {
        System.out.println("updateAddress.do");
        ModelAndView view = new ModelAndView();
        System.out.println("修改地址");
        CtmConsignee oldAdd = iCtmInfoService.queryAddress(addID);

        String userName = request.getParameter("user-name");
        String phone = request.getParameter("user-phone");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String area = request.getParameter("area");
        String dedails = request.getParameter("user-intro");
        CtmInfo  ctmInfo = (CtmInfo) request.getSession().getAttribute("USERINFO");

        if(!userName.isEmpty())
            oldAdd.setUserName(userName);
        if(!phone.isEmpty())
            oldAdd.setPhone(phone);
        if(!province.isEmpty())
            oldAdd.setProvince(province);
        if(!city.isEmpty())
            oldAdd.setCity(city);
        if(!area.isEmpty())
            oldAdd.setDistrict(area);
        if(!dedails.isEmpty())
            oldAdd.setAddress(dedails);

        System.out.println(oldAdd);
        iCtmInfoService.updateAdd(oldAdd);

        view.setViewName("redirect:/cntApi/listAddress.do");
        return view;
    }

    /*
    * Hui
    *
    * */
    @RequestMapping(value = "/search.do")
    @ResponseBody
    public ModelAndView serach(HttpServletRequest request) throws  Exception{
        String searchInput = request.getParameter("index_none_header_sysc");
        if(searchInput == null || searchInput.equals("")){
            ModelAndView view = new ModelAndView();
            view.setViewName("/home/search");
            return view;
        }
        ModelAndView view = new ModelAndView();
        List<CtmGoodsinfos> ctmGoods = ctmsearchService.select(searchInput);
        request.setAttribute("SEARCHLIST", ctmGoods);
        System.out.println(ctmGoods);

        view.setViewName("/home/search");
        return view;
    }

    @RequestMapping(value = "/GoodsClass.do")
    @ResponseBody
    public ModelAndView GoodsClass(HttpServletRequest request) throws  Exception{
        ModelAndView view = new ModelAndView();
        List<CtmGoodsClass> ctmGoodsClass = ctmGoodsClassService.select();
        // request.setAttribute("ctmGoodsClass",ctmGoodsClass);
        view.addObject("ctmGoodsClass",ctmGoodsClass);
        view.setViewName("home/index");
        return view;
    }
    @RequestMapping(value = "/purchase.do")
    public  ModelAndView purchase(HttpServletRequest request) throws  Exception{
        ModelAndView view = new ModelAndView();
        String item =  request.getParameter("item");
        CtmInfo ctmInfo = (CtmInfo) request.getSession().getAttribute("USERINFO");
        String id = ctmInfo.getCustomerId();
//        String id =  request.getParameter("id");/////////////////////////
        CtmGoodsinfo goodsinfo = ctmsearchService.selectone(item , id);
        int i = 0;
        for(i = 0 ; i < goodList.size() ; i++){
            if(goodList.get(i).equals(goodsinfo)){
                goodsinfo = goodList.get(i);
                break;
            }
        }
        goodsinfo.setSum(1);
        goodList.set(i , goodsinfo);
        view.setViewName("home/shopcart");
        return view;
    }
    @RequestMapping(value = "/delete.do")
    public  ModelAndView delete(HttpServletRequest request) throws  Exception{
        ModelAndView view = new ModelAndView();
        String item =  request.getParameter("item");
        String id =  request.getParameter("id");
        CtmGoodsinfo goodsinfo = ctmsearchService.selectone(item , id);
        for(CtmGoodsinfo goods : goodList){
            if(goods.getGoodID() == id){
                goodList.remove(goods);
                break;
            }
        }
        view.setViewName("home/shopcart");
        return view;
    }
    @RequestMapping(value = "/pay.do")
    public ModelAndView pay(HttpServletRequest request) throws Exception{
        ModelAndView view = new ModelAndView();
        view.setViewName("home/shopcart");
        return view;
    }
}
