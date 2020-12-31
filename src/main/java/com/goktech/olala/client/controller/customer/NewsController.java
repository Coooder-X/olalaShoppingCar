package com.goktech.olala.client.controller.customer;

import com.goktech.olala.core.service.ICtmNewsService;
import com.goktech.olala.server.pojo.customer.CtmNews;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/ad")
public class NewsController {

    @Autowired
    ICtmNewsService iCtmNewsService;

    @RequestMapping(value = "/news.do")
    @ResponseBody
    public ModelAndView queryNews(){
        List<CtmNews> list = iCtmNewsService.q();
        ModelAndView view = new ModelAndView();
        view.addObject("List",list);
        view.setViewName("home/test");
        return view;

    }





}
