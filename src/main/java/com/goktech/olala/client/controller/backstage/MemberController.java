package com.goktech.olala.client.controller.backstage;

import com.goktech.olala.client.controller.basic.BasicController;
import com.goktech.olala.core.service.ICtmInfoService;
import com.goktech.olala.server.pojo.customer.CtmInfo;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 会员信息控制层
 */

@Controller
@RequestMapping(value = "/memberApi")
public class MemberController extends BasicController {

    @Autowired
    ICtmInfoService ctmInfoService;

    /**
     * 会员信息查询
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "queryMembers.do",method = RequestMethod.POST)
    @ResponseBody
    public List<CtmInfo> queryMembers(HttpServletRequest request) throws Exception{
        CtmInfo ctmInfo = build(request);
        List<CtmInfo> ctmInfoList = ctmInfoService.queryCmtInfoByExample(ctmInfo);
        return ctmInfoList;
    }

    /**
     * 新增会员信息
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "save.do")
    public ModelAndView saveMember(HttpServletRequest request) throws Exception{
        ModelAndView view = new ModelAndView();
        CtmInfo ctmInfo = build(request);
        int result = ctmInfoService.insertCtmInfo(ctmInfo);
        view.addObject("RESULT", result);
        view.setViewName("redirect:/memberApi/showMemberList.do");
        return view;
    }

    /**
     * 删除会员信息
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "remove.do")
    public ModelAndView remove(HttpServletRequest request) throws Exception{
        ModelAndView view = new ModelAndView();
        System.out.println("remove.do");
        String customerInfId = request.getParameter("customerInfId");
        System.out.println("ID = " + customerInfId);
        int result = ctmInfoService.removeById(customerInfId);
        view.addObject("result", result);
        view.addObject("msg", "删除成功！");
        view.setViewName("redirect:/memberApi/showMemberList.do");
        return view;
    }
    @RequestMapping(value = "/showMemberList.do")
    @ResponseBody
    public ModelAndView showMemberList(HttpServletRequest request) {
        ModelAndView view = new ModelAndView();
        List<CtmInfo> list = ctmInfoService.findAllCtmInfo();
        System.out.println("ctmInfo List = " + list);
        view.addObject("CTMINFOLIST", list);
        view.setViewName("../backstage/member-list");
        return view;
    }
    /**
     * 修改会员状态
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "updateMemberStatus.do")
    public ModelAndView updateMemberStatus(HttpServletRequest request) throws Exception{
        ModelAndView view = new ModelAndView();
        String customerId = request.getParameter("customerId");
        String status = request.getParameter("status");
        if(StringUtils.isBlank(customerId) || StringUtils.isBlank(status)){
            view.addObject("result", -1);
            view.addObject("msg", "输入参数错误！");
            return view;
        }
        int result = ctmInfoService.updateStatus(customerId, Integer.parseInt(status));
        view.addObject("result", result);
        view.addObject("msg", "操作成功！");
        return view;
    }



    /**
     * 构建查询实体类
     *
     * @param request
     * @return
     */
    private CtmInfo build(HttpServletRequest request){
        CtmInfo ctmInfo = new CtmInfo();
//        String customerStatus = request.getParameter("customerStatus");
//        String customerId = request.getParameter("customerId");
//        String birthday = request.getParameter("birthday");
//        String customerInfId = request.getParameter("customerInfId");
//        String customerLevel = request.getParameter("customerLevel");
//        String customerName = request.getParameter("customerName");
//        String realName = request.getParameter("realName");
//        String email = request.getParameter("email");
//        String gender = request.getParameter("gender");
//        String identyCardNo = request.getParameter("identyCardNo");
//        String identyCardType = request.getParameter("identyCardType");
//        String userBalance = request.getParameter("identyCardNo");
//        String userMobile = request.getParameter("identyCardNo");
//        String userPoint = request.getParameter("identyCardNo");
//
//        ctmInfo.setCustomerInfId(customerInfId);
//        ctmInfo.setCustomerId(customerId);
//        ctmInfo.setCustomerName(customerName);
//        ctmInfo.setRealName(realName);
//        ctmInfo.setEmail(email);
//        if(StringUtils.isNotBlank(gender)){
//            ctmInfo.setGender(Integer.valueOf(gender));
//        }
//        ctmInfo.setIdentyCardNo(identyCardNo);
//        if(StringUtils.isNotBlank(identyCardType)){
//            ctmInfo.setIdentyCardType(Integer.valueOf(identyCardType));
//        }
//        ctmInfo.setBirthday(birthday);
//        if(StringUtils.isNotBlank(customerLevel)){
//            ctmInfo.setCustomerLevel(Integer.valueOf(customerLevel));
//        }
//        if(StringUtils.isNotBlank(customerStatus)){
//            ctmInfo.setCustomerStatus(Integer.valueOf(customerStatus));
//        }
//        if(StringUtils.isNotBlank(userBalance)){
//            ctmInfo.setUserBalance(Integer.valueOf(userBalance));
//        }
//        ctmInfo.setUserMobile(userMobile);
//        if(StringUtils.isNotBlank(customerStatus)){
//            ctmInfo.setUserPoint(Integer.valueOf(userPoint));
//        }
        String userName = request.getParameter("username");
        String sex = request.getParameter("sex");
        Integer gender = 0;
        if(sex.equals("male"))
            gender = 2;
        else if(sex.equals("female"))
            gender = 1;
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        ctmInfo.setUserMobile(mobile);
        ctmInfo.setEmail(email);
        ctmInfo.setCustomerName(userName);
        ctmInfo.setGender(gender);
        String id = getRandomID();
        ctmInfo.setCustomerId(id);
        ctmInfo.setCustomerInfId(id);
        return ctmInfo;
    }
    static public String getRandomID(){  // 随机生成11位字符串作为ID
        return RandomStringUtils.randomAlphanumeric(11);
    }
}
