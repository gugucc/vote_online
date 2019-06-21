package com.votingdemo.controller;

import com.votingdemo.entity.Admin;
import com.votingdemo.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller

@RequestMapping("")
public class LoginController {

    @Autowired
    private AdminService adminService;

    @RequestMapping(value="/toLogin")

    public ModelAndView login(String username, String password){
        ModelAndView view=new ModelAndView();

        Admin admin = adminService.login(username);

        if(username==null||"".equals(username)){  //没有输入姓名
            view.addObject("msg1","用户名为空");
        }else if(admin==null||"".trim().equals(admin)){ //输入姓名但是姓名错误
           view.addObject("msg1","账户不存在，请先注册");

        }else if(admin!=null &(password==null||"".equals(password))){ //姓名正确，但没有输入密码
          view.addObject("msg2","请输入密码");
        }else if(admin!=null &!(admin.getPassword().equals(password))) { //姓名正确，输入密码，但是密码错误
           view.addObject("msg2","密码错误");

        }else if (admin!=null &admin.getPassword().equals(password)){ //姓名密码均正确
            return new ModelAndView("index");
        }
        return new ModelAndView("login");





    }


    }
