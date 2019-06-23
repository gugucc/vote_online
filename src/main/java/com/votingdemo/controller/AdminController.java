package com.votingdemo.controller;

import com.votingdemo.entity.Admin;
import com.votingdemo.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.xml.registry.infomodel.User;
import java.io.IOException;

@Controller
@RequestMapping("")
public class AdminController {
    @Autowired
    private AdminService adminService;
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

    @RequestMapping(value="/login_Action",method= RequestMethod.POST)
    @ResponseBody
    public ModelAndView login(@RequestParam String username, @RequestParam String password, HttpServletResponse response, Model model) throws IOException {
        System.out.println("用户登录："+username+password);
        Admin admin= adminService.login(username,password);
        if (admin!=null){
            model.addAttribute("username",username);
            ModelAndView mv=new ModelAndView("index","model1",model);
            return mv;
        }else {
            ModelAndView mv=new ModelAndView("login","model1",model);
            return mv;
        }
    }

    @RequestMapping("member-list1")
    public ModelAndView memberlist1(){
        ModelAndView mv=new ModelAndView("/member-list1");
        return mv;
    }

    @RequestMapping("vote-add")
    public ModelAndView voteadd(){
        ModelAndView mv=new ModelAndView("vote-add");
        return mv;
    }

    @RequestMapping("vote-list")
    public ModelAndView votelist(){
        ModelAndView mv=new ModelAndView("vote-list");
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

    @RequestMapping("singer-add")
    public ModelAndView singeradd(){
        ModelAndView mv=new ModelAndView("/singer-add");
        return mv;
    }

}
