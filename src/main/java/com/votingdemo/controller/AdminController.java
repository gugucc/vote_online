package com.votingdemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("")
public class AdminController {

    @RequestMapping("index")
    public ModelAndView index(){
        ModelAndView mv=new ModelAndView("/index");
        return mv;
    }

    @RequestMapping("welcome")
    public ModelAndView welcome(){
        ModelAndView mv=new ModelAndView("/welcome");
        return mv;
    }

    @RequestMapping("admin-add")
    public ModelAndView adminadd(){
        ModelAndView mv=new ModelAndView("/admin-add");
        return mv;
    }

    @RequestMapping("admin-list")
    public ModelAndView adminlist(){
        ModelAndView mv=new ModelAndView("/admin-list");
        return mv;
    }

    @RequestMapping("cate")
    public ModelAndView cate(){
        ModelAndView mv=new ModelAndView("/cate");
        return mv;
    }

    @RequestMapping("error")
    public ModelAndView error(){
        ModelAndView mv=new ModelAndView("/error");
        return mv;
    }

    @RequestMapping("login")
    public ModelAndView login(){
        ModelAndView mv=new ModelAndView("/login");
        return mv;
    }

    @RequestMapping("member-del")
    public ModelAndView memberdel(){
        ModelAndView mv=new ModelAndView("/member-del");
        return mv;
    }

    @RequestMapping("member-list1")
    public ModelAndView memberlist1(){
        ModelAndView mv=new ModelAndView("/member-list1");
        return mv;
    }

    @RequestMapping("order-add")
    public ModelAndView orderadd(){
        ModelAndView mv=new ModelAndView("/order-add");
        return mv;
    }

    @RequestMapping("order-list")
    public ModelAndView orderlist(){
        ModelAndView mv=new ModelAndView("/order-list");
        return mv;
    }

    @RequestMapping("order-list1")
    public ModelAndView orderlist1(){
        ModelAndView mv=new ModelAndView("/order-list1");
        return mv;
    }

    @RequestMapping("welcome1")
    public ModelAndView welcome1(){
        ModelAndView mv=new ModelAndView("/welcome1");
        return mv;
    }

    @RequestMapping("echarts4")
    public ModelAndView echarts4(){
        ModelAndView mv=new ModelAndView("/echarts4");
        return mv;
    }

}
