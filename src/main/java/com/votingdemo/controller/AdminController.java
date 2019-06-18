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
}
